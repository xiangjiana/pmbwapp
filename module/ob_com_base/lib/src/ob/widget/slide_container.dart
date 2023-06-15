import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _kDragContainerExtentPercentage = 0.25;
const double _kDragSizeFactorLimit = 1.5;
const Duration _kIndicatorSnapDuration = Duration(milliseconds: 150);
const Duration _kIndicatorScaleDuration = Duration(milliseconds: 200);

class PullSlideContainer extends StatefulWidget {
  const PullSlideContainer(this.builder);
  final PullSlideContainerBuilder builder;
  @override
  _PullSlideContainerState createState() => _PullSlideContainerState();
}

class _PullSlideContainerState extends State<PullSlideContainer> {
  @override
  Widget build(BuildContext context) {
    final PullToRefreshNotificationState? ss =
    context.findAncestorStateOfType<PullToRefreshNotificationState>();
    return StreamBuilder<PullSlideScrollNotificationInfo>(
      builder: (BuildContext c,
          AsyncSnapshot<PullSlideScrollNotificationInfo> s) {
        return widget.builder(s.data);
      },
      stream: ss?.onNoticed,
    );
  }
}

typedef RefreshCallback = Future<bool> Function();

typedef PullSlideContainerBuilder = Widget Function(
    PullSlideScrollNotificationInfo? info);

enum SlideIndicatorMode {
  drag, // Pointer is down.
  armed, // Dragged far enough that an up event will run the onRefresh callback.
  snap, // Animating to the indicator's final "displacement".
  refresh, // Running the refresh callback.
  done, // Animating the indicator's fade-out after refreshing.
  canceled, // Animating the indicator's fade-out after not arming.
  error, //refresh failed
}

bool defaultNotificationPredicate(ScrollNotification notification) {
  return true;
}

class PullSlideScrollNotificationInfo {
  PullSlideScrollNotificationInfo(this.mode, this.dragOffset,
      this.refreshWidget, this.pullToRefreshNotificationState);
  final SlideIndicatorMode? mode;
  final double? dragOffset;
  final Widget? refreshWidget;
  final PullToRefreshNotificationState pullToRefreshNotificationState;
}

class PullSlideNotification extends StatefulWidget {
  /// Creates a refresh indicator.
  ///
  /// The [onRefresh], [child], and [notificationPredicate] arguments must be
  /// non-null. The default
  /// [displacement] is 40.0 logical pixels.
  const PullSlideNotification({
    Key? key,
    required this.child,
    required this.onRefresh,
    this.color,
    this.pullBackOnRefresh = false,
    this.maxDragOffset,
    this.notificationPredicate = defaultNotificationPredicate,
    this.armedDragUpCancel = true,
    this.pullBackCurve = Curves.linear,
    this.reverse = false,
    this.pullBackOnError = false,
    this.pullBackDuration = const Duration(milliseconds: 400),
    this.refreshOffset,
  }) : super(key: key);

  final bool armedDragUpCancel;

  final Widget child;

  final RefreshCallback onRefresh;

  final Color? color;

  /// Whether start pull back animation when refresh.
  final bool pullBackOnRefresh;

  /// The max drag offset
  final double? maxDragOffset;

  /// The curve to use for the pullback animation
  final Curve pullBackCurve;

  //use in case much ScrollNotification from child
  final bool Function(ScrollNotification notification) notificationPredicate;

  final bool reverse;

  //The duration to use for the pullback animation
  final Duration pullBackDuration;

  /// Whether start pull back animation when refresh failed.
  final bool pullBackOnError;

  /// The offset to keep when it is refreshing
  final double? refreshOffset;

  @override
  PullToRefreshNotificationState createState() =>
      PullToRefreshNotificationState();
}

