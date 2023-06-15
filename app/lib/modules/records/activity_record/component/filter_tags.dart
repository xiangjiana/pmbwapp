import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/modules/records/activity_record/repository/ui_filter_tabs.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

import 'filter_tag_item.dart';

class FilterTags extends StatelessWidget {
  final List<UiFilterTags> uiTags;
  final int tagIndex;
  final ValueChanged<int> onTap;

  FilterTags(
    this.uiTags, {
    Key? key,
    required this.onTap,
    required this.tagIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 1.sw,
      height: uiTags.length > 6 ? 205.w : 157.w,
      color: ColorName.colorBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.w),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            child: Text(
              'cai_jin_zhuang_tai'.tr,
              style: TextStyle(
                color: ColorName.white,
                fontSize: 12,
                fontFamily: "PingFangSC-Regular",
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          SizedBox(height: 12.w),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 15,
                crossAxisSpacing: 12,
                childAspectRatio: 104.w / 34.w,
              ),
              itemCount: uiTags.length,
              itemBuilder: (context, index) {
                var data = uiTags[index];
                return FilterTagItem(
                  text: data.tagName,
                  checked: tagIndex == data.id,
                  id: data.id,
                  index: index,
                  onTap: onTap,
                );
              },
            ),
          ),
          SizedBox(height: 24.w),
        ],
      ),
    );
  }
}
