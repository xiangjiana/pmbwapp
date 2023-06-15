import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:sprintf/sprintf.dart';
import 'package:ob_com_base/ob_com_base.dart';

class Yinsi extends StatelessWidget {
  late String appName;
  Yinsi({Key? key}) : super(key: key){
    appName=Tools.getCurLangAppName();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 16.w,
        bottom: 16.w + MediaQuery.of(context).padding.bottom,
      ),
      child: Column(
        children: [
          Container(
            child: Text(
              sprintf('policy2'.tr,[appName]),
              style: TextStyle(
                  // decoration: TextDecoration.underline,
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            child: Text(
              sprintf('policy3'.tr,[appName]),
              style: TextStyle(
                  // decoration: TextDecoration.underline,
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
            child: Text(
              "policy4".tr,
              style: TextStyle(
                  // decoration: TextDecoration.underline,
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
              "introcude".tr,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(1)),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 8.w),
              child: Column(
                children: [
                  Text(
                    sprintf('policy1'.tr,[appName]),
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
              "target".tr,
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
                    sprintf('policy5'.tr,[appName]),
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
              "visit_info".tr,
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
                    sprintf('policy6'.tr,[appName]),
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
              "security".tr,
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
                    sprintf('policy7'.tr,[appName,appName,appName]),
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
              "user_info_reciver".tr,
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
                    sprintf('policy8'.tr,[appName,appName,appName]),
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
              "monit".tr,
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
              sprintf('policy9'.tr,[appName,appName]),
              style: TextStyle(
                fontSize: 14,
                fontFamily: "PingFangSC-Regular",
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ),
          SizedBox(height: 33.w+MediaQuery.of(context).padding.bottom),
        ],
      ),
    ));
  }
}
