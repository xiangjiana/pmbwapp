import 'package:cool_ui/cool_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide TabBarView;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/component/ob_recycle_button.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/bank_card_withdraw_controller.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/component/refresh_lottie.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/cryptocurrency_withdraw_controller.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/withdraw_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

import 'component/bank_card_withdraw_tab.dart';
import 'component/cryptocurrency_withdraw_tab.dart';

class WithdrawPage extends StatefulWidget {
  const WithdrawPage({Key? key}) : super(key: key);

  @override
  _WithdrawPageState createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  final tabs1 = [
    Tab(child: Text('withdraw_bank_tab'.tr)),
  ];

  final tabs2 = [
    Tab(child: Container(child: Text('withdraw_bank_tab'.tr),width: 100.w,alignment: Alignment.center)),
    Tab(child: Container(child: Text('withdraw_USDT_tab'.tr),width: 100.w,alignment: Alignment.center)),
  ];

  final tabsView1 = [
    BankCardWithdrawTab(),
  ];

  final tabsView2 = [
    BankCardWithdrawTab(),
    CryptoCurrencyWithdrawTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawController>(
      global: false,
      init: Get.find<WithdrawController>(),
      dispose: (_) {
        Get.delete<BankCardWithdrawController>();
        Get.delete<CryptoCurrencyWithdrawController>();
      },
      builder: (controller) {
        return KeyboardMediaQuery(
            child: ObTheme(
          child: DefaultTabController(
            initialIndex: 0,
            length: !AppMerchantUtils.loadCurMerchantBy(OBModules.vUSDT)
                ? tabs1.length
                : tabs2.length,
            child: Scaffold(
              resizeToAvoidBottomInset: kIsWeb ? false : true,
              appBar: AppBar(
                title: ObNavigationBarTitle('home_icon_withdraw'.tr),
                leading: ObBackButton(
                  onPressed: () => controller.getBack(),
                ),
                // actions: [_buildAppBarAction()],
                bottom: _buildObTabBar(controller),
              ),
              body: _buildTabBarView(controller),
            ),
          ),
        ));
      },
    );
  }

  PreferredSize _buildObTabBar(WithdrawController controller) {
    return PreferredSize(
      preferredSize: Size.fromHeight(44.w),
      child: Row(
        children: [
          const Spacer(),
          SizedBox(
            width: 250.w,
            child: ObTheme(
              tabFixedSizedIndicator:
                  TabFixedSizedIndicator(Size(24.w, 3.w), ColorName.colorMain1),
              child: ObTabBar(
                controller: controller.tabController,
                isScrollable: (Get.locale?.languageCode != "zh" &&
                        Get.locale?.languageCode != "en")
                    ? true
                    : false,
                indicatorSize: LocaleUtils.isLocale
                    ? TabBarIndicatorSize.label
                    : TabBarIndicatorSize.tab,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: const TextStyle(
                  color: ColorName.colorTextWhite60,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                tabs: !AppMerchantUtils.loadCurMerchantBy(OBModules.vUSDT)
                    ? tabs1
                    : tabs2,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  GestureDetector _buildAppBarAction() {
    return GestureDetector(
      onTap: () {
        PublicResources.jumpToNavigateHelp(PublicResources.withdrawalKey);
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: Text(
            'withdraw_tutorial'.tr,
            style: const TextStyle(
              color: ColorName.colorTextWhite60,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabBarView(WithdrawController controller) {
    return TabBarView(
      controller: controller.tabController,
      children: [
        if (AppMerchantUtils.loadCurMerchantBy(OBModules.vUSDT))
          for (int i = 0; i < tabsView2.length; i++)
            _buildTabViewItem(controller, i, tabsView2[i])
        else
          for (int i = 0; i < tabsView1.length; i++)
            _buildTabViewItem(controller, i, tabsView1[i]),
      ],
    );
  }

  Widget _buildTabViewItem(
    WithdrawController controller,
    int index,
    Widget tabWidget,
  ) {
    return SmartRefresher(
      key: ValueKey(index),
      scrollController: controller.scrollControllers[index],
      controller: controller.refreshControllers[index],
      onRefresh: controller.onRefresh,
      enablePullDown: true,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildRecycleTip(controller),
            SizedBox(height: 12.w),
            if (Store.clientId != Store.clientIdDJ)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 16.w,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: _buildBalanceRow(controller),
              ),
            tabWidget,
          ],
        ),
      ),
    );
  }

  Stack _buildBalanceRow(WithdrawController controller) {
    return Stack(children: [
      Center(
        child: Obx(
          () => Visibility(
            visible: BalanceManager.walletItems.isNotEmpty &&
                !controller.isTryPlay &&
                !BalanceManager.isAllWalletDisabled,
            child: Container(
              margin: EdgeInsets.only(top: 10.w),
              child: ObRecycleButton(
                type: 'withdraw',
                walletItems: BalanceManager.walletItems,
                onPressed: controller.recyclerBalance,
              ),
            ),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'mine_center_wallet'.tr,
                    style: TextStyle(
                      fontSize: 12.w,
                      color: Get.theme.colorScheme.primary.withOpacity(0.6),
                    ),
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
              SizedBox(height: 8.w),
              Obx(
                () => Text(
                  BalanceManager.formatCenterBalance,
                  style: TextStyle(
                    fontSize: 14.w,
                    color: Get.theme.colorScheme.primary,
                    fontFamily: "Gotham-Medium",
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'wallets_balance_total'.tr,
                style: TextStyle(
                  fontSize: 12.w,
                  color: Get.theme.colorScheme.primary.withOpacity(0.6),
                ),
              ),
              SizedBox(height: 8.w),
              Obx(
                () => Text(
                  BalanceManager.formatVenueBalance.isEmpty
                      ? "-"
                      : '${BalanceManager.formatVenueBalance}',
                  style: TextStyle(
                    fontSize: 14.w,
                    color: Get.theme.colorScheme.primary,
                    fontFamily: "Gotham-Medium",
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    ]);
  }

  Widget _buildRecycleTip(WithdrawController controller) {
    return Visibility(
      visible: Store.clientId != Store.clientIdDJ &&
          controller.isShowRecycleTip &&
          Store.recycleTipSwitch,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
        color: const Color(0XFFE1A100).withOpacity(0.06),
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize: 12.w,
            fontWeight: FontWeight.w400,
            color: Get.theme.selectedRowColor,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: controller.hideRecycleTip,
                child: pkObImage(
                  Assets.images.icon.comDelete.path,
                  width: 16.w,
                  height: 16.w,
                ),
              ),
              const SizedBox(width: 12.2),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('wallet_can_not_recycle'.tr),
                ),
              ),
              GestureDetector(
                onTap: controller.hideRecycleTip,
                child: Text('never_remind'.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
