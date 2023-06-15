import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/component/ob_recycle_button.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class Wallet extends StatelessWidget {
  final bool isTryPlay;
  final bool showDeposit;
  final bool showWithdraw;
  final String amount;
  final String walletAmount;
  final String venueAmount;
  final Function onPress;
  final double walletHeight;

  const Wallet({
    Key? key,
    required this.isTryPlay,
    required this.showDeposit,
    required this.showWithdraw,
    required this.amount,
    required this.walletAmount,
    required this.venueAmount,
    required this.walletHeight,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: walletHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image:
              AssetImage(Assets.images.bg.myAccount.path, package: BaseX.pkg),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top + kToolbarHeight + 32.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'my_wallet_total_wallet_balance'.tr,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 16.w),
              Text(
                amount.isEmpty ? "-" : amount,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.gothamMedium,
                  package: BaseX.pkg2,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              if (showDeposit)
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    if (Store.clientId == Store.clientIdFYB) {
                      PublicResources.jumpToMemberServicePage();
                    } else {
                      GoUtils.goDeposit();
                    }
                  },
                  child: _buildButton('access_record_deposit'.tr),
                ),
              SizedBox(width: 8.w),
              if (showDeposit)
                Store.clientId == Store.clientIdFYB
                    ? GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          PublicResources.jumpToAgentServicePage();
                        },
                        child: _buildButton('jie_suan'.tr),
                      )
                    : GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => Get.toNamed(AppRoutes.WITHDRAW),
                        child: _buildButton('access_record_withdraw_money'.tr),
                      ),
              SizedBox(width: 16.w),
            ],
          ),
          const Spacer(),
          Container(
            height: 65.w,
            color: Colors.white.withOpacity(0.1),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 18.w),
                    child: Obx(
                      () => Visibility(
                        visible: BalanceManager.walletItems.isNotEmpty &&
                            !isTryPlay &&
                            !BalanceManager.isAllWalletDisabled,
                        child: ObRecycleButton(
                          type: 'wallet',
                          maxWidth: 85.w,
                          height: 25.w,
                          walletItems: BalanceManager.walletItems,
                          onPressed: onPress,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.w),
                Row(
                  children: [
                    SizedBox(width: 16.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'mine_center_wallet'.tr,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                        SizedBox(height: 8.w),
                        Text(
                          walletAmount.isEmpty ? "-" : walletAmount,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: FontFamily.gothamMedium,
                            package: BaseX.pkg2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'wallets_balance_total'.tr,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                        SizedBox(height: 8.w),
                        Text(
                          venueAmount.isEmpty ? "-" :venueAmount ,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: FontFamily.gothamMedium,
                            package: BaseX.pkg2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 16.w),
                  ],
                ),
                Row(
                  children: [
                    const Spacer(),
                    Container(
                      width: 8.w,
                      decoration: BoxDecoration(
                        border: Border(
                          // 四个值 top right bottom left
                          bottom: BorderSide(
                            color: const Color(0xFF151E25),
                            width: 4.w,
                            style: BorderStyle.solid,
                          ),
                          right: const BorderSide(
                              color: Colors.transparent,
                              width: 4,
                              style: BorderStyle.solid),
                          left: const BorderSide(
                              color: Colors.transparent,
                              width: 4,
                              style: BorderStyle.solid),
                        ),
                      ),
                    ),
                    const SizedBox(width: 49.34)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildButton(String text) {
    double? width;
    if (!LocaleUtils.isLocale) {
      width = 52.w;
    }
    return Container(
      height: 52.w,
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Container(
        width: width,
        alignment: Alignment.center,
        height: 28.w,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(14.w),
        ),
        child: ObText(
          text,
          style: TextStyle(
            fontSize: LocaleUtils.isLocale ? 12 : 14,
            color: ColorName.colorMain,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
