import 'package:flutter/widgets.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:cool_ui/cool_ui.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/component/ob_recycle_button.dart';
import 'package:ob_com_finance/src/modules/finance/transfer/transfer_controller.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class TransferPage extends StatefulWidget {
  final bool isHome;

  const TransferPage({Key? key, this.isHome = false}) : super(key: key);

  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransferController>(
      global: false,
      init:
          TransferController(Get.find(), Get.find(), isFromHome: widget.isHome),
      builder: (TransferController controller) {
        controller.isFromHome = widget.isHome;
        return ObTheme(
          child: Scaffold(
            bottomNavigationBar: ContactCustomerService(
                jumpToAgentServicePage: Store.clientId == Store.clientIdFYB),
            body: Column(
              children: [
                ///if (controller.isFromHome) DownloadTip(),
                AppBar(
                  title: ObNavigationBarTitle(controller.isFromHome
                      ? 'financial'.tr
                      : 'home_icon_transfer'.tr),
                  leading: controller.isFromHome
                      ? SizedBox.shrink()
                      : ObBackButton(),
                ),
                Divider(
                  height: 8.w,
                  thickness: 8.w,
                  color: const Color(0xff0E1519),
                ),
                _buildTopHintRow(controller, context),
                SizedBox(height: 16.w),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Form(
                      key: controller.formKey,
                      onChanged: controller.onFormChanged,
                      child: Column(
                        children: [
                          _buildWalletToolBox(controller, context),
                          SizedBox(height: 32.w),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'agent_transfer_transfer_money'.tr,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 21.w),
                          _buildInput(context, controller),
                          _buildWalletSummary(controller),
                          SizedBox(height: 24.w),
                          _buildSubmitButton(controller, context),
                          SizedBox(height: 16.w),
                          _buildRecycleButton(controller),
                          SizedBox(height: 24.w),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Container _buildWalletSummary(TransferController controller) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 40.w,
      child: Row(
        children: [
          Obx(
            () => Text(
              controller.transferOutAccount == null
                  ? 'transfer_to_be_selected_to_transfer_out_wallet'.tr
                  : controller.transferOutAccount!.accountName ==
                          'mine_center_wallet'.tr
                      ? 'mine_center_wallet_transfer_existing'.tr
                      : '${controller.transferOutAccount!.accountName}${'transfer_existing'.tr}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ),
          SizedBox(width: 4.w),
          Obx(
            () => Text(
              controller.transferOutAccount == null
                  ? '--'
                  : '${AppCurrencyUtils.dealBalance(controller.getAccountBalance(controller.transferOutAccount).toString())}',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: FontFamily.dINMedium,
                  package: BaseX.pkg2,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Obx _buildRecycleButton(TransferController controller) {
    return Obx(
      () => Visibility(
        visible: BalanceManager.walletItems.isNotEmpty &&
            !controller.isTryPlay &&
            !BalanceManager.isAllWalletDisabled,
        child: ObRecycleButton(
          type: 'transfer',
          maxWidth: 1.sw - 32.w,
          minHeight: 40,
          height: 40,
          fontSize: 16,
          walletItems: BalanceManager.walletItems,
          onPressed: controller.recyclerBalance,
        ),
      ),
    );
  }

  Obx _buildSubmitButton(TransferController controller, BuildContext context) {
    return Obx(
      () => OBasePrimaryButton(
        child: Text('vip_level_trans_confirm'.tr),
        onPressed: () {
          if (!controller.isLoadingStatus.value) controller.transfer(context);
        },
        block: true,
        image: DecorationImage(
          image: AssetImage(Assets.images.btnbg2.path, package: BaseX.pkg),
          fit: BoxFit.fill,
        ),
        disabled: !(controller.isValidate &&
                controller.getAccountBalance(controller.transferOutAccount) >=
                    1) &&
            !controller.isLoadingStatus.value,
        loadingStatus: controller.isLoadingStatus.value,
        size: ButtonSize.large,
      ),
    );
  }

  Obx _buildWalletToolBox(TransferController controller, BuildContext context) {
    return Obx(
      () => Container(
        height: 139.w,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: ColorName.walletToolBg,
          border: Border.all(
            width: 1.w,
            color: Colors.white.withOpacity(0.1),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.w, bottom: 30.w, left: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleDot(color: Color(0xff3BC117)),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < 8; i++)
                        Container(
                          width: 1.w,
                          height: 3.w,
                          margin: EdgeInsets.only(
                            bottom: 2.w,
                          ),
                          color: Colors.white.withOpacity(0.6),
                        )
                    ],
                  ),
                  const Spacer(),
                  CircleDot(color: Colors.white.withOpacity(0.6)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 26.w, bottom: 26.w, left: 8.w),
              child: Column(
                children: [
                  Text(
                    'from'.tr,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'to'.tr,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              children: [
                _buildOutWallet(controller, context),
                Container(
                  width: 183.w,
                  height: 1.w,
                  color: Colors.white.withOpacity(0.06),
                ),
                _buildInWallet(controller, context),
              ],
            ),
            const Spacer(),
            _buildConvertSwitch(controller),
          ],
        ),
      ),
    );
  }

  Obx _buildInput(BuildContext context, TransferController controller) {
    return Obx(
      () => InputAmount(
        controller: controller.transferAmountCtrl,
        showSuffix: false,
        focusNode: controller.focusNode,
        inputFormatters: [
          PrecisionLimitFormatter(2),
          TextNumberLimitFormatter(
              controller.curIsVND
                  ? controller.transferMaxAmount.floor() / 1000
                  : controller.transferMaxAmount,
              selectionOffsetToLast: true,
              format: true),
          MaskMoneyTextInputFormatter(),
        ],
        keyboardType: CustomNumberKeyboard.inputFloatNumberPad,
        validator: openClosedRangeValidator(
          controller.curIsVND ? 10 / 1000 : controller.transferMinAmount,
          controller.curIsVND
              ? controller.transferMaxAmount / 1000
              : controller.transferMaxAmount,
        ),
        hint: 'vip_level_trans_hintText'.tr,
        showSuffixIcon: true,
        suffixIcon: !AppCurrencyUtils.getAppCurrencySymbolIsVND()
            ? InkWell(
                onTap: () {
                  controller.transferAll();
                },
                child: Text(
                  'withdraw_all_amount'.tr,
                  style:
                      const TextStyle(fontSize: 12, color: Color(0xffE1A100)),
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
                      controller.transferAll();
                    },
                    child: Text(
                      'withdraw_maximum_amount'.tr,
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xffE1A100)),
                    ),
                  )
                ],
              ),
      ),
    );
  }

  GestureDetector _buildConvertSwitch(TransferController controller) {
    return GestureDetector(
      onTap: controller.switchAccount,
      child: Container(
        width: 56.w,
        alignment: Alignment.center,
        color: Colors.white.withOpacity(0.04),
        child: pkObImage(
          Assets.images.icon.walletJiaohuan.path,
          width: 24.w,
        ),
      ),
    );
  }

  DecoratedBox _buildTopHintRow(
      TransferController controller, BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => controller.showTip(context),
              child: Row(
                children: [
                  SizedBox(width: 16.w),
                  pkObImage(
                    Assets.images.icon.walletHint.path,
                    width: 16.w,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 40.w,
                      child: Text(
                        'transfer_bring_in_the_amount'.tr,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.2,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => ObSwitchImage(
              value: controller.authService.isAutoTransferOpen,
              onChanged: (bool value) {
                controller.toggleAutoTransferSwitch(context);
              },
              imageOn: pkObImage(
                Assets.images.switchOn.path,
              ),
              imageOff: pkObImage(
                Assets.images.switchOff.path,
              ),
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),
    );
  }

  GestureDetector _buildAppBarAction() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        PublicResources.jumpToNavigateHelp(PublicResources.transferKey);
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.w),
          child: Text(
            'help_course_title3'.tr,
            style: TextStyle(color: Colors.white.withOpacity(0.6)),
          ),
        ),
      ),
    );
  }

  Widget _buildOutWallet(TransferController controller, BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        controller.selectTransferOutAccount(context);
      },
      child: SizedBox(
        width: 183.w,
        height: 68.w,
        child: Row(
          children: [
            Text(
              controller.transferOutAccount != null
                  ? controller.transferOutAccount!.accountName
                  : 'transfer_click_to_select'.tr,
              style: TextStyle(
                fontSize: 14,
                color: controller.transferOutAccount != null
                    ? Colors.white
                    : Colors.white.withOpacity(0.3),
              ),
            ),
            SizedBox(width: 16.w),
            if (!controller.isTransferOutFromCenter)
              pkObImage(
                Assets.images.icon.homeMoreRight.path,
                width: 16.w,
                height: 16.w,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInWallet(TransferController controller, BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        controller.selectTransferInAccount(context);
      },
      child: SizedBox(
        width: 183.w,
        height: 68.w,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.transferInAccount != null
                      ? controller.transferInAccount!.accountName
                      : 'transfer_click_to_select'.tr,
                  style: TextStyle(
                    fontSize: 14,
                    color: controller.transferInAccount != null
                        ? Colors.white
                        : Colors.white.withOpacity(0.3),
                  ),
                ),
                SizedBox(width: 1.w),
                if (controller.transferInAccount != null)
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: '${'transfer_existing'.tr} ${'symbol'.tr}'),
                        TextSpan(
                          text:
                              '${AppCurrencyUtils.dealBalance(controller.getAccountBalance(controller.transferInAccount).toString())}',
                          style: const TextStyle(
                            fontFamily: FontFamily.dINMedium,
                            package: BaseX.pkg2,
                          ),
                        )
                      ],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
              ],
            ),
            if (controller.isTransferOutFromCenter)
              pkObImage(
                Assets.images.icon.homeMoreRight.path,
                width: 16.w,
                height: 16.w,
              ),
          ],
        ),
      ),
    );
  }
}

class CircleDot extends StatelessWidget {
  const CircleDot({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 8.w,
      height: 8.w,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.w),
        ),
        color: color,
      ),
    );
  }
}
