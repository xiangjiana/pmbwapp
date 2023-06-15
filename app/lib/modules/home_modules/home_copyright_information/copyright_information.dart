


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ob_com_base/ob_com_base.dart';

import '../../home/home_controller.dart';

class CopyrightInformation extends StatelessWidget {
 late ScrollController singleChildScrollViewScrollController;
   CopyrightInformation(this.singleChildScrollViewScrollController);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 16.w,
            bottom: 18.w
          ),
          width: 1.sw,
          height: 1.w,
          color: Colors.white.withAlpha(10),
        ),
        pkObImage(Assets.images.pmLogo.path,
            height: 30.w, width: 101.w, fit: BoxFit.fitHeight),
        SizedBox(
          height: 5.w,
        ),
        Text('copyright_information_one'.tr,style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 10.sp
        ),
       textAlign:TextAlign.center
        ),
        
        Container(
          margin: EdgeInsets.only(
            top: 13.w
          ),
          width: 1.sw,
          color: Color(0xffD9D9D9).withAlpha(10),
          padding: EdgeInsets.only(
            left: 14.w,
            right: 14.w,
            top: 15.w,
            bottom: 11.w
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCopyrightInformationItem(Assets.images.bqOne.path,"copyright_information_two".tr,crossAxisAlignment: CrossAxisAlignment.start),
              _buildCopyrightInformationItem(Assets.images.bqTwo.path,"copyright_information_three".tr,crossAxisAlignment: CrossAxisAlignment.center),
              _buildCopyrightInformationItem(Assets.images.bqThree.path,"copyright_information_four".tr,crossAxisAlignment: CrossAxisAlignment.end),
            ],
          ),
        ),
        SizedBox(
          height: 5.w,
        ),
        Text('copyright_information_five'.tr,style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 10.sp
        ),
            textAlign:TextAlign.center
        ),
        SizedBox(
          height: 28.w,
        ),
        GestureDetector(
          onTap: (){
            singleChildScrollViewScrollController.jumpTo(0);
          },
          child: pkObImage(Assets.images.toTop.path,
              height: 36.w, width: 52.w, fit: BoxFit.fitHeight),
        ),
        SizedBox(
          height: 35.w,
        ),

      ],
    );
  }

  _buildCopyrightInformationItem(String path,String text,{
    required CrossAxisAlignment crossAxisAlignment
  }){

    return Column(
      crossAxisAlignment:crossAxisAlignment ,
      children: [
        pkObImage(path,
            height: 34.w, width: 102.w, fit: BoxFit.fitHeight),
        SizedBox(
          height: 5.w ,
        ),
        Text(text,style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 10.sp
        ),
            textAlign:TextAlign.center
        ),

      ],
    );
  }


}
