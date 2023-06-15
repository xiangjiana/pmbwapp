import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_base/src/ob/public_resources.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class ContactCustomerService extends StatelessWidget {
  ContactCustomerService({
    Key? key,
    this.prefixText,
    this.serviceTap,
    this.jumpToAgentServicePage = false, //默认跳转会员客服
  }) : super(key: key);
  String? prefixText;
  GestureTapCallback? serviceTap;
  bool jumpToAgentServicePage;

  @override
  Widget build(BuildContext context) {
    if (!AppMerchantUtils.loadCurMerchantBy(OBModules.kCustomerService)) {
      return const SizedBox.shrink();
    }
    return SafeArea(
      bottom: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              if (serviceTap != null) {
                serviceTap!();
              } else {
                if (jumpToAgentServicePage) {
                  PublicResources.jumpToAgentServicePage();
                } else {
                  PublicResources.jumpToMemberServicePage();
                }
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.w),
              child: Text.rich(
                TextSpan(
                    text: prefixText != null ? '$prefixText' : 'concat_for_assistance_please_contact'.tr,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.6),
                    ),
                    children: [
                      TextSpan(
                        text: 'exclusive_customer_service'.tr,
                        style: TextStyle(fontSize: 12, color: ColorName.green),
                        // recognizer: PublicResources.gestureRecognizer,
                      )
                    ]),
                  textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
