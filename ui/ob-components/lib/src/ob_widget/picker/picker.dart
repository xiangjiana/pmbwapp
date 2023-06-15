import 'package:flutter/material.dart';
import 'package:ob_component/src/ob_widget/picker/address_picker/address_picker.dart';
import 'package:ob_component/src/ob_widget/picker/address_picker/address_result.dart';
import 'package:ob_component/src/ob_widget/picker/date_picker/ob_date_picker.dart';
import 'package:ob_component/src/ob_widget/picker/date_range_picker/ob_date_range_picker.dart';
import 'package:ob_component/src/ob_widget/picker/date_range_picker/time_range.dart';
import 'package:ob_component/src/ob_widget/picker/ob_picker/ob_picker.dart';

const Duration _pickerEnterDuration = Duration(milliseconds: 250);
const Duration _pickerExitDuration = Duration(milliseconds: 200);
const ShapeBorder _pickerShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(16)));
const Color _pickerBackgroundColor = Color(0xff1D2933);

class _PickerRoute<T> extends PopupRoute<T> {
  _PickerRoute({
    required this.capturedThemes,
    this.builder,
    this.barrierLabel,
    this.clipBehavior,
    this.modalBarrierColor,
    this.isDismissible = true,
    this.enableDrag = true,
    this.maxPickerHeight = 340,
    RouteSettings? settings,
    this.transitionAnimationController,
  }) : super(settings: settings);

  final WidgetBuilder? builder;
  final CapturedThemes capturedThemes;
  final Clip? clipBehavior;
  final Color? modalBarrierColor;
  final bool isDismissible;
  final bool enableDrag;
  final double maxPickerHeight;
  final AnimationController? transitionAnimationController;

  @override
  Duration get transitionDuration => _pickerEnterDuration;

  @override
  Duration get reverseTransitionDuration => _pickerExitDuration;

  @override
  bool get barrierDismissible => isDismissible;

  @override
  final String? barrierLabel;

  @override
  Color get barrierColor => modalBarrierColor ?? Colors.black54;

  AnimationController? _animationController;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    _animationController = transitionAnimationController ??
        BottomSheet.createAnimationController(navigator!.overlay!);
    return _animationController!;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    // By definition, the bottom sheet is aligned to the bottom of the page
    // and isn't exposed to the top padding of the MediaQuery.
    final Widget bottomSheet = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Builder(
        builder: (BuildContext context) {
          final Widget bottomSheet = MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Builder(
              builder: (BuildContext context) {
                return _Picker<T>(
                  route: this,
                  backgroundColor: _pickerBackgroundColor,
                  elevation: 0,
                  shape: _pickerShape,
                  clipBehavior: clipBehavior,
                  enableDrag: enableDrag,
                  maxPickerHeight: maxPickerHeight,
                );
              },
            ),
          );
          return capturedThemes.wrap(bottomSheet);
        },
      ),
    );
    return capturedThemes.wrap(bottomSheet);
  }
}

class _Picker<T> extends StatefulWidget {
  const _Picker({
    Key? key,
    this.route,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.clipBehavior,
    this.enableDrag = true,
    this.maxPickerHeight,
  }) : super(key: key);

  final _PickerRoute<T>? route;
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final bool enableDrag;
  final double? maxPickerHeight;

  @override
  _PickerState<T> createState() => _PickerState<T>();
}

class _PickerState<T> extends State<_Picker<T>> {
  String _getRouteLabel(MaterialLocalizations localizations) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return '';
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return localizations.dialogLabel;
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    assert(debugCheckHasMaterialLocalizations(context));
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    final String routeLabel = _getRouteLabel(localizations);

