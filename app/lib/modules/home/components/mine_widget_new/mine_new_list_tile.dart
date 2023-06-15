import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class MineNewListTile extends StatelessWidget {
  final String iconAssetUrl;
  final String title;
  final bool? isEdgeEffect;
  final VoidCallback? onPress;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final String description;
  final Widget? newMark;
  final bool hasRight;

  const MineNewListTile({
    Key? key,
    required this.iconAssetUrl,
    required this.title,
    required this.hasRight,
    this.isEdgeEffect,
    this.onPress,
    this.borderRadius,
    this.padding,
    this.margin,
    required this.description,
    this.newMark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1C1E22),
      child: LivedGestureDetector(
        onTap: onPress,
        borderRadius: borderRadius,
        child: Container(
          height: 48.w,
          padding: padding,
          margin: margin,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: const Color(0xff24262B),
            borderRadius: borderRadius,
          ),
          child: Row(
            children: [
              SizedBox(width: 16.h),
              if (iconAssetUrl.isNotNullOrEmpty)
                ObImage.asset(iconAssetUrl, width: 24.w),
              SizedBox(width: 12.h),
              Expanded(
                child: Text(
                  title.tr,
                  style: TextStyle(
                    fontSize: LocaleUtils.isLocale ? 12 : 16,
                    color: Colors.white60,
                  ),
                ),
              ),
              if (newMark != null) newMark!,
              if (description.isNotEmpty)
                Text(
                  description.isEmpty
                      ? "-"
                      : description == "-"
                          ? "0.00B"
                          : description,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.6),
                      fontWeight: FontWeight.w400),
                ),
              if (hasRight)
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
