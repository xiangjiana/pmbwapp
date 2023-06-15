import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:sprintf/sprintf.dart';
import 'package:ob_com_base/ob_com_base.dart';

class Tiaokuan extends StatelessWidget {
  String appName='';
  Tiaokuan({Key? key}) : super(key: key){
    appName=Tools.getCurLangAppName();
  }
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Container(
            child: Text(
              sprintf('tiaokuan12'.tr, [appName,appName,appName,appName]),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            child: Text(
              sprintf('tiaokuan13'.tr, [appName,appName,appName,appName,appName,appName,appName]),
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              "define".tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 8.w),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: sprintf('tiaokuan1'.tr, [appName,appName]),
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "PingFangSC-Regular",
                                fontWeight: FontWeight.w400,
                                color: Colors.white.withOpacity(0.6))),
                        TextSpan(
                            text:
                                sprintf('tiaokuan2'.tr, [appName,appName]),
                            style: TextStyle(
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                fontFamily: "PingFangSC-Regular",
                                fontWeight: FontWeight.w400,
                                color: Colors.white.withOpacity(0.6))),
                        TextSpan(
                            text:
                                'tiaokuan3'.tr,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "PingFangSC-Regular",
                                fontWeight: FontWeight.w400,
                                color: Colors.white.withOpacity(0.6)))
                      ],
                      style: const TextStyle(
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              "agree".tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 8.w),
              child: Column(
                children: [
                  Text(
                    sprintf('tiaokuan4'.tr, [appName,appName,appName,appName]),
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "PingFangSC-Regular",
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.6)),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              "modify".tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 8.w),
              child: Column(
                children: [
                  Text(
                    sprintf('tiaokuan5'.tr, [appName,appName,appName,appName,appName,appName]),
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "PingFangSC-Regular",
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.6)),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              "tiaokuan6".tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            child: Text(
              sprintf('tiaokuan7'.tr, [appName,appName,appName,appName,appName,appName,appName]),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              "tiaokuan8".tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            child: Text(
              "tiaokuan9".tr,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  // decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            child: Text(
              sprintf('tiaokuan10'.tr, [appName,appName,appName,appName]),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              "tiaokuan11".tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            child: Text(
              sprintf('tiaokuan14'.tr, [appName,appName,appName,appName,appName,appName,appName,appName,appName,appName,appName,appName,appName,]),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400, 
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              "tiaokuan15".tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            child: Text(
              sprintf('tiaokuan16'.tr, [appName,appName,appName,appName,appName,appName,appName,appName,appName,appName,appName,appName,appName,appName,appName,appName,appName,]),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              "tiaokuan17".tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            child: Text(
              sprintf('tiaokuan18'.tr, [appName,appName,appName,appName,appName,appName,appName,appName,appName,appName]),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              "tiaokuan19".tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            child: Text(
              sprintf('tiaokuan18'.tr, [appName,appName,appName,appName,appName,appName,appName]),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12.w),
            child: Text(
              'tiaokuan21'.tr,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            child: Text(
              sprintf('tiaokuan22'.tr, [appName,appName,appName,appName,appName,appName]),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              "tiaokuan23".tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            child: Text(
              'tiaokuan24'.tr,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              "tiaokuan25".tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            child: Text(
              sprintf('tiaokuan26'.tr, [appName,appName,appName,appName,appName,appName,appName]),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              "tiaokuan27".tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            child: Text(
              sprintf('tiaokuan28'.tr, [appName,appName,appName,appName,appName]),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              "tiaokuan29".tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            child: Text(
              sprintf('tiaokuan30'.tr, List.generate(17, (index) => appName)),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              'tiaokuan31'.tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            child: Text(
              sprintf('tiaokuan32'.tr, List.generate(17, (index) => appName)),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12.w),
            child: Text(
              sprintf('tiaokuan33'.tr, List.generate(5, (index) => appName)),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            child: Text(
              'tiaokuan34'.tr,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              'tiaokuan35'.tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            child: Text(
              sprintf('tiaokuan36'.tr, List.generate(5, (index) => appName)),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              'tiaokuan37'.tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            child: Text(
              'tiaokuan38'.tr,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              'tiaokuan39'.tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            child: Text(
              'tiaokuan40'.tr,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              'tiaokuan41'.tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            child: Text(
              sprintf('tiaokuan42'.tr, List.generate(1, (index) => appName)),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              'tiaokuan43'.tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            child: Text(
              'tiaokuan44'.tr,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              'tiaokuan45'.tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            child: Text(
              sprintf('tiaokuan46'.tr, List.generate(1, (index) => appName)),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              'tiaokuan47'.tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            child: Text(
              sprintf('tiaokuan48'.tr, List.generate(3, (index) => appName)),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              'tiaokuan49'.tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            child: Text(
              'tiaokuan50'.tr,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.w),
            width: 1.sw,
            child: Text(
              'tiaokuan51'.tr,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            child: Text(
              sprintf('tiaokuan52'.tr, List.generate(1, (index) => appName)),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            width: 1.sw,
            child: Text(
              'tiaokuan53'.tr,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.w),
            width: 1.sw,
            child: Text(
              sprintf('tiaokuan54'.tr, List.generate(2, (index) => appName)),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12.w),
            child: Text(
              sprintf('tiaokuan55'.tr, List.generate(1, (index) => appName)),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
          SizedBox(height: 33.w + MediaQuery.of(context).padding.bottom),
        ],
      ),
    ));
  }
}
