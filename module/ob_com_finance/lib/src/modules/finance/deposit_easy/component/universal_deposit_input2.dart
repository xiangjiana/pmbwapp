import 'package:flutter/material.dart' hide PageController;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/deposit/component/quick_amount_group.dart';
import 'package:ob_com_finance/src/modules/finance/deposit/component/title_tile.dart';
import 'package:ob_com_finance/src/modules/finance/deposit/repository/ui_pay_type.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

import 'universal_disposit_input_controller2.dart';

class UniversalDepositInput2 extends StatelessWidget {
  final UiPayType payType;
  final FocusNode amountFocus;
  final FormFieldValidator<String>? amountValidator;
  final GestureTapCallback? serviceTap;

  const UniversalDepositInput2({
    Key? key,
    required this.payType,
    this.amountValidator,
    required this.amountFocus,
    required this.serviceTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UniversalDepositInputController2>(
      init: UniversalDepositInputController2(payType, Get.find(), Get.find(), Get.find()),
      global: false,
      builder: (controller) {
        if (controller.payType != payType) {
          controller.payType = payType;
        }
        String sHint;
        if (AppCurrencyUtils.getAppCurrencySymbolIsVND()) {
          sHint = '${AppCurrencyUtils.fixAmount2(
            payType.depositMinAmount,
          )}~${AppCurrencyUtils.fixAmount2(
            payType.depositMaxAmount,
            suffix: 'K',
          )}';
        } else {
          sHint = '${payType.depositMinAmount}~${payType.depositMaxAmount}';
        }
        return Form(
          key: controller.formKey,
          onChanged: controller.onFormChanged,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.payType.needFlag==1?     TextFormField(
                onTap: () => controller.showBankBottomSheet(),
                validator: noEmptyValidator,
                controller: controller.bankNameCtrl,
                readOnly: true,
                cursorColor: Get.theme.textSelectionTheme.cursorColor,
                decoration: InputDecoration(
                  contentPadding:EdgeInsets.only(bottom: 8.w,top: 8.w),
                  hintText: 'select_open_bank'.tr,
                  labelText: 'add_bank_account_affiliated_bank'.tr,
                  labelStyle:const TextStyle(
                    color:Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ) ,
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
              ):const SizedBox(),
              Column(
                children: [
                  TitleTile(title: 'deposit_name'.tr),
                  InputBelowBorder(
                    height: 45.w,
                    controller: controller.nameCtrl,
                    focusNode: controller.nameFocusNode,
                    enabled: true,
                    maxLength: 64,
                    validator: noEmptyValidator2,
                    keyboardType: TextInputType.streetAddress,
                    contentPadding: EdgeInsets.only(bottom: 8.w, top: 8.w),
                    inputFormatters: [
                      OBRealNameFormatter.realName,
                      FilteringTextInputFormatter.singleLineFormatter,
                      LengthLimitingTextInputFormatter(64),
                    ],
                    hintText: 'deposit_name_input_hint'.tr,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Obx(() => Text(
                      controller.errorTextName.value,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                    ),
                  )
                ],
              ),

              SizedBox(height: 24.w),
              TitleTile(title: 'deposit_amount'.tr),
              SizedBox(
                height: payType.isClosed ? 0 : null,
                child: InputAmount(
                  controller: controller.amountCtrl,
                  validator: amountValidator,
                  focusNode: amountFocus,
                  hint: 'deposit_input_hint'.tr + sHint,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TextNumberLimitFormatter(
                      AppCurrencyUtils.getAppCurrencySymbolIsVND()?payType.depositMaxAmount!/1000:    payType.depositMaxAmount!,
                      selectionOffsetToLast: true,
                    ),
                  ],
                  showSuffixIcon: true,
                  suffixIcon: !AppCurrencyUtils.getAppCurrencySymbolIsVND()
                      ? InkWell(
                          onTap: () {
                            controller.onRaidAmountSelect(payType.depositMaxAmount.toString());
                          },
                          child: Text(
                            'withdraw_maximum_amount'.tr,
                            style: const TextStyle(fontSize: 12, color: Color(0xffE1A100)),
                          ),
                        )
                      : Row(
                          children: [
                            const Text(
                              "K ",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontFamily: FontFamily.gothamMedium,
                                package: BaseX.pkg2,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.onRaidAmountSelect(payType.depositMaxAmount.toString());
                              },
                              child: Text(
                                'withdraw_maximum_amount'.tr,
                                style: const TextStyle(fontSize: 12, color: Color(0xffE1A100)),
                              ),
                            )
                          ],
                        ),
                ),
              ),
              SizedBox(height: 12.w),
              Obx(
                () => QuickAmountGroup(
                  amounts: payType.fixedAmount,
                  selected: controller.editAmount,
                  onQuickAmountSelectListener: controller.onRaidAmountSelect,
                ),
              ),
              SizedBox(height: 40.w),
              Obx(
                () => OBasePrimaryButton(
                  child: Text('deposit_now'.tr, style: const TextStyle(fontSize: 16)),
                  block: true,
                  size: ButtonSize.large,
                  image: DecorationImage(
                    image: AssetImage(Assets.images.btnbg2.path,
                        package: BaseX.pkg),
                    fit: BoxFit.fill,
                  ),
                  disabled: !controller.isValidate||(controller.payType.needFlag==1&&controller.bankNameCtrl.text.isEmpty),
                  loadingStatus: controller.isLoadingStatus.value,
                  onPressed: controller.applyDeposit,
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 64.w, bottom: 45.w),
                child: ContactCustomerService(
                  prefixText: 'deposit_customer_service'.tr,
                  serviceTap: serviceTap,
                  jumpToAgentServicePage: Store.clientId == Store.clientIdFYB,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  InputBorder underlineBorder() {
    return const UnderlineInputBorder(
      // 焦点集中的时候颜色
      borderSide: BorderSide(color: Color(0xFFFFFFF)),
    );
  }
}