    return AnimatedBuilder(
      animation: widget.route!.animation!,
      child: BottomSheet(
        animationController: widget.route!._animationController,
        onClosing: () {
          if (widget.route!.isCurrent) {
            Navigator.pop(context);
          }
        },
        builder: widget.route!.builder!,
        backgroundColor: widget.backgroundColor,
        elevation: widget.elevation,
        shape: widget.shape,
        clipBehavior: widget.clipBehavior ?? Clip.antiAlias,
        enableDrag: widget.enableDrag,
      ),
      builder: (BuildContext context, Widget? child) {
        // Disable the initial animation when accessible navigation is on so
        // that the semantics are added to the tree at the correct time.
        final double animationValue = mediaQuery.accessibleNavigation
            ? 1.0
            : widget.route!.animation!.value;
        return Semantics(
          scopesRoute: true,
          namesRoute: true,
          label: routeLabel,
          explicitChildNodes: true,
          child: ClipRect(
            child: CustomSingleChildLayout(
              delegate: _PickerLayout(animationValue, widget.maxPickerHeight!),
              child: child,
            ),
          ),
        );
      },
    );
  }
}

class _PickerLayout extends SingleChildLayoutDelegate {
  _PickerLayout(this.progress, this.maxPickerHeight);

  final double progress;
  final double maxPickerHeight;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints(
        minWidth: constraints.maxWidth,
        maxWidth: constraints.maxWidth,
        minHeight: 0.0,
        maxHeight: maxPickerHeight);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(0.0, size.height - childSize.height * progress);
  }

  @override
  bool shouldRelayout(_PickerLayout oldDelegate) {
    return progress != oldDelegate.progress;
  }
}

/// 显示地址选择器
Future<AddressResult?> showAddressPicker({
  required BuildContext context,
  bool useRootNavigator = false,
}) {
  final NavigatorState navigator =
      Navigator.of(context, rootNavigator: useRootNavigator);
  return Navigator.of(context).push<AddressResult>(_PickerRoute<AddressResult>(
      capturedThemes:
          InheritedTheme.capture(from: context, to: navigator.context),
      builder: (BuildContext context) => const AddressPicker()));
}

/// 显示时间选择器
Future<DateTime?> showObDatePicker({
  required BuildContext context,
  bool useRootNavigator = false,
  final DateTime? initialDateTime,
  final DateTime? minimumDate,
  final DateTime? maximumDate,
}) {
  final NavigatorState navigator =
      Navigator.of(context, rootNavigator: useRootNavigator);
  return Navigator.of(context).push<DateTime>(_PickerRoute<DateTime>(
      capturedThemes:
          InheritedTheme.capture(from: context, to: navigator.context),
      builder: (BuildContext context) => ObDatePicker(
            initialDateTime: initialDateTime,
            minimumDate: minimumDate,
            maximumDate: maximumDate,
          )));
}

/// 显示时间范围选择器
Future<TimeRange?> showObDateRangePicker(
    {required BuildContext context,
    bool useRootNavigator = false,
    final DateTime? minimumDate,
    final DateTime? maximumDate,
    final DateTime? initialStartDateTime,
    final DateTime? initialEndDateTime,
    final BeforeConfirmCallback? beforeConfirmListener}) {
  final NavigatorState navigator =
      Navigator.of(context, rootNavigator: useRootNavigator);
  return Navigator.of(context).push<TimeRange>(
    _PickerRoute<TimeRange>(
        capturedThemes:
            InheritedTheme.capture(from: context, to: navigator.context),
        builder: (BuildContext context) => ObDateRangePicker(
              minimumDate: minimumDate,
              maximumDate: maximumDate,
              initialStartDateTime: initialStartDateTime,
              initialEndDateTime: initialEndDateTime,
              beforeConfirmListener: beforeConfirmListener,
            ),
        maxPickerHeight: 390),
  );
}

/// 选择器
Future<int?> showPicker({
  required BuildContext context,
  required List<Widget> children,
  bool useRootNavigator = false,
}) {
  final NavigatorState navigator =
      Navigator.of(context, rootNavigator: useRootNavigator);
  return Navigator.of(context).push<int>(_PickerRoute<int>(
      capturedThemes:
          InheritedTheme.capture(from: context, to: navigator.context),
      builder: (BuildContext context) => ObPicker(children: children)));
}
