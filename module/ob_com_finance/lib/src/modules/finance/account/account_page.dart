import 'package:flutter/material.dart' hide TabBarView;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ob_com_finance/src/modules/finance/account/account_controller.dart';
import 'package:ob_com_finance/src/modules/finance/account/component/bank_card_tab.dart';
import 'package:ob_com_finance/src/modules/finance/account/component/usdt_tab.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class AccountPage extends GetView<AccountController> {
  final tabs = [
    const BankCardTab(),
    const USDTTab(),
  ];

  final tabs1 = [
    const BankCardTab(),
  ];

  AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: DefaultTabController(
        length: !AppMerchantUtils.loadCurMerchantBy(OBModules.vUSDT)
            ? tabs1.length
            : tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: ObNavigationBarTitle('account_management'.tr),
            leading: ObBackButton(),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(44.w),
              child: ObTheme(
                tabFixedSizedIndicator: TabFixedSizedIndicator(
                    Size(24.w, 3.w), ColorName.colorMain1),
                child: ObTabBar(
                  isScrollable: Get.locale?.languageCode == "en" ? true : false,
                  indicatorPadding: EdgeInsets.only(bottom: 4.w),
                  tabs: [
                    Tab(
                      child: Text('bank_card_management_tab'.tr),
                    ),
                    if (AppMerchantUtils.loadCurMerchantBy(OBModules.vUSDT))
                      Tab(
                        child: Text('usdt_management_tab'.tr),
                      ),
                  ],
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 8.w,
                child: const ColoredBox(
                  color: Color(0xff0E1519),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: AppMerchantUtils.loadCurMerchantBy(OBModules.vUSDT)
                      ? tabs
                      : tabs1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
