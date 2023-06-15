import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class MineListTile extends StatelessWidget {
  final String iconAssetUrl;
  final String title;
  final bool? isEdgeEffect;
  final VoidCallback? onPress;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;

  const MineListTile({
    Key? key,
    required this.iconAssetUrl,
    required this.title,
    this.isEdgeEffect,
    this.onPress,
    this.borderRadius,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.theme.backgroundColor,
      child: LivedGestureDetector(
        onTap: onPress,
        borderRadius: borderRadius,
        child: Container(
          height: 48.w,
          padding: padding,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Color(0xff1E262D),
            borderRadius: borderRadius,
          ),
          child: Row(
            children: [
              SizedBox(width: 16.w),
              ObImage.asset(iconAssetUrl, width: 24.w),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  title.tr,
                  style: TextStyle(
                    fontSize: LocaleUtils.isLocale ? 12 : 16,
                    color: Colors.white60,
                  ),
                ),
              ),
              ObImage.asset(
                Assets.images.icon.homeMoreRight.path,
                width: 16.w,
              ),
              SizedBox(width: 16.w),
            ],
          ),
        ),
      ),
    );
  }
}
