import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    hide RefreshIndicator, RefreshIndicatorState;
import 'package:ob_component/ob_component.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 加载-下拉-底部
class ObRefreshHeader extends RefreshIndicator {
  ///
  const ObRefreshHeader({
    Key? key,
    RefreshStyle refreshStyle = RefreshStyle.Follow,
    double height = 100.0,
    Duration completeDuration = const Duration(milliseconds: 600),
    this.outerBuilder,
    this.textStyle = const TextStyle(color: Colors.grey, fontSize: 12),
    this.releaseText,
    this.refreshingText,
    this.canTwoLevelIcon,
    this.twoLevelView,
    this.canTwoLevelText,
    this.completeText,
    this.failedText,
    this.idleText,
    this.iconPos = IconPosition.left,
    this.spacing = 15.0,
    this.refreshingIcon,
    this.failedIcon = const Icon(Icons.error, color: Colors.grey),
    this.completeIcon = const Icon(Icons.done, color: Colors.grey),
    this.idleIcon = const Icon(Icons.arrow_downward, color: Colors.grey),
    this.releaseIcon = const Icon(Icons.arrow_upward, color: Colors.grey),
  }) : super(
          key: key,
          refreshStyle: refreshStyle,
          completeDuration: completeDuration,
          height: height,
        );

  ///
  final OuterBuilder? outerBuilder;

  ///
  final String? releaseText,
      idleText,
      refreshingText,
      completeText,
      failedText,
      canTwoLevelText;

  ///
  final Widget? releaseIcon,
      idleIcon,
      refreshingIcon,
      completeIcon,
      failedIcon,
      canTwoLevelIcon,
      twoLevelView;

  /// icon and text middle margin
  final double spacing;

  ///
  final IconPosition iconPos;

  ///
  final TextStyle textStyle;

  @override
  State createState() {
    return _ObRefreshHeaderState();
  }
}

class _ObRefreshHeaderState extends RefreshIndicatorState<ObRefreshHeader> {
  Widget _buildText(RefreshStatus? mode) {
    final RefreshString strings =
        RefreshLocalizations.of(context)?.currentLocalization ??
            ChRefreshString();
    return Text(
        mode == RefreshStatus.canRefresh
            ? widget.releaseText ?? strings.idleRefreshText!
            : mode == RefreshStatus.completed
                ? widget.completeText ?? strings.refreshCompleteText!
                : mode == RefreshStatus.failed
                    ? widget.failedText ?? strings.refreshFailedText!
                    : mode == RefreshStatus.refreshing
                        ? widget.refreshingText ?? strings.refreshingText!
                        : mode == RefreshStatus.idle
                            ? widget.idleText ?? strings.idleRefreshText!
                            : mode == RefreshStatus.canTwoLevel
                                ? widget.canTwoLevelText ??
                                    strings.canTwoLevelText!
                                : "",
        style: widget.textStyle);
  }

  Widget _buildIcon(RefreshStatus? mode) {
    final Widget? icon = mode == RefreshStatus.canRefresh
        ? widget.releaseIcon
        : mode == RefreshStatus.idle
            ? widget.idleIcon
            : mode == RefreshStatus.completed
                ? widget.completeIcon
                : mode == RefreshStatus.failed
                    ? widget.failedIcon
                    : mode == RefreshStatus.canTwoLevel
                        ? widget.canTwoLevelIcon
                        : mode == RefreshStatus.canTwoLevel
                            ? widget.canTwoLevelIcon
                            : mode == RefreshStatus.refreshing
                                ? widget.refreshingIcon ??
                                    const SizedBox(
                                      width: 25.0,
                                      height: 25.0,
                                      child: CupertinoActivityIndicator(),
                                    )
                                : widget.twoLevelView;
    return icon ?? Container();
  }

  @override
  bool needReverseAll() {
    return false;
  }

  @override
  Widget buildContent(BuildContext context, RefreshStatus? mode) {
    final Widget textWidget = _buildText(mode);
    // final Widget iconWidget = _buildIcon(mode);
    final List<Widget> children = <Widget>[textWidget];
    final Widget container = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoadingAnimation(),
        Wrap(
          spacing: widget.spacing,
          textDirection: widget.iconPos == IconPosition.left
              ? TextDirection.ltr
              : TextDirection.rtl,
          direction: widget.iconPos == IconPosition.bottom ||
                  widget.iconPos == IconPosition.top
              ? Axis.vertical
              : Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          verticalDirection: widget.iconPos == IconPosition.bottom
              ? VerticalDirection.up
              : VerticalDirection.down,
          alignment: WrapAlignment.center,
          children: children,
        )
      ],
    );
    return widget.outerBuilder != null
        ? widget.outerBuilder!(container)
        : Container(
            child: Center(child: container),
            height: widget.height,
          );
  }
}
