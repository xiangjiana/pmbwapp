import 'package:flutter/material.dart' hide PageController;
import 'package:ob_com_finance/src/modules/finance/withdraw/component/refresh_lottie.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:get/get.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/component/grid_wallet_tile.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/component/wallet.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/my_wallet_controller.dart';
import 'package:ob_com_base/ob_com_base.dart';

import 'balance_manager.dart';

class MyWalletPage extends GetView<MyWalletController> {
  Widget build(BuildContext context) {
    // image myAccount 1125x822
    double _height = 1.sw * 822.0 / 1125.0;
    return ObTheme(
      child: Scaffold(
        body: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: [
            SliverAppBar(
              leading: ObBackButton(),
              title: Text(
                'mine_my_wallet'.tr,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              centerTitle: true,
              collapsedHeight: _height - MediaQuery.of(context).padding.bottom,
              expandedHeight: _height - MediaQuery.of(context).padding.bottom,
              flexibleSpace: Obx(
                () => Wallet(
                  isTryPlay: controller.isTryPlay,
                  amount: BalanceManager.formatTotalBalance,
                  walletAmount: BalanceManager.formatCenterBalance,
                  venueAmount: BalanceManager.formatVenueBalance,
                  walletHeight: _height,
                  onPress: BalanceManager.recyclerBalance,
                  showWithdraw: controller.showWithdraw.value == "1",
                  showDeposit: controller.showDeposit.value == "1",
                ),
              ),
              actions: [_buildAppBarAction()],
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16.w,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              sliver: _buildWalletGrid(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16.w + MediaQuery.of(context).padding.bottom,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Obx _buildWalletGrid() {
    return Obx(
      () => SliverGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12.w,
        crossAxisSpacing: 12.w,
        childAspectRatio: 165 / 98,
        children: [
          for (int i = 0; i < BalanceManager.walletItems.length; i++)
            if (!BalanceManager.walletItems[i].disabled)
              GridWalletTile(
                BalanceManager.walletItems[i],
                onTransferInPress: () {
                  controller.navigateTransfer(
                    transferInId: BalanceManager.walletItems[i].id,
                    transferOutId: '0',
                  );
                },
                onTransferOutPress: () {
                  controller.navigateTransfer(
                    transferInId: '0',
                    transferOutId: BalanceManager.walletItems[i].id,
                  );
                },
                onItemFlowDetailClick: (v) {
                  controller.showMerchantDepositFlow(v.id);
                },
              ),
        ],
      ),
    );
  }

  Row _buildAppBarAction() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 49.w,
          width: 51.w,
          color: Colors.transparent,
          alignment: Alignment.center,
          child: RefreshLottie(
            width: 24.w,
            height: 24.h,
          ),
        ),
      ],
    );
  }
}
