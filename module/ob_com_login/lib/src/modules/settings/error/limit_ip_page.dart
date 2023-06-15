import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide PrimaryButton;

import 'limit_ip_controller.dart';

///IP限制提示页面
class LimitIpPage extends GetView<LimitIpController> {
  const LimitIpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: const Color(0xff151E25),
        body: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 75),
                child: pkObImage(Assets.images.error.err403.path, width: 234, height: 234),
              ),
              Text(
                'limit_ip_title'.tr,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16, left: 48, right: 48),
                child: Text(
                  'limit_ip_desc'.tr,
                  style: const TextStyle(fontSize: 14, color: Color(0x99ffffff)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 24, left: 48, right: 48),
                padding: const EdgeInsets.all(15),
                height: 82,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xff1E262D),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Align(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'limit_ip_address'.tr,
                            style: const TextStyle(fontSize: 14, color: Color(0x99ffffff)),
                          ),
                          const SizedBox(height: 8),
                          Obx(() {
                            return Text(
                              controller.ip.value,
                              style: const TextStyle(fontSize: 16, color: Colors.white),
                            );
                          }),
                        ],
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Align(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'limit_ip_region'.tr,
                            style: const TextStyle(fontSize: 14, color: Color(0x99ffffff)),
                          ),
                          const SizedBox(height: 8),
                          Obx(() {
                            return Text(
                              controller.region.value,
                              style: const TextStyle(fontSize: 16, color: Colors.white),
                            );
                          }),
                        ],
                      ),
                      alignment: Alignment.centerRight,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 22),
                width: 114,
                child: OBasePrimaryButton(
                  size: ButtonSize.middle,
                  disabled: false,
                  image: DecorationImage(
                    image: AssetImage(Assets.images.btnbg.path, package: BaseX.pkg),
                    fit: BoxFit.fill,
                  ),
                  onPressed: () {
                    if(Store.clientId==Store.clientIdFYB){
                      PublicResources.jumpToAgentServicePage();
                    }else{
                      PublicResources.jumpToMemberServicePage();
                    }
                  },
                  child: Text(
                    'contact_customer_service'.tr,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.only(bottom: 35),
                  child: pkObImage(Assets.images.homeUnderLogo.path, width: 74, height: 24),
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
