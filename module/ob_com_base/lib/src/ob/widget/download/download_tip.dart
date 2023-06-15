import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';

class DownloadTip extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ///app直接不显示
    if (!kIsWeb) {
      return SizedBox.shrink();
    }

    return Obx(() {
      if (!Store.showDow.value) {
        return SizedBox.shrink();
      }
      return InkWell(
        onTap: () {
          WebUtil.jumpToOffice();
        },
        child: Container(
          height: 44,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 16),
                child: pkObImage(AppMerchantUtils.curLogoPath(), width: 32, height: 32),
              ),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  'install_app_get_bouns'.tr,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              InkWell(
                onTap: () {
                  Store.showDow.value = false;
                },
                child: Container(
                  padding : EdgeInsets.only(right: 16),
                  child: pkObImage(Assets.images.error.comCloseWhite.path, width: 16, height: 16),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
