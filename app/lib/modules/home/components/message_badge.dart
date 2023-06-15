import 'package:flutter/material.dart' hide Badge;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class MessageBadge extends StatelessWidget {
  const MessageBadge({
    Key? key,
    this.circleBg = false,
    this.padding,
    this.color,
  }) : super(key: key);

  final bool? circleBg;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AnimatedGestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        eventBus.fire(FloatBonusEvent(show: false));
        Get.toNamed(AppRoutes.MESSAGE, arguments: {"index": 0});
      },
      child: Container(
        alignment: Alignment.center,
        color: color,
        padding: padding,
        child: _buildBadge(),
      ),
    );
  }

  Widget _buildBadge() {
    Widget obxBadge = Obx(
      () => Badge(
        count: Store.hasUnreadMessageNum.value,
        color: Color(0xff3BC117),
        child: ObImage.asset(
          Assets.images.homeNoticeNew.path,
          width: 24.w,
          height: 32.w,
        ),
      ),
    );

    if (circleBg == true) {
      return Container(
        width: 32.w,
        height: 38.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.primary.withOpacity(.1),
          shape: BoxShape.circle,
        ),
        child: obxBadge,
      );
    }
    return obxBadge;
  }
}