/// Contains the state for a [PullToRefreshNotification]. This class can be used to
/// programmatically show the refresh indicator, see the [show] method.
class PullToRefreshNotificationState extends State<PullSlideNotification>
    with TickerProviderStateMixin<PullSlideNotification> {
  final StreamController<PullSlideScrollNotificationInfo> _onNoticed =
  StreamController<PullSlideScrollNotificationInfo>.broadcast();
  Stream<PullSlideScrollNotificationInfo> get onNoticed =>
      _onNoticed.stream;

  late AnimationController _positionController;
  late AnimationController _scaleController;
  late Animation<double> _scaleFactor;
  late Animation<double> _value;
  Animation<Color?>? _valueColor;

  late AnimationController _pullBackController;
  Animation<double>? _pullBackFactor;

  SlideIndicatorMode? _mode;
  SlideIndicatorMode? get _refreshIndicatorMode => _mode;
  set _refreshIndicatorMode(SlideIndicatorMode? value) {
    if (_mode != value) {
      _mode = value;
      _onInnerNoticed();
    }
  }

  Future<void>? _pendingRefreshFuture;
  bool? _isIndicatorAtTop;
  double? _dragOffset;
  double? get _notificationDragOffset => _dragOffset;
  set _notificationDragOffset(double? value) {
    if (value != null) {
      value = math.max(
          0.0, math.min(value, widget.maxDragOffset ?? double.maxFinite));
    }
    if (_dragOffset != value) {
      _dragOffset = value;
      _onInnerNoticed();
    }
  }

  static final Animatable<double> _threeQuarterTween =
  Tween<double>(begin: 0.0, end: 0.75);
  static final Animatable<double> _oneToZeroTween =
  Tween<double>(begin: 1.0, end: 0.0);

  @override
  void initState() {
    super.initState();
    _positionController = AnimationController(vsync: this);
    _value = _positionController.drive(_threeQuarterTween);
    _scaleController = AnimationController(vsync: this);
    _scaleFactor = _scaleController.drive(_oneToZeroTween);
    _pullBackController = AnimationController(vsync: this);
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    _valueColor = _positionController.drive(
      ColorTween(
          begin: (widget.color ?? theme.accentColor).withOpacity(0.0),
          end: (widget.color ?? theme.accentColor).withOpacity(1.0))
          .chain(CurveTween(
          curve: const Interval(0.0, 1.0 / _kDragSizeFactorLimit))),
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _positionController.dispose();
    _scaleController.dispose();
    _pullBackController.dispose();
    _onNoticed.close();
    super.dispose();
  }

  double maxContainerExtent = 0.0;
  bool _handleScrollNotification(ScrollNotification notification) {
    final bool reuslt = _innerhandleScrollNotification(notification);
    //_onInnerNoticed();
    return reuslt;
  }

  bool _innerhandleScrollNotification(ScrollNotification notification) {
    if (!widget.notificationPredicate(notification)) {
      return false;
    }
    if (notification.depth != 0) {
      maxContainerExtent =
          math.max(notification.metrics.viewportDimension, maxContainerExtent);
    }
    if (notification is ScrollStartNotification &&
        (widget.reverse
            ? notification.metrics.extentAfter == 0.0
            : notification.metrics.extentBefore == 0.0) &&
        _refreshIndicatorMode == null &&
        _start(notification.metrics.axisDirection)) {
      //setState(() {
      _mode = SlideIndicatorMode.drag;
      //});
      return false;
    }
    bool? indicatorAtTopNow;
    switch (notification.metrics.axisDirection) {
      case AxisDirection.down:
        indicatorAtTopNow = !widget.reverse;
        break;
      case AxisDirection.up:
        indicatorAtTopNow = widget.reverse;
        break;
      case AxisDirection.left:
      case AxisDirection.right:
        indicatorAtTopNow = null;
        break;
    }
    if (indicatorAtTopNow != _isIndicatorAtTop) {
      if (_refreshIndicatorMode == SlideIndicatorMode.drag ||
          _refreshIndicatorMode == SlideIndicatorMode.armed)
        dismiss(SlideIndicatorMode.canceled);
    } else if (notification is ScrollUpdateNotification) {
      if (_refreshIndicatorMode == SlideIndicatorMode.drag ||
          _refreshIndicatorMode == SlideIndicatorMode.armed) {
        if (!widget.reverse &&
            notification.metrics.extentBefore > 0.0 &&
            notification.metrics.pixels >= 0) {
          if (_refreshIndicatorMode == SlideIndicatorMode.armed &&
              !widget.armedDragUpCancel) {
            _show();
          } else {
            dismiss(SlideIndicatorMode.canceled);
          }
        } else {
          if (widget.reverse) {
            _notificationDragOffset =
                (_notificationDragOffset ?? 0) + notification.scrollDelta!;
          } else {
            _notificationDragOffset =
                (_notificationDragOffset ?? 0) - notification.scrollDelta!;
          }

          _checkDragOffset(maxContainerExtent);
        }
      }
      if (_refreshIndicatorMode == SlideIndicatorMode.armed &&
          notification.dragDetails == null) {
        // On iOS start the refresh when the Scrollable bounces back from the
        // overscroll (ScrollNotification indicating this don't have dragDetails
        // because the scroll activity is not directly triggered by a drag).
        _show();
      }
    } else if (notification is OverscrollNotification) {
      if (_refreshIndicatorMode == SlideIndicatorMode.drag ||
          _refreshIndicatorMode == SlideIndicatorMode.armed) {
        if (widget.reverse) {
          _notificationDragOffset =
              (_notificationDragOffset ?? 0) + notification.overscroll / 2.0;
        } else {
          _notificationDragOffset =
              (_notificationDragOffset ?? 0) - notification.overscroll / 2.0;
        }
        _checkDragOffset(maxContainerExtent);
      }
    } else if (notification is ScrollEndNotification) {
      switch (_refreshIndicatorMode) {
        case SlideIndicatorMode.armed:
          _show();
          break;
        case SlideIndicatorMode.drag:
          dismiss(SlideIndicatorMode.canceled);
          break;
        default:
        // do nothing
          break;
      }
    }
    //_onInnerNoticed();
    return false;
  }

  bool _handleGlowNotification(OverscrollIndicatorNotification notification) {
    if (notification.depth != 0 || !notification.leading) {
      return false;
    }
    if (_refreshIndicatorMode == SlideIndicatorMode.drag) {
      notification.disallowGlow();
      return true;
    }
    return false;
  }

  bool _start(AxisDirection direction) {
    assert(_refreshIndicatorMode == null);
    assert(_isIndicatorAtTop == null);
    assert(_notificationDragOffset == null);
    switch (direction) {
      case AxisDirection.down:
        _isIndicatorAtTop = !widget.reverse;
        break;
      case AxisDirection.up:
        _isIndicatorAtTop = widget.reverse;
        break;
      case AxisDirection.left:
      case AxisDirection.right:
        _isIndicatorAtTop = null;
        // we do not support horizontal scroll views.
        return false;
    }
    _dragOffset = 0.0;
    _scaleController.value = 0.0;
    _positionController.value = 0.0;
    _pullBackFactor?.removeListener(pullBackListener);
    _pullBackController.reset();
    return true;
  }

  void _checkDragOffset(double containerExtent) {
    assert(_refreshIndicatorMode == SlideIndicatorMode.drag ||
        _refreshIndicatorMode == SlideIndicatorMode.armed);
    double newValue = _notificationDragOffset! /
        (containerExtent * _kDragContainerExtentPercentage);
    if (widget.maxDragOffset != null) {
      newValue = _notificationDragOffset! / widget.maxDragOffset!;
    }
    if (_refreshIndicatorMode == SlideIndicatorMode.armed)
      newValue = math.max(newValue, 1.0 / _kDragSizeFactorLimit);
    _positionController.value =
        newValue.clamp(0.0, 1.0); // this triggers various rebuilds

    if (_refreshIndicatorMode == SlideIndicatorMode.drag &&
        _valueColor!.value!.alpha == 0xFF)
      _refreshIndicatorMode = SlideIndicatorMode.armed;
  }

  // Stop showing the refresh indicator.
  Future<void> dismiss(SlideIndicatorMode newMode) async {
    await Future<void>.value();
    // This can only be called from _show() when refreshing and
    // _handleScrollNotification in response to a ScrollEndNotification or
    // direction change.
    assert(newMode == SlideIndicatorMode.canceled ||
        newMode == SlideIndicatorMode.done);
    //setState(() {
    _refreshIndicatorMode = newMode;
    //});
    switch (_refreshIndicatorMode) {
      case SlideIndicatorMode.done:
        await _scaleController.animateTo(1.0,
            duration: _kIndicatorScaleDuration);
        break;
      case SlideIndicatorMode.canceled:
        await _positionController.animateTo(0.0,
            duration: _kIndicatorScaleDuration);
        break;
      default:
        assert(false);
    }
    if (mounted && _refreshIndicatorMode == newMode && _dragOffset == 0.0) {
      _notificationDragOffset = null;
      _isIndicatorAtTop = null;
      //setState(() {
      _refreshIndicatorMode = null;
      // });
    }
    //_onInnerNoticed();
  }

  void _show() {
    assert(_refreshIndicatorMode != SlideIndicatorMode.refresh);
    assert(_refreshIndicatorMode != SlideIndicatorMode.snap);
    final Completer<void> completer = Completer<void>();
    _pendingRefreshFuture = completer.future;
    _refreshIndicatorMode = SlideIndicatorMode.snap;
    _positionController
        .animateTo(1.0 / _kDragSizeFactorLimit,
        duration: _kIndicatorSnapDuration)
        .then<void>((void value) {
      if (mounted && _refreshIndicatorMode == SlideIndicatorMode.snap) {
        final Completer<void> pullBackCompleter = Completer<void>();
        if (widget.refreshOffset != null) {
          _pullBack(end: widget.refreshOffset!)
              .whenComplete(() => pullBackCompleter.complete());
        } else {
          pullBackCompleter.complete();
        }

        pullBackCompleter.future.whenComplete(() {
          // setState(() {
          // Show the indeterminate progress indicator.
          _refreshIndicatorMode = SlideIndicatorMode.refresh;
          //});

          final Future<bool> refreshResult = widget.onRefresh();

          refreshResult.then((bool success) {
            if (mounted &&
                _refreshIndicatorMode == SlideIndicatorMode.refresh) {
              completer.complete();
              if (success) {
                dismiss(SlideIndicatorMode.done);
              } else
                _refreshIndicatorMode = SlideIndicatorMode.error;
            }
          });
        });
      }
    });
  }

  /// Show the refresh indicator and run the refresh callback as if it had
  /// been started interactively. If this method is called while the refresh
  /// callback is running, it quietly does nothing.
  ///
  /// Creating the [PullToRefreshNotification] with a [GlobalKey<RefreshIndicatorState>]
  /// makes it possible to refer to the [PullToRefreshNotificationState].
  ///
  /// The future returned from this method completes when the
  /// [PullToRefreshNotification.onRefresh] callback's future completes.
  ///
  /// If you await the future returned by this function from a [State], you
  /// should check that the state is still [mounted] before calling [setState].
  ///
  /// When initiated in this manner, the refresh indicator is independent of any
  /// actual scroll view. It defaults to showing the indicator at the top. To
  /// show it at the bottom, set `atTop` to false.
  Future<void>? show({bool atTop = true, double? notificationDragOffset}) {
    if (_refreshIndicatorMode != SlideIndicatorMode.refresh &&
        _refreshIndicatorMode != SlideIndicatorMode.snap) {
      if (_refreshIndicatorMode == null)
        _start(atTop ? AxisDirection.down : AxisDirection.up);
      if (notificationDragOffset != null) {
        _notificationDragOffset = notificationDragOffset;
      }
      _show();
    }
    return _pendingRefreshFuture;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final Widget child = NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: _handleGlowNotification,
        child: widget.child,
      ),
    );
    return child;
  }

  void _onInnerNoticed() {
    if ((_dragOffset != null && _dragOffset! > 0.0) &&
        ((_refreshIndicatorMode == SlideIndicatorMode.done &&
            !widget.pullBackOnRefresh) ||
            (_refreshIndicatorMode == SlideIndicatorMode.refresh &&
                widget.pullBackOnRefresh) ||
            _refreshIndicatorMode == SlideIndicatorMode.canceled) ||
        (_refreshIndicatorMode == SlideIndicatorMode.error &&
            widget.pullBackOnError)) {
      _pullBack();
      return;
    }

    if (_pullBackController.isAnimating) {
      pullBackListener();
    } else {
      _onNoticed.add(PullSlideScrollNotificationInfo(_refreshIndicatorMode,
          _notificationDragOffset, _getRefreshWidget(), this));
    }
  }

  Widget? _getRefreshWidget() {
    if (_refreshIndicatorMode == null) {
      return null;
    }
    final bool showIndeterminateIndicator =
        _refreshIndicatorMode == SlideIndicatorMode.refresh ||
            _refreshIndicatorMode == SlideIndicatorMode.done;
    return ScaleTransition(
      scale: _scaleFactor,
      child: AnimatedBuilder(
        animation: _positionController,
        builder: (BuildContext context, Widget? child) {
          final bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

          if (isIOS) {
            return CupertinoActivityIndicator(
              animating: showIndeterminateIndicator,
              radius: 15.0,
            );
          } else {
            return RefreshProgressIndicator(
              value: showIndeterminateIndicator ? null : _value.value,
              valueColor: _valueColor,
              strokeWidth: 2.0,
            );
          }
        },
      ),
    );
  }

  void pullBackListener() {
    //print(_pullBackFactor.value);
    if (_dragOffset != _pullBackFactor!.value) {
      _dragOffset = _pullBackFactor!.value;
      _onNoticed.add(PullSlideScrollNotificationInfo(
          _refreshIndicatorMode, _dragOffset, _getRefreshWidget(), this));
      if (_dragOffset == 0.0) {
        _dragOffset = null;
        _notificationDragOffset = null;
        _isIndicatorAtTop = null;
        _refreshIndicatorMode = null;
      }
    }
  }

  TickerFuture _pullBack({double? end}) {
    final Animatable<double> _pullBackTween =
    Tween<double>(begin: _notificationDragOffset ?? 0.0, end: end ?? 0.0);
    _pullBackFactor?.removeListener(pullBackListener);
    _pullBackController.reset();
    _pullBackFactor = _pullBackController.drive(_pullBackTween);
    _pullBackFactor!.addListener(pullBackListener);
    return _pullBackController.animateTo(1.0,
        duration: widget.pullBackDuration, curve: widget.pullBackCurve);
    //_DragOffset=0.0;
  }
}