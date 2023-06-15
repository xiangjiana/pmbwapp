import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class ServiceBadge extends StatelessWidget {
  const ServiceBadge({
    Key? key,
    this.circleBg = false,
    this.alignment,
    this.padding,
    this.color,
  }) : super(key: key);

  final bool? circleBg;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AnimatedGestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: PublicResources.jumpToMemberServicePage,
      child: Container(
        alignment: Alignment.center,
        color: color,
        padding: padding,
        child: _buildBadge(),
      ),
    );
  }

  Widget _buildBadge() {
    Widget badge = ObImage.asset(
      Assets.images.icon.homeService.path,
      width: 24.w,
      height: 24.w,
    );

    if (circleBg == true) {
      return Container(
        width: 36.w,
        height: 36.w,
        alignment: alignment ?? Alignment.center,
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.primary.withOpacity(.1),
          shape: BoxShape.circle,
        ),
        child: badge,
      );
    }
    return badge;
  }
}
