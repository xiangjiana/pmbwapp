import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class NormalQuestionItem extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  final Function() onPress;

  const NormalQuestionItem(
    this.image,
    this.title,
    this.content,
    this.onPress,
  );

  @override
  Widget build(BuildContext context) {
    return LivedGestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPress,
      child: Container(
        width: 1.sw,
        constraints: BoxConstraints(
          minHeight: 60.h,
        ),
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 16.w),
            image.startsWith('assets/')
                ? ObImage.asset(
                    image,
                    width: 40.w,
                    height: 40.h,
                  )
                : ObImage.network(
                    image,
                    width: 40.w,
                    height: 40.h,
                  ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 12.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.isEmpty ? "-" : title,
                      style: TextStyle(
                        color: Get.theme.colorScheme.primary,
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 4.w),
                      child: Opacity(
                        opacity: 0.6,
                        child: Text(
                          content,
                          style: TextStyle(
                            color: Get.theme.colorScheme.primary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ObImage.asset(
              Assets.images.icon.homeMoreRight.path,
              width: 16.w,
              height: 16.h,
            ),
            SizedBox(width: 16.w),
          ],
        ),
      ),
    );
  }
}
