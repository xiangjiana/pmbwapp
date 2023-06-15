import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_component/src/ob_widget/animation/loading_animation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 加载-上拉-底部
class ObRefreshFooter extends LoadIndicator {
  ///
  const ObRefreshFooter({
    Key? key,
    VoidCallback? onClick,
    this.imageNoMore,
    LoadStyle loadStyle = LoadStyle.ShowAlways,
    double height = 60.0,
  }) : super(
          key: key,
          loadStyle: loadStyle,
          height: height,
          onClick: onClick,
        );

  /// 底部浮水印
  final Widget? imageNoMore;

  @override
  _ObRefreshFooterState createState() => _ObRefreshFooterState();
}

class _ObRefreshFooterState extends LoadIndicatorState<ObRefreshFooter> {
  @override
  Widget buildContent(BuildContext context, LoadStatus mode) {
    switch (mode) {
      case LoadStatus.idle:
        return SizedBox(
          height: widget.height,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(Icons.arrow_upward, color: Colors.grey),
                Text(
                  'pull_up_to_load_more'.tr,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      case LoadStatus.noMore:
        return SizedBox(
          height: widget.height,
          child: Center(
            child: widget.imageNoMore ??
                Image.asset(
                  'assets/images/icon/home_under_logo.png',
                  package: 'ob_component',
                  height: 24,
                ),
          ),
        );
      case LoadStatus.canLoading:
      case LoadStatus.loading:
      case LoadStatus.failed:
        return SizedBox(
          child: const Center(
            child: LoadingAnimation(),
          ),
          height: widget.height,
        );
    }
  }
}
