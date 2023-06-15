import 'package:ob_com_base/ob_com_base.dart';
import 'package:cool_ui/cool_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'bind_phone_number_controller.dart';

class BindPhoneNumberPage extends StatelessWidget {
  const BindPhoneNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardMediaQuery(
      child: GetBuilder(
        init: BindPhoneNumberController(Get.find(), Get.find()),
        builder: (BindPhoneNumberController controller) {
          return ObTheme(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: ObNavigationBarTitle('user_bind_mobile_number'.tr),
                leading: ObBackButton(),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(8.w),
                  child: Divider(
                    height: 8.w,
                    thickness: 8.w,
                    color: Color(0xff0E1519),
                  ),
                ),
              ),
              body: SafeArea(
                bottom: true,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Obx(
                        () => Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: 12.w),
                            InputPhoneLabel(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(
                                    controller.phoneMaxLength.value),
                              ],
                              focusNode: controller.phoneNumberFocus,
                              controller: controller.phoneNumberCtrl,
                              maxLength: controller.phoneMaxLength.value,
                              onChanged: controller.changePhoneNo,
                              txtAreaCode: controller.areaCode.value,
                              errorText: controller.errorPhoneText.value,
                              isError: controller.errorPhoneText.isNotEmpty,
                              onAreaCodeChoose: (val) {
                                controller.areaCode.value = val;
                                controller.changePhoneNo('');
                                controller.phoneNumberCtrl.clear();
                                Get.back();
                              },
                            ),
                            SizedBox(height: 12.w),
                            InputLabel(
                              height: 40.h,
                              controller: controller.verifyCodeCtrl,
                              onChanged: controller.changeVerifyCode,
                              keyboardType:
                                  CustomNumberKeyboard.inputIntNumberPad,
                              maxLength: 6,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(6),
                              ],
                              hint: 'please_enter'.tr,
                              labelText: 'user_phone_verification_code'.tr,
                              focusNode: controller.codeFocus,
                              suffixIcon: _buildVerifyCode(controller),
                              errorText: controller.errorVerifyCodeText.value,
                              isError:
                                  controller.errorVerifyCodeText.isNotEmpty,
                            ),
                            SizedBox(height: 33.w),
                            OBasePrimaryButton(
                              block: true,
                              size: ButtonSize.large,
                              disabled: !controller.isvalidate.value,
                              loadingStatus: controller.isLoadingStatus.value,
                              image: DecorationImage(
                                image: AssetImage(Assets.images.btnbg.path, package: BaseX.pkg),
                                fit: BoxFit.fill,
                              ),
                              onPressed: () => controller.apply(),
                              child: Text(
                                'submit'.tr,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(height: 16.w),
                            Text(
                              'user_cannot_be_modified_after_confirmation'.tr,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.6),
                              ),
                            ),
                            SizedBox(height: 16.w),
                            Spacer(),
                            ContactCustomerService(
                              jumpToAgentServicePage:
                                  Store.clientId == Store.clientIdFYB,
                            )
                          ],
                        ),
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: controller.isLoadingStatus.value,
                        child: Container(
                          color: Colors.black.withOpacity(.10),
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildVerifyCode(BindPhoneNumberController controller) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (controller.errorPhoneValidate.value &&
            controller.autoCodeText.value.length > 3) {
          controller.sendCode();
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => Text(
              controller.autoCodeText.value,
              maxLines: 1,
              softWrap: false,
              style: TextStyle(
                color: controller.errorPhoneValidate.value
                    ? Get.theme.selectedRowColor
                    : ColorName.white.withOpacity(0.5),
                fontFamily: "PingFangSC-Regular",
                wordSpacing: -2,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
