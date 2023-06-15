import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

import 'h5_download_controller.dart';

class H5DownloadPage extends GetView<H5DownloadController> {

  @override
  Widget build(BuildContext context) {
    controller.toString();
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff181F28),
          Color(0xff130D1D),
          Color(0xff130F1E),
          Color(0xff161F27),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  child: pkObImage(Assets.images.icon.comBack.path,
                      width: 24, height: 24),
                ),
              ),
            ),
            Expanded(
                child: pkObImage(
              getBgByMerchant(),
              fit: BoxFit.fitWidth,
            )),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 16, left: 88, right: 88),
              child: PrimaryButton(
                size: ButtonSize.large,
                disabled: false,
                onPressed: () {
                  WebUtil.openInBrowser(controller.url);
                },
                child: Container(
                  width: 199,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      colors: <Color>[Color(0xFF89ED6F), Color(0xFF3BC117)],
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(22)),
                    color: Colors.black.withOpacity(0.3),
                  ),
                  child: Text(
                    'download_app_right_now'.tr,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 66),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'has_problem_when_download'.tr,
                    style: TextStyle(fontSize: 12, color: Color(0x66ffffff)),
                  ),
                  SizedBox(width: 4),
                  if (AppMerchantUtils.loadCurMerchantBy(
                      OBModules.kCustomerService))
                    InkWell(
                      onTap: () {
                        PublicResources.jumpToMemberServicePage();
                      },
                      child: Text(
                        'contact_customer_service'.tr,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff3BC117),
                        ),
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  //根据不同商户返回下载页面的背景图
  String getBgByMerchant() {
    String languageCode=Get.locale!.languageCode;
    if (AppMerchantUtils.curMerchantTypes() == OBMerchantTypes.kMSGJ) {
      return Assets.images.error.h5XiazaiMsgj.path;
    } else if (AppMerchantUtils.curMerchantTypes() == OBMerchantTypes.kOBBW) {
      switch (languageCode) {
        case "zh":
          return Assets.images.error.h5Xiazai.path;
        case "vi":
          return Assets.images.error.h5XiazaiVi.path;
        case "th":
          return Assets.images.error.h5XiazaiTh.path;
        case "en":
          return Assets.images.error.h5XiazaiEn.path;
        default:
      }
    } else if (AppMerchantUtils.curMerchantTypes() == OBMerchantTypes.kVWBET) {
      return Assets.images.error.h5XiazaiVwbet.path;
    }else if (AppMerchantUtils.curMerchantTypes() == OBMerchantTypes.kX1BET) {
      switch (languageCode) {
        case "zh":
          return Assets.images.error.h5XiazaiX1bet.path;
        case "vi":
          return Assets.images.error.h5XiazaiX1betVi.path;
        default:
          return Assets.images.error.h5XiazaiX1bet.path;
      }
    }else if (AppMerchantUtils.curMerchantTypes() == OBMerchantTypes.kZ68BET) {
      switch (languageCode) {
        case "zh":
          return Assets.images.error.h5XiazaiZ86betZh.path;
        case "vi":
          return Assets.images.error.h5XiazaiZ86betVi.path;
        default:
          return Assets.images.error.h5XiazaiZ86betZh.path;
      }
    }else if (AppMerchantUtils.curMerchantTypes() == OBMerchantTypes.k86BET) {
      switch (languageCode) {
        case "zh":
          return Assets.images.error.h5Xiazai86betZh.path;
        case "vi":
          return Assets.images.error.h5Xiazai86betVi.path;
        default:
          return Assets.images.error.h5Xiazai86betZh.path;
      }
    }
    return Assets.images.error.h5Xiazai.path;
  }
}
