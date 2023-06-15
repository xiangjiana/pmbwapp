import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class ExpandView extends StatelessWidget {
  final bool selected;

  const ExpandView(this.selected, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          width: 106.w,
          height: 56.w,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: const Color(0x0F3BC117),
            borderRadius: BorderRadius.circular(4.w),
          ),
          duration: const Duration(milliseconds: 250),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                selected ? 'deposit_see_more'.tr : 'deposit_pack_up'.tr,
                style: const TextStyle(color: Color(0xff3BC117), fontSize: 14),
              ),
              SizedBox(height: 2.w),
            ],
          ),
        ),
        Positioned(
          bottom: -4.w,
          right: 0,
          child: Opacity(
            opacity: 0.4,
            child: pkObImage(Assets.images.deposit.o2bFangshiMore.path, width: 32.w,height: 32.w),
          ),
        ),
      ],
    );
  }
}
