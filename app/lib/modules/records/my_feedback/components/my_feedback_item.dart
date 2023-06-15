import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class MyFeedbackItem extends StatelessWidget {
  final String type;
  final String desc;
  final String date;
  final List<String> imageList;

  MyFeedbackItem(
      {required this.type,
      required this.desc,
      required this.date,
      required this.imageList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: LocaleUtils.isLocale ? enWidget() : cnWidget(),//此布局是与ui沟通最后的结果
    );
  }

  Widget cnWidget() {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(bottom: 12.w),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 16.w),
              child: Text(
                "my_feedback_question_type".tr,
                style: TextStyle(
                  fontSize: 14,
                  color: Get.theme.colorScheme.primary.withOpacity(0.6),
                ),
              ),
            ),
            Text(
              type,
              style: TextStyle(
                fontSize: 14,
                color: Get.theme.selectedRowColor,
              ),
            ),
          ],
        ),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 16.w),
            child: Text(
              "my_feedback_question_desc".tr,
              style: TextStyle(
                fontSize: 14,
                color: Get.theme.colorScheme.primary.withOpacity(0.6),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  desc,
                  style: TextStyle(
                    fontSize: 14,
                    color: Get.theme.colorScheme.primary,
                  ),
                ),
                if (imageList.length != 0)
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 16.w),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 12.w,
                        mainAxisSpacing: 12.w),
                    itemBuilder: (context, index) {
                      print("imageList[index]  ${imageList[index]}");
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.w),
                        child: ObImage.network(
                          imageList[index],
                          width: 82.w,
                          height: 82.w,
                          fit: BoxFit.cover,
                          errorBuilder: (context, obj, errorStack) {
                            return Container(
                              width: 82.w,
                              height: 82.w,
                              color: Get.theme.colorScheme.primary
                                  .withOpacity(0.04),
                            );
                          },
                        ),
                      );
                    },
                    itemCount: imageList.length,
                  ),
                Container(
                  margin: EdgeInsets.only(top: 12.w),
                  child: Text(
                    date,
                    style: TextStyle(
                      fontSize: 12,
                      color: Get.theme.colorScheme.primary.withOpacity(0.6),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ]);
  }

  Widget enWidget() {
    return Column(children: [
      Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 16.w),
            child: Text(
              "my_feedback_question_type".tr,
              style: TextStyle(
                fontSize: 14,
                color: Get.theme.colorScheme.primary.withOpacity(0.6),
              ),
            ),
          ),
          Text(
            type,
            style: TextStyle(
              fontSize: 14,
              color: Get.theme.selectedRowColor,
            ),
          ),
        ],
      ),
      SizedBox(height: 12.h),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 24,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(right: 16.w),
            child: Text(
              "my_feedback_question_desc".tr,
              style: TextStyle(
                fontSize: 14,
                color: Get.theme.colorScheme.primary.withOpacity(0.6),
              ),
            ),
          ),
          Spacer(),
          Container(
            height: 24,
            alignment: Alignment.centerRight,
            child: Text(
              date,
              style: TextStyle(
                fontSize: 10,
                color: Get.theme.colorScheme.primary.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 12.h),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              desc,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 12,
                color: Get.theme.colorScheme.primary.withOpacity(.5),
              ),
            ),
          ),
          if (imageList.length != 0)
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: 16.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.w,
              ),
              itemBuilder: (context, index) {
                print("imageList[index]  ${imageList[index]}");
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.w),
                  child: ObImage.network(
                    imageList[index],
                    width: 82.w,
                    height: 82.w,
                    fit: BoxFit.cover,
                    errorBuilder: (context, obj, errorStack) {
                      return Container(
                        width: 82.w,
                        height: 82.w,
                        color: Get.theme.colorScheme.primary.withOpacity(0.04),
                      );
                    },
                  ),
                );
              },
              itemCount: imageList.length,
            ),
        ],
      ),
    ]);
  }
}
