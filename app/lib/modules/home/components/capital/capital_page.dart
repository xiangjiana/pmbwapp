import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/component/ob_recycle_button.dart';
import 'package:ob_component/src/ob_widget/switch/switchImage.dart';
import 'package:ob_package/modules/records/activity_record/component/activity_empty.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ob_com_finance/src/modules/records/ledger_record/repository/ui_transcation.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'capital_controller.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

import 'capital_list_tile.dart';

class CapitalPage extends StatefulWidget {
  const CapitalPage({Key? key}) : super(key: key);

  @override
  State<CapitalPage> createState() => _CapitalPageState();
}

class _CapitalPageState extends State<CapitalPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CapitalController>(
      global: false,
      init: CapitalController(Get.find()),
      builder: (CapitalController controller) {
        return ObTheme(
          child: Scaffold(
            body: SafeArea(
              child: NestedScrollView(
                controller: controller.scrollSmartController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      sliver: Obx(
                        () => SliverAppBar(
                          title: SizedBox.shrink(),
                          leading: SizedBox(),
                          pinned: true,
                          stretch: true,
                          centerTitle: true,
                          expandedHeight: MediaQuery.of(context).padding.top +
                              kToolbarHeight +
                              480.w,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Column(
                              children: [
                                SizedBox(
                                  height: 25.w,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 24.w,
                                    ),
                                    Text(
                                      "balance_all".tr,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          height: 1.1),
                                    ),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    Obx(
                                      () => GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () {
                                          // controller
                                          //     .changeShowEatSalaryStatus();
                                          controller.homePageController
                                              .toggleObscure();
                                        },
                                        child: ObImage.asset(
                                          controller.homePageController
                                                  .obscureAmount
                                              ? Assets.images.icon.loginEye.path
                                              : Assets
                                                  .images.icon.loginEyeOn.path,
                                          fit: BoxFit.fitWidth,
                                          width: 24.w,
                                          height: 24.w,
                                          // color: Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () =>
                                          Get.toNamed(AppRoutes.DEPOSIT_EASY),
                                      child: Container(
                                        width: 72.w,
                                        height: 28.w,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.w),
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              Assets.images.btnbg2.path,
                                              package: BaseX.pkg,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Text(
                                          "ledger_record_deposit".tr,
                                          style: TextStyle(
                                            fontSize: 14.w,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 18.w,
                                    ),
                                  ],
                                ),
                                Obx(
                                  () => Row(
                                    children: [
                                      SizedBox(
                                        width: 24.w,
                                      ),
                                      if (controller
                                          .homePageController.obscureAmount)
                                        Text(
                                          'symbol'.tr,
                                          style: const TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                            height: 1.1,
                                            fontFamily: FontFamily.gothamMedium,
                                            package: BaseX.pkg2,
                                          ),
                                        ),
                                      Text(
                                        controller.homePageController
                                                .obscureAmount
                                            ? BalanceManager.formatTotalBalance
                                            : '*****',
                                        style: const TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontFamily: FontFamily.gothamMedium,
                                          package: BaseX.pkg2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 17.w,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      width: 1.sw - 32.w,
                                      height: 164.w,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            Assets.images.bg.capitalBlue.path,
                                            package: BaseX.pkg,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16.w),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 14.w,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(width: 29.w),
                                              Text(
                                                "balance_center".tr,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const Spacer(),
                                              ObRecycleButton(
                                                type: 'capital',
                                                walletItems:
                                                    BalanceManager.walletItems,
                                                onPressed:
                                                    controller.recyclerBalance,
                                                height: 25.w,
                                                maxWidth: 100.w,
                                              ),
                                              SizedBox(width: 14.w),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12.w,
                                          ),
                                          Obx(
                                            () => Row(
                                              children: [
                                                SizedBox(width: 29.w),
                                                if (controller
                                                    .homePageController
                                                    .obscureAmount)
                                                  Text(
                                                    'symbol'.tr,
                                                    style: const TextStyle(
                                                      fontSize: 22,
                                                      color: Colors.white,
                                                      height: 1.1,
                                                      fontFamily: FontFamily
                                                          .gothamMedium,
                                                      package: BaseX.pkg2,
                                                    ),
                                                  ),
                                                Text(
                                                  controller.homePageController
                                                          .obscureAmount
                                                      ? BalanceManager
                                                          .formatCenterBalance
                                                      : '*****',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontFamily:
                                                        FontFamily.gothamMedium,
                                                    package: BaseX.pkg2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 82.w,
                                      ),
                                      width: 1.sw - 32.w,
                                      height: 164.w,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            Assets.images.bg.capitalGray.path,
                                            package: BaseX.pkg,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.w),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 14.w,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(width: 29.w),
                                              const Spacer(),
                                              GestureDetector(
                                                behavior:
                                                    HitTestBehavior.translucent,
                                                onTap: () => Get.toNamed(
                                                    AppRoutes.WALLET),
                                                child: Container(
                                                  width: 110.w,
                                                  height: 25.w,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: const Color(
                                                          0xffFFFFFF),
                                                    ),
                                                    color:
                                                        const Color(0xFFF2FFEF)
                                                            .withOpacity(0.4),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(20.w),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    "balance_venue_info".tr,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: Get.locale!.languageCode=="en"?9:12,
                                                      wordSpacing: -1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 14.w),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 23.w,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(width: 29.w),
                                              Text(
                                                'balance_venue'.tr,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(width: 29.w),
                                              if (controller.homePageController
                                                  .obscureAmount)
                                                Text(
                                                  'symbol'.tr,
                                                  style: const TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.white,
                                                    height: 1.1,
                                                    fontFamily:
                                                        FontFamily.gothamMedium,
                                                    package: BaseX.pkg2,
                                                  ),
                                                ),
                                              Text(
                                                controller.homePageController
                                                        .obscureAmount
                                                    ? BalanceManager
                                                        .formatVenueBalance
                                                    : '*****',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22,
                                                  fontFamily:
                                                      FontFamily.gothamMedium,
                                                  package: BaseX.pkg2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 13.w,
                                ),
                                Container(
                                  width: 1.sw - 32.w,
                                  height: 40.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.w),
                                    ),
                                    color: Colors.white.withOpacity(0.04),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 13.w,
                                      ),
                                      Expanded(child: GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () =>
                                            controller.showTip(context),
                                        child: Row(
                                          children: [
                                            pkObImage(
                                              Assets
                                                  .images.icon.walletHint.path,
                                              width: 16.w,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Expanded(child: Text(
                                              "transfer_bring_in_the_amount".tr,
                                              style: TextStyle(
                                                fontSize: Get.locale!.languageCode=="en"?10:12,
                                                wordSpacing: -1,
                                                color: Colors.white
                                                    .withOpacity(0.6),
                                              ),
                                            )),
                                          ],
                                        ),
                                      )),

                                      Obx(
                                            () => ObSwitchImage(
                                          value: controller
                                              .authService.isAutoTransferOpen,
                                          onChanged: (bool value) {
                                            controller.toggleAutoTransferSwitch(
                                                context);
                                          },
                                          imageOn: pkObImage(
                                            Assets.images.switchOn.path,
                                          ),
                                          imageOff: pkObImage(
                                            Assets.images.switchOff.path,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 17.w,
                                ),
                                SizedBox(
                                  width: 1.sw - 60.w,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(AppRoutes.DEPOSIT_EASY);
                                        },
                                        child: Container(
                                          width: 64.w,
                                          height: 64.w,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(0xff2D3035),
                                                width: 1.w),
                                            color: const Color(0xFF17181B),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              pkObImage(
                                                Assets
                                                    .images.icon.deposit3x.path,
                                                width: 27.w,
                                              ),
                                              Text(
                                                "ledger_record_deposit".tr,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  letterSpacing: -0.6
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: (1.sw - 60.w - 64.w * 4) / 3,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(AppRoutes.WITHDRAW);
                                        },
                                        child: Container(
                                          width: 64.w,
                                          height: 64.w,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(0xff2D3035),
                                                width: 1.w),
                                            color: const Color(0xFF17181B),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              pkObImage(
                                                Assets.images.icon.withdraw3x
                                                    .path,
                                                width: 27.w,
                                              ),
                                              Text(
                                                "ledger_record_withdraw_money"
                                                    .tr,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  letterSpacing: -0.6
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: (1.sw - 60.w - 64.w * 4) / 3,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(AppRoutes.WALLET);
                                        },
                                        child: Container(
                                          width: 64.w,
                                          height: 64.w,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(0xff2D3035),
                                                width: 1.w),
                                            color: const Color(0xFF17181B),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              pkObImage(
                                                Assets.images.icon.transfer3x
                                                    .path,
                                                width: 27.w,
                                              ),
                                              Text(
                                                "ledger_record_transfer".tr,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  letterSpacing: -0.6
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: (1.sw - 60.w - 64.w * 4) / 3,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(AppRoutes.ACCOUNT);
                                        },
                                        child: Container(
                                          width: 64.w,
                                          height: 64.w,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(0xff2D3035),
                                                width: 1.w),
                                            color: const Color(0xFF17181B),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              pkObImage(
                                                Assets
                                                    .images.icon.account3x.path,
                                                width: 27.w,
                                              ),
                                              Text(
                                                "account".tr,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  letterSpacing: -0.6
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.w,
                                ),
                                Container(
                                  color: const Color(0xff0E1519),
                                  height: 8.w,
                                ),
                                SizedBox(height: 8.w),
                              ],
                            ),
                          ),
                          actions: [],
                          bottom: PreferredSize(
                            preferredSize: Size.fromHeight(0.w),
                            child: Container(
                              color: ColorName.colorBackground,
                              height: 44.w,
                              child: Container(
                                color: ColorName.colorBackground,
                                height: 44.w,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 16.w,
                                    ),
                                    Text(
                                      "ledger_detail_quota_record".tr,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () => Get.toNamed(
                                            AppRoutes.LEDGER_RECORD),
                                        child: Text(
                                          "home_reading_more_lable".tr,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Colors.white.withOpacity(0.6),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 16.w,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ];
                },
                body: Container(
                  margin: EdgeInsets.only(top: 58.w),
                  child: Obx(
                    () => SmartRefresher(
                      enablePullUp: true,
                      enablePullDown: true,
                      scrollController: controller.scrollController,
                      controller: controller.smartRefreshCtrl,
                      onRefresh: controller.onRefresh,
                      onLoading: controller.onLoading,
                      child: (controller.data == null ||
                              controller.data!.record.isEmpty)
                          ? const ActivityEmpty()
                          : ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                var record = controller.data!.record[index];
                                return CapitalListTile(record);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox();
                              },
                              itemCount: controller.data == null
                                  ? 0
                                  : controller.data!.record.length,
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
        return Scaffold(
          backgroundColor: const Color(0xFF1C1E22),
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 25.w,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 24.w,
                    ),
                    Text(
                      "balance_all".tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    ObImage.asset(
                      Assets.images.icon.loginEyeOn.path,
                      fit: BoxFit.fitWidth,
                      width: 16.w,
                      height: 16.w,
                      // color: Color(0xFF000000),
                    ),
                    const Spacer(),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => Get.toNamed(AppRoutes.DEPOSIT),
                      child: Container(
                        width: 72.w,
                        height: 28.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.w),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFF5718CC),
                              Color(0xFF9459FF),
                              //Color(0xFFF1AEAE),
                            ],
                            stops: [
                              0.5,
                              0.5,
                            ],
                          ),
                        ),
                        child: Text(
                          "ledger_record_deposit".tr,
                          style: TextStyle(
                            fontSize: 14.w,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                  ],
                ),
                Obx(
                  () => Row(
                    children: [
                      SizedBox(
                        width: 24.w,
                      ),
                      Text(
                        BalanceManager.formatTotalBalance,
                        // "¥124,098.00",
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 17.w,
                ),
                Stack(
                  children: [
                    Container(
                      width: 1.sw - 32.w,
                      height: 164.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            Assets.images.bg.capitalBlue.path,
                            package: BaseX.pkg,
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.w),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 14.w,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 29.w),
                              Text(
                                "balance_center".tr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              const Spacer(),
                              ObRecycleButton(
                                type: 'capital',
                                walletItems: BalanceManager.walletItems,
                                onPressed: controller.recyclerBalance,
                              ),
                              SizedBox(width: 14.w),
                            ],
                          ),
                          SizedBox(
                            height: 12.w,
                          ),
                          Obx(
                            () => Row(
                              children: [
                                SizedBox(width: 29.w),
                                Text(
                                  BalanceManager.formatCenterBalance,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 82.w,
                      ),
                      width: 1.sw - 32.w,
                      height: 164.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            Assets.images.bg.capitalGray.path,
                            package: BaseX.pkg,
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.w),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 14.w,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 29.w),
                              const Spacer(),
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () => Get.toNamed(AppRoutes.WALLET),
                                child: Container(
                                  width: 100.w,
                                  height: 26.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xffFFFFFF).withOpacity(0.4),
                                    ),
                                    color: const Color(0xFFF2FFEF)
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.w),
                                    ),
                                  ),
                                  child: Text(
                                    "balance_venue_info".tr,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 14.w),
                            ],
                          ),
                          SizedBox(
                            height: 23.w,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 29.w),
                              Text(
                                'balance_venue'.tr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: 29.w),
                              Text(
                                BalanceManager.formatVenueBalance,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 13.w,
                ),
                Container(
                  width: 1.sw - 32.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.w),
                    ),
                    color: Colors.white.withOpacity(0.04),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 13.w,
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => controller.showTip(context),
                        child: Row(
                          children: [
                            pkObImage(
                              Assets.images.icon.walletHint.path,
                              width: 16.w,
                            ),
                            SizedBox(
                              width: 13.w,
                            ),
                            Text(
                              "transfer_bring_in_the_amount".tr,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Obx(
                        () => ObSwitch(
                          value: controller.authService.isAutoTransferOpen,
                          onChanged: (bool value) {
                            controller.toggleAutoTransferSwitch(context);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 17.w,
                ),
                SizedBox(
                  width: 1.sw - 60.w,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.DEPOSIT);
                        },
                        child: Container(
                          width: 64.w,
                          height: 64.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xff2D3035), width: 1.w),
                            color: const Color(0xFF17181B),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              pkObImage(
                                Assets.images.icon.deposit3x.path,
                                width: 20,
                              ),
                              Text(
                                "ledger_record_deposit".tr,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: (1.sw - 60.w - 64.w * 4) / 3,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.WITHDRAW);
                        },
                        child: Container(
                          width: 64.w,
                          height: 64.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xff2D3035), width: 1.w),
                            color: const Color(0xFF17181B),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              pkObImage(
                                Assets.images.icon.withdraw3x.path,
                                width: 20,
                              ),
                              Text(
                                "ledger_record_withdraw_money".tr,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: (1.sw - 60.w - 64.w * 4) / 3,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.TRANSFER);
                        },
                        child: Container(
                          width: 64.w,
                          height: 64.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xff2D3035), width: 1.w),
                            color: const Color(0xFF17181B),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              pkObImage(
                                Assets.images.icon.transfer3x.path,
                                width: 20,
                              ),
                              Text(
                                "ledger_record_transfer".tr,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: (1.sw - 60.w - 64.w * 4) / 3,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.ACCOUNT);
                        },
                        child: Container(
                          width: 64.w,
                          height: 64.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xff2D3035), width: 1.w),
                            color: const Color(0xFF17181B),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              pkObImage(
                                Assets.images.icon.account3x.path,
                                width: 20,
                              ),
                              Text(
                                "account".tr,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.w,
                ),
                Container(
                  height: 8.w,
                  color: const Color(0xFF0E1519),
                ),
                SizedBox(
                  height: 44.w,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                      ),
                      Text(
                        "ledger_detail_quota_record".tr,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () => Get.toNamed(AppRoutes.LEDGER_RECORD),
                          child: Text(
                            "home_reading_more_lable".tr,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          )),
                      SizedBox(
                        width: 16.w,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SmartRefresher(
                    scrollController: controller.scrollController,
                    controller: controller.refreshController,
                    onRefresh: controller.onRefresh,
                    enablePullDown: true,
                    child: SingleChildScrollView(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var record = controller.data!.record[index];
                          return Container(
                            height: 65.w,
                            alignment: Alignment.center,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 16.w,
                                ),
                                Avatar(
                                  radius: 20.w,
                                  backgroundColor:
                                      Colors.white.withOpacity(0.04),
                                  child: pkObImage(
                                    Assets.images.icon.account3x.path,
                                    width: 28.w,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        TRANSACTION_DIC()
                                                .firstWhereOrNull((element) =>
                                                    element.code ==
                                                    '${record.appType}')
                                                ?.title ??
                                            '',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        controller
                                            .data!.record[index].createdAt,
                                        //"2023-03-01 15:25",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white.withOpacity(0.6),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      (record.amount) > 0
                                          ? '+${AppCurrencyUtils.dealBalance(record.amount.fixed(2))}'
                                          : AppCurrencyUtils.dealBalance(
                                              record.amount.fixed(2)),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '${'mine_center_wallet'.tr} ${'symbol'.tr} ${AppCurrencyUtils.dealBalance(record.changeAfter.fixed(2))}',
                                      // "中心钱包 100.00",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white.withOpacity(0.6),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox();
                        },
                        itemCount: controller.data == null
                            ? 0
                            : controller.data!.record.length,
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
}
