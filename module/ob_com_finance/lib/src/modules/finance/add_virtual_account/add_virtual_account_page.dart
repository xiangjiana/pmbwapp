import 'package:cool_ui/cool_ui.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme, PrimaryButton;

import 'add_virtual_account_controller.dart';
import 'component/tag.dart';

class AddVirtualAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return KeyboardMediaQuery(
        child: GetBuilder<AddVirtualAccountController>(
      global: false,
      init: AddVirtualAccountController(Get.find(), Get.find()),
      builder: (AddVirtualAccountController controller) {
        return ObTheme(
          child: Scaffold(
            appBar: AppBar(
              title: ObNavigationBarTitle('add_virtual_account_title'.tr),
              leading: ObBackButton(),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                onChanged: controller.onFormChanged,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                        height: 8.w, thickness: 8.w, color: Color(0xff0E1519)),
                    // Tip(
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: 16.w, vertical: 12.w),
                    //   width: double.infinity,
                    //   backgroundColor: Color(0xff1D2933),
                    //   child: Text(
                    //     'add_bank_accout_proofread_the_virtual_currency_address_carefully'
                    //         .tr,
                    //     style: TextStyle(color: Colors.white, fontSize: 12),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'v_currency_category'.tr,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 12.w,
                            ),
                            for (int i = 0;
                                i < controller.virtualType.length;
                                i++)
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () => controller.checkVirtualType(
                                    controller.virtualType[i].code),
                                child: Tag(
                                  label: controller.virtualType[i].code,
                                  selected: controller.selectedVirtualType ==
                                      controller.virtualType[i].code,
                                  width: 118,
                                  height: 48,
                                  borderRadius: 4,
                                  labelPadding: 8,
                                  leading: pkObImage(
                                    Assets.images.icon.iconUsdtCommon.path,
                                    width: 16,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'add_virtual_account_select_transaction_agreement'
                                .tr,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 12.w,
                          ),
                          Obx(
                            () => Wrap(
                              spacing: 8.w,
                              children: [
                                for (int i = 0;
                                    i < controller.virtualProtocolType.length;
                                    i++)
                                  GestureDetector(
                                    onTap: () => controller.selectProtocol(
                                        controller.virtualProtocolType[i]),
                                    child: Tag(
                                      label:
                                          '${controller.virtualProtocolType[i]}',
                                      width: 118,
                                      height: 48,
                                      borderRadius: 4,
                                      selected: controller
                                              .selectedVirtualProtocolType ==
                                          controller.virtualProtocolType[i],
                                    ),
                                  )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12.w,
                          ),
                          // Text(
                          //   'add_virtual_account_alias'.tr,
                          //   style: TextStyle(
                          //     fontSize: 14,
                          //     color: Colors.white.withOpacity(0.6),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 8.w,
                          // ),
                          // Container(
                          //   height: 32,
                          //   child: TextFormField(
                          //     cursorColor: Get.theme.textSelectionTheme.cursorColor,
                          //     controller: controller.aliasCtrl,
                          //     maxLength: 18,
                          //     inputFormatters: [
                          //       FilteringTextInputFormatter.deny(RegExp(r'\s'))
                          //     ],
                          //     onChanged: (value) {
                          //       if (value == '' ||
                          //           controller.addressCtrl.text == "" ||
                          //           controller.verifyCodeCtrl.text.length !=
                          //               6) {
                          //         controller.isValidate = false;
                          //       } else {
                          //         controller.isValidate = true;
                          //       }
                          //     },
                          //     decoration: InputDecoration(
                          //       hintText:
                          //           'virtual_protocol_easy_to_distinguish_the_virtual'
                          //               .tr,
                          //       //labelText: 'add_virtual_account_alias'.tr,
                          //       counterText: '',
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 12.w,
                          // ),
                          Text(
                            'virtual_account_address'.tr,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                          SizedBox(
                            height: 8.w,
                          ),
                          Container(
                            height: 40.w, //这里设置低于40.w会造成输入内容超出时候显示内容被截断下半部分
                            child: TextFormField(
                              onChanged: (value) {
                                controller.onChangedName(value);
                              },
                              maxLength: 128,
                              cursorColor:
                                  Get.theme.textSelectionTheme.cursorColor,
                              controller: controller.addressCtrl,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[a-zA-Z]|[0-9]"))
                              ],
                              decoration: InputDecoration(
                                hintText:
                                    'add_virtual_account_enter_your_digital_wallet_address'
                                        .tr,
                                //labelText: 'virtual_account_address'.tr,
                                counterText: '',
                              ),
                            ),
                          ),
                          SizedBox(height: 4.w),
                          Obx(
                            () => Text(
                              controller.errorTextName.value,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          // TextFormField(
                          //   initialValue: controller.areaCode.value +
                          //       "  " +
                          //       controller.phoneNumberCtrl.value.text,
                          //   enabled: false,
                          //   decoration: InputDecoration(
                          //     labelText: 'user_phone'.tr,
                          //   ),
                          // ),
                          // TextFormField(
                          //   cursorColor: Get.theme.textSelectionTheme.cursorColor,
                          //   validator: verifyCodeValidator,
                          //   controller: controller.verifyCodeCtrl,
                          //   keyboardType:
                          //       CustomNumberKeyboard.inputIntNumberPad,
                          //   buildCounter: (context,
                          //       {required currentLength,
                          //       required isFocused,
                          //       maxLength}) {
                          //     return Container(); //去除计数器
                          //   },
                          //   maxLength: 6,
                          //   inputFormatters: [
                          //     FilteringTextInputFormatter.digitsOnly,
                          //     LengthLimitingTextInputFormatter(6),
                          //   ],
                          //   onChanged: (value) {
                          //     if (value.length != 6 ||
                          //         controller.addressCtrl.text == "" ||
                          //         controller.aliasCtrl.text == "") {
                          //       controller.isValidate = false;
                          //     } else {
                          //       controller.isValidate = true;
                          //     }
                          //   },
                          //   decoration: InputDecoration(
                          //     hintText:
                          //         'user_please_enter_your_phone_verification_code'
                          //             .tr,
                          //     labelText: 'user_phone_verification_code'.tr,
                          //     suffixIcon: Column(
                          //       mainAxisAlignment: MainAxisAlignment.end,
                          //       children: [
                          //         CountDownButton(
                          //           onTap: () => controller.sendSmsCode(),
                          //           controller: controller.countDownCtrl,
                          //           style: TextStyle(
                          //             fontSize: 14,
                          //             color: Color(0xffE1A100),
                          //           ),
                          //           initialText: 'login_error_get_code'.tr,
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: 32.w,
                          ),
                          Obx(() => OBasePrimaryButton(
                                child: Text(
                                  'add_virtual_account'.tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.1,
                                  ),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(Assets.images.btnbg2.path,
                                      package: BaseX.pkg),
                                  fit: BoxFit.fill,
                                ),
                                block: true,
                                disabled: !controller.isValidate,
                                onPressed: () => controller.applyNewAccount(),
                                size: ButtonSize.large,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.w + MediaQuery.of(context).padding.bottom,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}
