import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/src/extension/size_extension.dart';
import 'package:ob_component/ob_component.dart';

import 'ob_image.dart';

class ObGameIcon extends StatelessWidget {
  final int mark;
  final bool isMaintained;
  final String imageAddress;
  final IconSize size;

  ObGameIcon({
    this.mark = 0,
    this.isMaintained = false,
    this.imageAddress = '',
    this.size = IconSize.middle,
  });

  bool get hasMarkIcon => mark > 0;

  double get width {
    switch (size) {
      case IconSize.large:
        return 64.w;
      case IconSize.middle:
        return 56.w;
      case IconSize.small:
        return 48.w;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: width,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.w),
          ),
          child: ObImageAuto( 
            imageAddress,
            cacheKey: getCacheKey(),
            fit: BoxFit.cover,
            loadingBuilder: (
              BuildContext context,
              Widget child,
              ImageChunkEvent? loadingProgress,
            ) {
              if (loadingProgress == null) return child;
              return Container(
                width: width,
                height: width,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(4.w),
                ),
              );
            },
            errorBuilder: (
              BuildContext context,
              Object error,
              StackTrace? stackTrace,
            ) {
              return Container(
                width: width,
                height: width,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(4.w),
                ),
              );
            },
          )
        ),
        if (isMaintained)
          Container(
            width: width,
            height: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.w),
              color: Colors.black.withOpacity(0.6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pkObImage(
                  Assets.images.icon.gameWeixiu.path,
                  width: 24.w,
                  height: 24.w,
                ),
                // SizedBox(height: 4.w),
                Text(
                  "maintain".tr,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        if (hasMarkIcon)
          if (mark == 1)
            MarkIcon(
              text: 'search_recommend'.tr,
              colors: [
                Color(0xffCA25D1),
                Color(0xffF27DFF),
              ],
            )
          else if (mark == 2)
            MarkIcon(
              text: 'search_fiery'.tr,
              colors: [
                Color(0xffDD3D34),
                Color(0xffFF699F),
              ],
            )
          else if (mark == 3)
              MarkIcon(
                text: 'search_new_tour'.tr,
                colors: [
                  Color(0xff1BCBA9),
                  Color(0xff00AD61),
                ],
              ),
      ],
    );
  }

  String getCacheKey() {
    String cacheKey = imageAddress;
    if (imageAddress.isNotEmpty) {
      int index = imageAddress.lastIndexOf('/');
      if (index != -1) {
        cacheKey = imageAddress.substring(index, imageAddress.length);
      }
    }
    return cacheKey;
  }
}

class MarkIcon extends StatelessWidget {
  const MarkIcon({
    Key? key,
    required this.text,
    required this.colors,
  }) : super(key: key);

  final String text;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -7.w),
      child: Container(
        width: 24.w,
        height: 16.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.w),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "PingFangSC-Medium",
              fontWeight: FontWeight.w400,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}

enum IconSize {
  large,
  middle,
  small,
}
