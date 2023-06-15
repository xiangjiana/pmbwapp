import 'package:flutter/services.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:cool_ui/cool_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_package/modules/vip/vip_level/vip_level_controller.dart';
import 'package:ob_component/ob_component.dart';

class TransferDialog extends GetView<VipLevelController> {
  const TransferDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardMediaQuery(
        child: ObDialog(
      insetPadding: EdgeInsets.only(bottom: 16.w),
      titleWidget: _buildTitle(controller),
      contentWidget: _buildContent(context, controller),
      actionsWidget: _buildActions(controller),
    ));
  }

  Container _buildTitle(VipLevelController controller) {
    return Container(
      color: Colors.white.withOpacity(0.04),
      height: 48.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              'vip_level_trans_from'.tr,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: "PingFangSC-Medium",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 40.w, right: 35.w),
            width: 24.w,
            height: 24.w,
            child: ObImage.asset(Assets.images.icon.iconTranferArrow.path),
          ),
          Container(
            child: Obx(
              () => Text(
                "${controller.selectedVenueName.value}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: "PingFangSC-Medium",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _buildContent(BuildContext context, VipLevelController controller) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 12.w, left: 16.w),
          child: Text(
            "vip_level_trans_tips".tr,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.w, left: 16.w, bottom: 25.w),
          child: Row(
            children: [
              Container(
                child: Text(
                  'vip_level_trans_content'.tr,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16.w),
                child: Text(
                  "${BalanceManager.formatCenterBalance}",
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      color: Color(0xFFE1A100),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Gotham-Medium",
                      height: 1),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: InputAmount(
            controller: controller.textController,
            focusNode: controller.focusNode,
            inputFormatters: [
              LengthLimitingTextInputFormatter(11),
              PrecisionLimitFormatter(2),
              controller.curIsVND
                  ? TextNumberLimitFormatter(
                      double.parse(BalanceManager.centerBalance.value
                              .replaceAll(',', '')) /
                          1000.0,
                      selectionOffsetToLast: true,
                      format: true)
                  : TextNumberLimitFormatter(
                      (num.tryParse(BalanceManager.centerBalance.value
                              .replaceAll(',', '')) ??
                          0.00),
                      selectionOffsetToLast: true,
                      format: true),
              MaskMoneyTextInputFormatter(),
            ],
            autofocus: true,
            showSuffix: true,
            keyboardType: CustomNumberKeyboard.inputFloatNumberPad,
            hint: 'vip_level_trans_hintText'.tr,
            suffixTxt: 'vip_level_trans_all'.tr,
            showSuffixIcon: true,
            suffixIcon: !AppCurrencyUtils.getAppCurrencySymbolIsVND()
                ? _buildInkWell(controller)
                : Row(
                    children: [
                      const Text(
                        "K ",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontFamily: FontFamily.gothamMedium,
                          fontWeight: FontWeight.w500,
                          package: BaseX.pkg2,
                        ),
                      ),
                      _buildInkWell(controller)
                    ],
                  ),
            onTapSuffix: () {
              _transferAll(controller);
            },
          ),
        ),
      ],
    );
  }

  InkWell _buildInkWell(VipLevelController controller) {
    return InkWell(
      onTap: () {
        _transferAll(controller);
      },
      child: Container(
        constraints: BoxConstraints(maxWidth: 60.w),
        child: Text(
          'vip_level_trans_all'.tr,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, color: Color(0xffE1A100)),
        ),
      ),
    );
  }

  Container _buildActions(VipLevelController controller) {
    return Container(
      margin: EdgeInsets.only(top: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 135.w,
            child: OBasePrimaryButton(
              block: true,
              size: ButtonSize.large,
              image: DecorationImage(
                image: AssetImage(Assets.images.btnbg3.path, package: BaseX.pkg),
                fit: BoxFit.fill,
              ),
              onPressed: () => Get.back(result: false),
              child: Text(
                "search_cancel".tr,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            width: 135.w,
            child: Obx(
              () => OBasePrimaryButton(
                block: true,
                size: ButtonSize.large,
                image: DecorationImage(
                  image: AssetImage(Assets.images.btnbg2.path, package: BaseX.pkg),
                  fit: BoxFit.fill,
                ),
                onPressed: () => _onConfirm(controller),
                disabled: !(controller.isAllowTransfer),
                child: Text(
                  'vip_level_trans_confirm'.tr,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onConfirm(VipLevelController controller) {
    controller.focusNode.unfocus();
    if (controller.textController.text.isNullOrEmpty) {
      Get.back(result: false);
    }
    if (double.parse(controller.textController.text.replaceAll(",", "")) <= 0) {
      Get.back(result: false);
    }
    Get.back(result: true);
  }

  void _transferAll(VipLevelController controller) {
    if (AppCurrencyUtils.getAppCurrencySymbolIsVND()) {
      controller.textController.text = numberFormat(
          double.parse(BalanceManager.centerBalance.value) / 1000.0);
    } else {
      controller.textController.text =
          (num.tryParse(BalanceManager.centerBalance.value)!.fixed(2))
              .toString();
    }

    controller.inputFocusNode.unfocus();
    controller.textController.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.textController.text.length),
    );
  }
}
