import 'package:cool_ui/cool_ui.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_finance/src/modules/finance/add_bank_account/add_bank_account_controller.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme, PrimaryButton;
import 'component/tip.dart';

class AddBankAccountPage extends StatelessWidget {
  const AddBankAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardMediaQuery(
        child: GetBuilder(
      init: AddBankAccountController(Get.find(), Get.find()),
      builder: (AddBankAccountController controller) {
        return ObTheme(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: ObNavigationBarTitle('add_bank_card_title'.tr),
              leading: ObBackButton(),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                onChanged: controller.onFormChanged,
                child: Column(
                  children: [
                    Divider(
                        height: 8.w, thickness: 8.w, color: Color(0xff0E1519)),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12.w,
                          ),
                          Text(
                            'user_profile_actual_name'.tr,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                          InputBelowBorder(
                              height: 45.w,
                              style: TextStyle(color:controller.enable.value?Colors.white:Colors.grey ),
                              enabled:controller.enable.value,
                              controller: controller.nameCtrl,
                              //enabled: controller.isAllowTypeUserName,
                              maxLength: 64,
                              validator: noEmptyValidator,
                              onChanged: (value) {
                                controller.onChangedName(value);
                              },
                              keyboardType: TextInputType.streetAddress,
                              contentPadding:
                                  EdgeInsets.only(bottom: 8.w, top: 8.w),
                              inputFormatters: [
                                OBRealNameFormatter.realName,
                              ],
                              hintText:
                                  'add_bank_account_please_enter_cardholder_name'
                                      .tr),
                          Obx(
                            () => Text(
                              controller.errorTextName.value,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          TextFormField(
                            onTap: () => controller.showBankBottomSheet(),
                            validator: noEmptyValidator,
                            controller: controller.bankNameCtrl,
                            readOnly: true,
                            cursorColor: Get.theme.textSelectionTheme.cursorColor,
                            decoration: InputDecoration(
                              contentPadding:EdgeInsets.only(bottom: 8.w,top: 8.w),
                              hintText: 'select_open_bank'.tr,
                              labelText: 'add_bank_account_affiliated_bank'.tr,
                              suffixIcon: Container(
                                width: 24.w,
                                alignment: Alignment.bottomRight,
                                child: pkObImage(
                                  Assets.images.icon.homeMoreRight.path,
                                  width: 24.w,
                                  height: 24.w,
                                ),
                              ),
                              focusedErrorBorder: underlineBorder(),
                              errorBorder: underlineBorder(),
                              enabledBorder: underlineBorder(),
                              focusedBorder: underlineBorder(),
                            ),
                          ),
                          Obx(
                            () => Text(
                              controller.errorCardName.value,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Text(
                            'bank_card_number'.tr,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                          InputBelowBorder(
                            height: 45.w,
                            controller: controller.bankCardNumberCtrl,
                            maxLength: 30,
                            validator: noEmptyValidator,
                            onChanged: (value) {
                              controller.onChanged(value);
                            },
                            keyboardType: CustomNumberKeyboard.inputIntNumberPad,
                            contentPadding: EdgeInsets.only(bottom: 8.w, top: 8.w),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(30),
                            ],
                            hintText: 'input_bank_card_number'.tr,
                          ),
                          Obx(
                            () => Text(
                              controller.errorText.value,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          SizedBox(height: 32.w),
                          Obx(
                            () => OBasePrimaryButton(
                              child: Text(
                                'add_bank_card'.tr,
                                style: TextStyle(fontSize: 16),
                              ),
                              image: DecorationImage(
                                image: AssetImage(Assets.images.btnbg2.path, package: BaseX.pkg),
                                fit: BoxFit.fill,
                              ),
                              onPressed: () => controller.apply(),
                              block: true,
                              size: ButtonSize.large,
                              disabled: !controller.validate.value,
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(
                              minHeight: 60.w,
                              maxHeight: 226.w,
                            ),
                          ),
                          Center(
                            child: ContactCustomerService(
                              jumpToAgentServicePage:
                                  Store.clientId == Store.clientIdFYB,
                            ),
                          ),
                          SizedBox(height: 24.w),
                        ],
                      ),
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

  InputBorder underlineBorder() {
    return UnderlineInputBorder(
      // 焦点集中的时候颜色
      borderSide: BorderSide(color: Color(0xFFFFFFF)),
    );
  }
}
