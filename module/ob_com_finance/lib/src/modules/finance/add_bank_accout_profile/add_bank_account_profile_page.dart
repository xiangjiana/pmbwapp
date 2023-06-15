import 'package:flutter/material.dart' hide PageController;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_finance/src/modules/finance/add_bank_account/component/tip.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme, PrimaryButton;

import 'add_bank_account_profile_controller.dart';

class AddBankAccountProfilePage extends StatelessWidget {
  const AddBankAccountProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      global: false,
      init: AddBankAccountProfileController(Get.find(), Get.find()),
      builder: (AddBankAccountProfileController controller) {
        return ObTheme(
          child: Scaffold(
            appBar: AppBar(
              title: ObNavigationBarTitle('add_bank_card_title'.tr),
              leading: ObBackButton(),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                onChanged: controller.onFormChanged,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      SizedBox(height: 10.w,),
                      TextFormField(
                        validator: noEmptyValidator,
                        readOnly: true,
                        onTap: () => controller.showCityPickers(),
                        controller: controller.addressCtrl,
                        cursorColor: Get.theme.textSelectionTheme.cursorColor,
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText:
                              'add_bank_accout_select_the_bank_address'.tr,
                          labelText:
                              'add_bank_accout_account_opening_address'.tr,
                          suffixIcon: Container(
                            width: 24.w,
                            alignment: Alignment.bottomRight,
                            child: pkObImage(
                              Assets.images.icon.homeMoreRight.path,
                              width: 24.w,
                              height: 24.w,
                            ),
                          ),
                          errorStyle: const TextStyle(height: 0),
                        ),
                      ),
                      Container(
                        height: 1.w,
                        color: Colors.white.withOpacity(0.06),
                      ),
                      Tip(
                        width: double.infinity,
                        padding: EdgeInsets.all(12.w),
                        margin: EdgeInsets.symmetric(vertical: 12.w),
                        borderRadius: 8.w,
                        backgroundColor: Colors.white.withOpacity(0.04),
                        child: Text(
                          'add_bank_accout_carefully_calibrate_the_address'.tr,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ),
                      TextFormField(
                        initialValue: controller.areaCode.value +
                            "  " +
                            controller.phoneNumberCtrl.value.text,
                        enabled: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 10.w,top: 10.w),
                          labelText: 'user_phone'.tr,
                          isDense: true,
                          hintText:'',
                        ),
                      ),
                      SizedBox(height: 10.w,),
                      TextFormField(
                        controller: controller.verifyCodeCtrl,
                        maxLength: 6,
                        cursorColor: Get.theme.textSelectionTheme.cursorColor,
                        keyboardType: CustomNumberKeyboard.inputIntNumberPad,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(6),
                        ],
                        validator: verifyCodeValidator,
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(bottom: 10.w,top: 10.w),
                          hintText:
                              'user_please_enter_your_phone_verification_code'
                                  .tr,
                          labelText: 'user_phone_verification_code'.tr,
                          counterText: '',
                          errorText: '',
                          suffixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CountDownButton(
                                onTap: controller.sendSmsCode,
                                controller: controller.countDownCtrl,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xffE1A100),
                                ),
                                initialText: 'login_error_get_code'.tr,
                              ),
                            ],
                          ),
                          errorStyle: const TextStyle(height: 0),
                        ),
                      ),
                      Container(
                        height: 1.w,
                        color: Colors.white.withOpacity(0.06),
                      ),
                      Tip(
                        width: double.infinity,
                        padding: EdgeInsets.all(12.w),
                        margin: EdgeInsets.symmetric(vertical: 12.w),
                        borderRadius: 8.w,
                        backgroundColor: Colors.white.withOpacity(0.04),
                        child: Text(
                          'add_bank_accout_will_help_you_retrieve_your_account'
                              .tr,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.w),
                      Obx(
                        () => OBasePrimaryButton(
                          child: Text(
                            'submit'.tr,
                            style: const TextStyle(
                              fontSize: 16,
                              height: 1.1,
                            ),
                          ),
                          image: DecorationImage(
                            image: AssetImage(Assets.images.btnbg.path, package: BaseX.pkg),
                            fit: BoxFit.fill,
                          ),
                          block: true,
                          onPressed: controller.apply,
                          disabled: !controller.isValidate,
                          size: ButtonSize.large,
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                          minHeight: 60.w,
                          maxHeight: 213.w,
                        ),
                      ),
                      ContactCustomerService(jumpToAgentServicePage: Store.clientId==Store.clientIdFYB,),
                      SizedBox(height: 24.w),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
