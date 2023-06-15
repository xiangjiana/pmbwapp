import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_package/modules/settings/contact_us/components/contact_us_row.dart';
import 'package:ob_package/modules/settings/contact_us/components/sub_title.dart';
import 'package:ob_package/modules/settings/contact_us/contact_us_controller.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class ContactUsPage extends GetView<ContactUsController> {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        appBar: AppBar(
          title: ObNavigationBarTitle('contact_us'.tr),
          leading: ObBackButton(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Divider(height: 8.w, thickness: 8.w, color: Color(0xff0E1519)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 16.w, bottom: 12.w),
                    child: SubTitle(title: 'contact_us_feedback_or_advise'.tr),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 12.w),
                    child: Obx(
                      () => ContactUsRow(
                        title: 'contact_us_advise_email'.tr,
                        email: controller.feedbackEmail,
                      ),
                    ),
                  ),
                  Obx(
                    () => ContactUsRow(
                      title: 'contact_us_service_email'.tr,
                      email: controller.customerServiceEmail,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 32.w, bottom: 12.w),
                    child: SubTitle(title: 'contact_us_be_partner'.tr),
                  ),
                  Obx(
                    () => ContactUsRow(
                      title: 'contact_us_cooperation'.tr,
                      email: controller.contactEmail,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            ContactCustomerService(),
          ],
        ),
      ),
    );
  }
}
