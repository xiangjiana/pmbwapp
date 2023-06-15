import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart' hide Navigator;
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/repository/my_wallet_repository.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/repository/ui_wallet_item.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/component/refresh_lottie.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:sprintf/sprintf.dart';

class SelectWallet extends StatelessWidget {
  final String? selectId;
  final bool isTransferOut; //是否是从这些钱包转出
  List checkMark = <bool>[];
  List detailsModel = <StreamDetails>[];

  SelectWallet({Key? key, this.selectId, required this.isTransferOut})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < BalanceManager.walletItems.length; i++) {
      checkMark.add(false);
      detailsModel.add(StreamDetails(
        activityName: '--',
        completeBillAmount: 0.0,
        billAmount: 0.0,
        percentage: 0.0,
        lowActivityAmount: 0.0,
      ));
    }
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 44.w,
            // padding: EdgeInsets.symmetric(horizontal: 16.w),
            color: Colors.white.withOpacity(0.04),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    width: 56.w,
                    alignment: Alignment.center,
                    child: pkObImage(
                      Assets.images.icon.comCloseWhite.path,
                      width: 24.w,
                      height: 24.w,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'transfer_select_wallet'.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  width: 56.w,
                  alignment: Alignment.center,
                  child: RefreshLottie(
                    width: 24.w,
                    height: 24.h,
                    padding:
                        EdgeInsets.symmetric(vertical: 10.w, horizontal: 16.w),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Obx(
                () => Column(
                  children: [
                    for (int i = 0; i < BalanceManager.walletItems.length; i++)
                      if (BalanceManager.walletItems[i] != null)
                        if (!BalanceManager.walletItems[i].disabled)
                          SelectWalletCell(
                            onTap: () {
                              Navigator.of(context)
                                  .pop(BalanceManager.walletItems[i]);
                            },
                            account: BalanceManager.walletItems[i],
                            selected:
                                selectId == BalanceManager.walletItems[i].id,
                            isTransferOut: isTransferOut,
                            index: i,
                            checkMark: checkMark,
                            detailsModel: detailsModel,
                          ),
                    SizedBox(height: 10.w),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class SelectWalletCell extends StatelessWidget {
  final Function onTap;
  final UiWalletItem account;
  final bool selected;
  final bool isTransferOut; //是否是从这些钱包转出
  List checkMark;
  RxBool isExpanded = false.obs;
  int index = 0;
  List detailsModel;
  MyWalletRepository myWalletRepository = MyWalletRepository();
  Rx<StreamDetails> res = StreamDetails(
    activityName: '--',
    completeBillAmount: 0.0,
    billAmount: 0.0,
    percentage: 0.0,
    lowActivityAmount: 0.0,
  ).obs;

  SelectWalletCell({
    Key? key,
    required this.onTap,
    this.selected = false,
    required this.account,
    required this.isTransferOut,
    required this.index,
    required this.checkMark,
    required this.detailsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (checkMark.isNotEmpty) {
      if (index < checkMark.length) {
        isExpanded.value = checkMark[index];
      }
      if (index <= detailsModel.length) {
        res.value = detailsModel[index];
      }
    }

    ///改不动了，不知道为啥怎么改都报错
    ///泰文布局溢出，https://jira.bdgatewaynet.com/browse/BWCS-5238
    var str = 'transfer_in_activities_cannot_be_transferred_out'.tr;
    // if(str.length>30){
    //   str = str.substring(0,30)+ '..';
    // }
    return Container(
      padding: EdgeInsets.only(
        top: 15.w,
        left: 16.w,
        right: 16.w,
      ),
      child: Obx(
        () => Column(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () async {
                if (account.enabled) {
                  if (!account.vipActivityGoing || !isTransferOut) onTap();
                }
                if (account.vipActivityGoing && isTransferOut) {
                  checkMark[index] = !checkMark[index];
                  isExpanded.value = checkMark[index];
                  if (isExpanded.value) {
                    res.value =
                        await myWalletRepository.getFlowDetail(account.id);
                    detailsModel[index] = res.value;
                  }
                }
              },
              child: Row(
                children: [
                  AnimatedOpacity(
                    opacity: (account.maintained || account.vipActivityGoing)
                        ? 0.6
                        : 1.0,
                    duration: const Duration(milliseconds: 200),
                    child: CachedNetworkImage(
                      imageUrl: account.venueWalletIconUrl,
                      //'assets/images/venue/wallet_${account.id}.webp',
                      width: 32.w,
                      height: 32.w,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedOpacity(
                          opacity: (account.maintained ||
                                  (account.vipActivityGoing && isTransferOut))
                              ? 0.6
                              : 1.0,
                          duration: const Duration(milliseconds: 200),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                account.name,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 4.w),
                              Text(
                                account.maintained == true
                                    ? '--'
                                    : AppCurrencyUtils.dealBalance(
                                        account.balance,
                                      ),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (selected)
                          ObImage.asset(
                            Assets.images.icon.comSelect.path,
                            color: Colors.green,
                            width: 20.w,
                            height: 20.w,
                          ),
                        if (account.enabled == true)
                          if (account.vipActivityGoing == true && isTransferOut)
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 24.w),
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    Container(
                                      constraints:
                                          BoxConstraints(maxWidth: 150.w),
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        str,
                                        maxLines: 3,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white.withOpacity(0.6),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Transform.rotate(
                                      angle: isExpanded.value ? math.pi : 0.0,
                                      child: pkObImage(
                                        Assets.images.icon.homeMoreDown.path,
                                        width: 16.w,
                                        height: 16.w,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        if (account.enabled == false)
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              constraints: BoxConstraints(maxWidth: 150.w),
                              padding: EdgeInsets.only(left: 24.w),
                              child: Text(
                                isTransferOut
                                    ? 'transfer_unable_to_transfer_s_during_venue_out'
                                        .tr
                                    : 'transfer_unable_to_transfer_s_during_venue_in'
                                        .tr,
                                maxLines: 3,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 14.w),
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 303.w,
                  height: 75.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.w,
                  ),
                  margin: EdgeInsets.only(bottom: 16.w),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TitleRow(
                        label: 'vip_level_submit_active'.tr,
                        value: res.value.activityName,
                      ),
                      TitleRow(
                        label: 'my_wallet_required_running_water'.tr,
                        value: res.value.billAmount > 0
                            ? AppCurrencyUtils.dealBalance(
                                "${res.value.billAmount}")
                            : "--",
                      ),
                      TitleRow(
                        label: 'withdraw_flow_has_been_completed'.tr,
                        childValue: Row(
                          children: [
                            const Spacer(),
                            Text(
                              AppCurrencyUtils.dealBalance(
                                '${res.value.completeBillAmount}',
                              ),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Text(
                              '${numberFormat((res.value.completeBillAmount / res.value.billAmount) * 100, comma: false)}%',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xffE1A100),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              crossFadeState: isExpanded.value
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200),
            ),
            Transform.translate(
              offset: Offset(16.w, 0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 319.w,
                  height: 1.w,
                  color: Colors.white.withOpacity(0.04),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
