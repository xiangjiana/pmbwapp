import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ob_com_base/ob_com_base.dart';

class PlaceholderLoading extends StatelessWidget {
  const PlaceholderLoading({
    Key? key,
    this.margin = const EdgeInsets.only(top: 180),
    this.alignment = Alignment.center,
    this.color,
    this.padding,
  }) : super(key: key);

  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      color: this.color,
      alignment: this.alignment,
      padding: this.padding,
      child: Lottie.asset(
        Assets.lottie.loading,
        width: 72.w,
        height: 72.w,
        repeat: true,
        package: BaseX.pkg,
      ),
    );
  }
}

/*
* Gata Loading
* 输入偏移量后，顶部自动向下偏移输入数值，内部的状态图标自动保持居中
* Colors.transparent 将会是不可点击的透明遮照
* */
class GataPlaceholderLoading extends StatelessWidget {
  const GataPlaceholderLoading({
    Key? key,
    this.marginTopOffset = 0,
    this.marginBottomOffset = 0,
    this.color = Colors.transparent,
    this.enableTopSafe = true,
    this.navigationBarHeight = kBottomNavigationBarHeight,
    this.iconPadding,
  }) : super(key: key);

  final double marginTopOffset;
  final double marginBottomOffset;
  final Color? color;
  final bool enableTopSafe;
  final double navigationBarHeight;
  final EdgeInsetsGeometry? iconPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          SafeArea(
            left: false,
            right: false,
            bottom: false,
            top: enableTopSafe,
            child: Container(
              margin: EdgeInsets.only(
                top: marginTopOffset + navigationBarHeight,
                bottom: marginBottomOffset,
              ),
              color: this.color,
              alignment: Alignment.center,
            ),
          ),
          Container(
            padding: iconPadding,
            alignment: Alignment.center,
            child: Lottie.asset(
              Assets.lottie.loading,
              width: 72.w,
              height: 72.w,
              repeat: true,
              package: BaseX.pkg,
            ),
          ),
        ],
      ),
    );
  }
}

extension GataHUD on GataPlaceholderLoading {
  static build({
    required bool offstage,
    double marginTopOffset = 0,
    Color color = Colors.transparent,
    bool enableTopSafe = true,
    double marginBottomOffset = 0,
    double navigationBarHeight = kBottomNavigationBarHeight,
    EdgeInsetsGeometry? iconPadding,
  }) {
    return Offstage(
      offstage: offstage,
      child: GataPlaceholderLoading(
        color: color,
        marginTopOffset: marginTopOffset,
        navigationBarHeight: navigationBarHeight,
        marginBottomOffset: marginBottomOffset,
        enableTopSafe: enableTopSafe,
        iconPadding: iconPadding,
      ),
    );
  }
}