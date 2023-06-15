import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';

class ObBottomSheet extends StatelessWidget {
  final Widget? title;
  final Widget body;
  final Widget? footer;
  final EdgeInsetsGeometry? padding;

  const ObBottomSheet({
    Key? key,
    this.title,
    required this.body,
    this.footer,
    this.padding,
  }) : super(key: key);

  ObBottomSheet.list({
    required String title,
    required List<Widget> children,
    VoidCallback? onCancelListener,
    double? titleFontSize,
    double? cancelFontSize,
    this.footer,
    this.padding,
  })  : title = Container(
          width: double.infinity,
          height: 44.w,
          color: Colors.white.withOpacity(0.04),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: onCancelListener,
                    child: Padding(
                      padding: padding ?? EdgeInsets.all(12.w),
                      child: Text(
                        'cancel'.tr,
                        style: TextStyle(
                          fontFamily: "PingFangSC-Medium",
                          fontSize: cancelFontSize ?? 16,
                          color: Colors.white.withOpacity(0.6),
                          height: 1.1,
                        ),
                      ),
                    )),
              ),
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: "PingFangSC-Medium",
                    fontSize: titleFontSize ?? 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    height: 1.1,
                  ),
                ),
              )
            ],
          ),
        ),
        body = Column(
          children: children,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null) title!,
        body,
        if (footer != null) footer!,
      ],
    );
  }
}
