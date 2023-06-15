import 'package:flutter/material.dart' hide PageController;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';

import 'package:ob_com_finance/src/modules/finance/deposit/component/quick_amount_group.dart';
import 'package:ob_com_finance/src/modules/finance/deposit/component/title_tile.dart';
import 'package:ob_com_finance/src/modules/finance/deposit/repository/ui_pay_type.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:sprintf/sprintf.dart';

import 'quick_trc_group.dart';
import 'universal_disposit_input_controller3.dart';

class UniversalDepositInput3 extends StatelessWidget {
  final UiPayType payType;
  final FocusNode amountFocus;
  final FormFieldValidator<String>? amountValidator;
  final GestureTapCallback? serviceTap;

  const UniversalDepositInput3({
    Key? key,
    required this.payType,
    this.amountValidator,
    required this.amountFocus,
    required this.serviceTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UniversalDepositInputController3>(
      init: UniversalDepositInputController3(
          payType, Get.find(), Get.find(), Get.find()),
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
              TitleTile(title: 'agent_n_coin_exchange_agree'.tr),
              Obx(
                () => QuickTrcGroup(
                  amounts: payType.virtualProtocols,
                  selected: controller.trcAmount,
                  onQuickTrcSelectListener: controller.onTrcAmountSelect,
                ),
              ),
              SizedBox(height: 30.w),
              TitleTile(title: 'agent_n_account_charge_input_amount'.tr),
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
                      AppCurrencyUtils.getAppCurrencySymbolIsVND()
                          ? (payType.depositMaxAmount! / 1000)
                          : payType.depositMaxAmount!,
                      selectionOffsetToLast: true,
                    ),
                  ],
                  showSuffixIcon: true,
                  suffixIcon: !AppCurrencyUtils.getAppCurrencySymbolIsVND()
                      ? InkWell(
                          onTap: () {
                            controller.onRaidAmountSelect(
                                payType.depositMaxAmount.toString());
                          },
                          child: Text(
                            'withdraw_maximum_amount'.tr,
                            style: const TextStyle(
                                fontSize: 12, color: Color(0xffE1A100)),
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
                                controller.onRaidAmountSelect(
                                    payType.depositMaxAmount.toString());
                              },
                              child: Text(
                                'withdraw_maximum_amount'.tr,
                                style: const TextStyle(
                                    fontSize: 12, color: Color(0xffE1A100)),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              if (!payType.isClosed) SizedBox(height: 12.w),
              if (!payType.isClosed)
                Obx(
                  () {
                    var currency =
                        ' ' + AppCurrencyUtils.getAppCurrencySymbol2();
                    var amount = AppCurrencyUtils.fixAmount3(
                        controller.usdtRate.value.toString(),
                        suffix: 'K');
                    return RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'agent_n_coin_will_pay'.tr,
                          style: TextStyle(
                              fontSize: 12.w,
                              color: Colors.white.withOpacity(0.6)),
                        ),
                        TextSpan(
                          text: controller.usdt.value,
                          style: TextStyle(
                            fontSize: 12.w,
                            color: ColorName.colorMain1,
                          ),
                        ),
                        TextSpan(
                          text: ' '+'agent_n_coin_will_pay_tip_3'.tr +
                              amount +
                              currency +
                              '）',
                          style: TextStyle(
                              fontSize: 12.w,
                              color: Colors.white.withOpacity(0.6)),
                        )
                      ]),
                    );
                  },
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
                  child: Text(
                    'deposit_now'.tr,
                    style: const TextStyle(fontSize: 16),
                  ),
                  block: true,
                  image: DecorationImage(
                    image: AssetImage(Assets.images.btnbg2.path,
                        package: BaseX.pkg),
                    fit: BoxFit.fill,
                  ),
                  size: ButtonSize.large,
                  disabled: !controller.isValidate,
                  loadingStatus: controller.isLoadingStatus.value,
                  onPressed: controller.applyDeposit,
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 64.w, bottom: 45.w),
                  child: ContactCustomerService(
                    prefixText: 'deposit_customer_service'.tr,
                    serviceTap: serviceTap,
                    jumpToAgentServicePage: Store.clientId == Store.clientIdFYB,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
