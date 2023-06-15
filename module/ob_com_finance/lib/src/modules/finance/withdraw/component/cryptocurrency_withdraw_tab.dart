import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/account/component/dic.dart';
import 'package:ob_com_finance/src/modules/finance/add_bank_account/component/tip.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/component/bank_card_item.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/component/refresh_lottie.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/withdraw_controller.dart';

import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:sp_util/sp_util.dart';
import '../cryptocurrency_withdraw_controller.dart';

class CryptoCurrencyWithdrawTab extends StatelessWidget {
  CryptoCurrencyWithdrawTab({Key? key}) : super(key: key);
  final parentController = Get.find<WithdrawController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CryptoCurrencyWithdrawController>(
      init: Get.find<CryptoCurrencyWithdrawController>(),
      builder: (CryptoCurrencyWithdrawController controller) {
        return Container(
          margin: EdgeInsets.only(top: 8.w),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Stack(
            children: [
              Form(
                key: controller.formKey,
                onChanged: controller.onFormChanged,
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (controller.selectableUSDTs.isEmpty)
                        _buildNoBankCard(controller)
                      else
                        _buildHaveBankCard(controller),
                      _buildNormalView(controller),
                      Center(
                        child: ContactCustomerService(
                          prefixText:
                              'withdraw_having_trouble_withdrawing_money'.tr,
                          jumpToAgentServicePage:
                              Store.clientId == Store.clientIdFYB,
                        ),
                      ),
                      SizedBox(height: 24.w),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  BankCardItem _buildHaveBankCard(CryptoCurrencyWithdrawController controller) {
    return BankCardItem(
      bg: AssetImage(Assets.images.bg.bankUsdt.path, package: BaseX.pkg),
      bankIcon: pkObImage(
        USDT_PROTOCOL_ICON_DIC[
                controller.selectedUSDTAccount?.virtualProtocol] ??
            '',
        width: 24.w,
        height: 24.w,
      ),
      showIcon: false,
      bankName: '${controller.selectedUSDTAccount?.virtualKind}',
      cardName: '${controller.selectedUSDTAccount?.cnName}',
      realName: '${controller.selectedUSDTAccount?.virtualProtocol}' +
          'virtual_protocol'.tr,
      //'${realNameFormat(controller.selectedUSDTAccount?.realName ?? '')}',
      cardNum:
          '**** **** **** ${controller.selectedUSDTAccount?.virtualAddress!.substring(4)}',
      actionButton: _buildWithdrawButton(controller),
    );
  }

  BankCardItem _buildNoBankCard(CryptoCurrencyWithdrawController controller) {
    return BankCardItem(
      bg: AssetImage(Assets.images.bg.bankUsdt.path, package: BaseX.pkg),
      showIcon: true,
      bankIcon: GestureDetector(
        onTap: controller.addUSDTAccount,
        child: pkObImage(
          Assets.images.icon.depositAdd.path,
          width: 24.w,
          height: 24.w,
        ),
      ),
      bankName: 'withdraw_no_virtual_currency_address'.tr,
      cardName: 'withdraw_add_a_virtual_currency_address'.tr,
      cardNum: '**** **** **** ****',
      realName: '***',
      typeStyle: false,
      cardStyle: CardStyle.nullable,
      actionButton: _buildWithdrawButton(controller),
    );
  }

  Widget _buildWithdrawButton(CryptoCurrencyWithdrawController controller) {
    if (controller.selectableUSDTs.length < 2) {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: controller.addUSDTAccount,
        child: Padding(
          padding: EdgeInsets.only(left: 12.w, top: 12.w, bottom: 12.w),
          child: DecoratedBox(
            decoration: Store.clientId == Store.clientIdDJ
                ? BoxDecoration(
                    color: Get.theme.buttonTheme.colorScheme!.primary,
                    borderRadius: BorderRadius.circular(16.w))
                : BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        Assets.images.btnRound1.path,
                        package: BaseX.pkg,
                      ),
                      // fit: BoxFit.fitHeight,
                    ),
                  ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 9.w),
              alignment: Alignment.topCenter,
              child: Row(
                children: [
                  Text(
                    'withdraw_new_plus'.tr,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 12, height: 0.6),
                  ),
                  Text(
                    'withdraw_new'.tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: controller.selectUSDTAccount,
        child: DecoratedBox(
          decoration: BoxDecoration(
            // color: Get.theme.colorScheme.primary.withOpacity(0.06),
            // borderRadius: BorderRadius.circular(16.w),
            image: DecorationImage(
              image: AssetImage(
                Assets.images.btnRound2.path,
                package: BaseX.pkg,
              ),
              // fit: BoxFit.fitHeight,
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 9.w),
            alignment: Alignment.center,
            child: Text('withdraw_replace'.tr),
          ),
        ),
      );
    }
  }

  Widget _buildTip(CryptoCurrencyWithdrawController controller) {
    return Tip(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
      margin: EdgeInsets.only(top: 12.w),
      borderRadius: 8.w,
      backgroundColor: Colors.white.withOpacity(0.04),
      child: _buildLimitTip(controller),
    );
  }

  Widget _buildLimitTip(CryptoCurrencyWithdrawController controller) {
    if (LocaleUtils.isLocale) {
      return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: 'withdraw_number_of_withdrawals_available_today'
                        .tr
                        .breakWordOnWeb),
                TextSpan(
                  text: '${controller.dateNum}'.breakWordOnWeb,
                  style: const TextStyle(
                    fontFamily: FontFamily.dINMedium,
                    package: BaseX.pkg2,
                  ),
                ),
                TextSpan(text: 'withdraw_bout'.tr),
                // TextSpan(text: ' ${'rmb'.tr}'),
              ]),
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 12,
              ),
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(text: controller.getWithdrawLimitToday()),
                TextSpan(
                  text:
                      '${AppCurrencyUtils.dealBalance(controller.dateWithdrawAbleAmount.toString())}'
                          .breakWordOnWeb
                          .breakWordOnApp,
                  style: const TextStyle(
                    fontFamily: FontFamily.dINMedium,
                    package: BaseX.pkg2,
                  ),
                ),
              ]),
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 12,
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: controller
                          .getSingleWithdrawalAmount()
                          .breakWordOnWeb),
                  TextSpan(
                    text:
                        '${AppCurrencyUtils.dealBalance(controller.virtualCardMaxAmount.toString())}'
                            .breakWordOnWeb,
                    style: const TextStyle(
                      fontFamily: FontFamily.dINMedium,
                      package: BaseX.pkg2,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 12,
              ),
            )
          ],
        ),
      );
    }
    return Text.rich(
      TextSpan(children: [
        TextSpan(
            text: 'withdraw_number_of_withdrawals_available_today'
                .tr
                .breakWordOnWeb),
        TextSpan(
          text: '${controller.dateNum}'.breakWordOnWeb,
          style: const TextStyle(
            fontFamily: FontFamily.dINMedium,
            package: BaseX.pkg2,
          ),
        ),
        TextSpan(text: 'withdraw_bout'.tr),
        TextSpan(text: controller.getWithdrawLimitToday()),
        TextSpan(
          text:
              '${AppCurrencyUtils.dealBalance(controller.dateWithdrawAbleAmount.toString())}'
                  .breakWordOnWeb
                  .breakWordOnApp,
          style: const TextStyle(
            fontFamily: FontFamily.dINMedium,
            package: BaseX.pkg2,
          ),
        ),
        TextSpan(
          text: controller.getSingleWithdrawalAmount().breakWordOnWeb,
        ),
        TextSpan(
          text:
              '${AppCurrencyUtils.dealBalance(controller.virtualCardMaxAmount.toString())}'
                  .breakWordOnWeb,
          style: const TextStyle(
            fontFamily: FontFamily.dINMedium,
            package: BaseX.pkg2,
          ),
        ),
        // TextSpan(text: ' ${'rmb'.tr}'),
      ]),
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontSize: 12,
      ),
    );
  }

  Widget _buildNormalView(CryptoCurrencyWithdrawController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32.w),
        if (Store.clientId == Store.clientIdDJ)
          Row(
            children: [
              Text(
                "account_balance".tr,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
              SizedBox(
                width: 4.w,
              ),
              Obx(
                () => Text(
                  BalanceManager.formatCenterBalance,
                  style: TextStyle(
                    fontSize: 14,
                    color: Get.theme.colorScheme.primary,
                    fontFamily: "Gotham-Medium",
                  ),
                ),
              ),
              SizedBox(
                width: 7.5.w,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: RefreshLottie(
                  width: 16.w,
                  height: 16.h,
                ),
              ),
            ],
          ),
        if (Store.clientId == Store.clientIdDJ)
          SizedBox(
            height: 16.w,
          ),
        Text(
          'agent_n_withdrawal_amount'.tr,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16.w),
        _buildInputRow(controller),
        SizedBox(height: 12.w),
        _buildSummaryRow(controller),
        Text.rich(
          TextSpan(
            text: 'withdraw_expected_to_arrive'.tr,
            children: [
              TextSpan(
                text: controller.expectedAmount.value,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: FontFamily.dINMedium,
                  package: BaseX.pkg2,
                ),
              ),
              const TextSpan(text: ' USDT'),
            ],
          ),
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
        Text.rich(
          TextSpan(
            text: 'withdraw_estimated_handling_fee'.tr,
            children: [
              const TextSpan(
                text: '0.00',
                style: TextStyle(
                  color: Color(0xffE7BB02),
                  fontFamily: FontFamily.dINMedium,
                  package: BaseX.pkg2,
                ),
              ),
              const TextSpan(text: ' USDT'),
              TextSpan(text: 'withdraw_reference_exchange_rate'.tr),
              const TextSpan(
                text: '1 ',
                style: TextStyle(
                  fontFamily: FontFamily.dINMedium,
                  package: BaseX.pkg2,
                ),
              ),
              const TextSpan(text: 'USDT = '),
              TextSpan(
                text: AppCurrencyUtils.dealBalance(
                        controller.exchangeRate.toString()) +
                    " ",
                style: const TextStyle(
                  fontFamily: FontFamily.dINMedium,
                  package: BaseX.pkg2,
                ),
              ),
              TextSpan(
                  text:
                      '${SpUtil.getString(Constants.appCurrency, defValue: "CNY")!}）'),
            ],
          ),
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
        _buildTip(controller),
        SizedBox(height: 32.w),
        _buildSubmitButton(controller),
        SizedBox(height: 24.w),
        if (Store.clientId != Store.clientIdDJ) _buildRemarks(),
        Container(
          constraints: BoxConstraints(
            minHeight: 30.w,
            maxHeight: 58.w,
          ),
        ),
      ],
    );
  }

  Center _buildRemarks() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Text(
          'withdraw_recycle_all_the_venue_wallets_to_the_central_wallet'
              .tr
              .breakWordOnWeb,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(CryptoCurrencyWithdrawController controller) {
    return OBasePrimaryButton(
      child: Text(
        'immediately_withdraw'.tr,
        style: const TextStyle(
          height: 1.1,
        ),
      ),
      image: DecorationImage(
        image: AssetImage(Assets.images.btnbg2.path, package: BaseX.pkg),
        fit: BoxFit.fill,
      ),
      size: ButtonSize.large,
      onPressed: () {
        if (!controller.isLoadingStatus.value) controller.withdrawUSDT();
      },
      disabled: !(controller.isValidate &&
              controller.allowWithdraw == true &&
              controller.isInputInRange &&
              controller.dateNum > 0) &&
          !controller.isLoadingStatus.value,
      loadingStatus: controller.isLoadingStatus.value,
      block: true,
    );
  }

  Widget _buildSummaryRow(CryptoCurrencyWithdrawController controller) {
    if (controller.allowWithdraw == null) {
      return const Text(
        ' ',
        style: TextStyle(
          fontSize: 12,
        ),
      );
    } else if (controller.allowWithdraw == true) {
      if (controller.dateNum == 0) {
        return Text(
          'withdraw_withdrawals_available_today'.tr,
          style: TextStyle(
            fontSize: 12,
            color: ColorName.redFF5722,
          ),
        );
      } else if (controller.dateWithdrawAbleAmount == 0) {
        return Text(
          'withdraw_today_has_been_exhausted'.tr,
          style: TextStyle(
            fontSize: 12,
            color: ColorName.redFF5722,
          ),
        );
      } else {
        return Text.rich(
          TextSpan(
            text: controller.getWithdrawAvailable(),
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.6),
            ),
            children: [
              TextSpan(
                text: BalanceManager.formatCenterBalance,
                style: const TextStyle(color: Colors.white),
              ),
              //TextSpan(text: ' ${'rmb'.tr}'),
            ],
          ),
        );
      }
    } else {
      return Text.rich(
        TextSpan(
          text: 'withdraw_still_needed'.tr,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.6),
          ),
          children: [
            TextSpan(
              text: AppCurrencyUtils.getAppCurrencySymbolIsVND()
                  ? "${(controller.totalDifferentAmount / 1000).fixed(2)}K"
                  : AppCurrencyUtils.dealBalance(
                      controller.totalDifferentAmount.toString(),
                    ),
              style: TextStyle(
                color: ColorName.colorMain,
              ),
            ),
            // TextSpan(text: 'rmb'.tr),
            TextSpan(text: 'withdraw_can_only_be_made_with_running_water'.tr),
            TextSpan(
              text: 'check_profit_loss_details'.tr,
              style: TextStyle(
                color: ColorName.colorMain,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = Get.find<WithdrawController>().showFlowDialog,
            ),
          ],
        ),
      );
    }
  }

  Widget _buildInputRow(CryptoCurrencyWithdrawController controller) {
    return InputAmount(
      showSuffixIcon: true,
      focusNode: parentController.cryptoFocusNode,
      controller: controller.usdtAccountAmountCtrl,
      inputFormatters: [
        PrecisionLimitFormatter(2),
        TextNumberLimitFormatter(
          AppCurrencyUtils.getAppCurrencySymbolIsVND()
              ? controller.usdtWithdrawMaxAmount / 1000
              : controller.usdtWithdrawMaxAmount,
          selectionOffsetToLast: true,
        ),
      ],
      enabled: controller.allowWithdraw ?? false,
      validator: AppCurrencyUtils.getAppCurrencySymbolIsVND()
          ? openClosedRangeValidator(
              controller.usdtWithdrawMinAmount / 1000,
              controller.usdtWithdrawMaxAmount / 1000,
            )
          : openClosedRangeValidator(
              controller.usdtWithdrawMinAmount,
              controller.usdtWithdrawMaxAmount,
            ),
      hintStyle: TextStyle(
        fontFamily: "PingFangSC-Regular",
        fontSize: 12,
        color: Colors.white.withOpacity(0.3),
      ),
      hint: controller.getInputHint(),
      suffixIcon: !AppCurrencyUtils.getAppCurrencySymbolIsVND()
          ? InkWell(
              onTap: () {
                controller.withdrawMaxAmount();
                parentController.cryptoFocusNode.unfocus();
              },
              child: Text(
                'withdraw_maximum_amount'.tr,
                style: const TextStyle(fontSize: 12, color: Color(0xffE1A100)),
              ),
            )
          : Row(
              children: [
                Text(
                  "K ",
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontFamily: FontFamily.gothamMedium,
                    package: BaseX.pkg2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.withdrawMaxAmount();
                    parentController.cryptoFocusNode.unfocus();
                  },
                  child: Text(
                    'withdraw_maximum_amount'.tr,
                    style:
                        const TextStyle(fontSize: 12, color: Color(0xffE1A100)),
                  ),
                )
              ],
            ),
    );
  }
}
