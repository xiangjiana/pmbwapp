import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_component/ob_component.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/repository/ui_wallet_item.dart';
import 'package:ob_com_base/ob_com_base.dart';

import '../../../../widget/enter_game_button.dart';

class WalletController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    BalanceManager.syncAll();
  }

  showBottomSheet(UiWalletItem walletItem) {
    final bottomSheetSelected = false.obs;
    Get.bottomSheet<UiWalletItem>(
      Container(
        height: 180.w + MediaQuery.of(Get.context!).padding.bottom,
        color: Color(0xFF11171C),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                bottomSheetSelected.value = false;
                EnterGameButton.joinGame(
                  walletItem.status != 1,
                  walletItem.id,
                  walletItem.venueType,
                  null,
                  walletItem.name,
                );
              },
              child: Obx(
                () => Text(
                  "go_to".tr + walletItem.venueName,
                  style: TextStyle(
                    color: bottomSheetSelected.value
                        ? Colors.white.withOpacity(0.6)
                        : Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 14.w,
            ),
            Container(
              height: 1.w,
              margin: EdgeInsets.symmetric(horizontal: 48.w),
              color: const Color(0xffD9D9D9),
            ),
            SizedBox(
              height: 14.w,
            ),
            GestureDetector(
              onTap: () {
                if (walletItem.status == 2) {
                  showToast("my_wallet_the_venue_is_under_maintenance".tr);
                  Get.back();
                  return;
                }
                bottomSheetSelected.value = true;

                Get.toNamed(AppRoutes.TRANSFER, parameters: {
                  'transferInId': walletItem.id,
                  'transferOutId': '0',
                });
              },
              child: Obx(
                () => Text(
                  "ledger_record_transfer".tr,
                  style: TextStyle(
                    color: bottomSheetSelected.value
                        ? Colors.white
                        : Colors.white.withOpacity(0.6),
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.w))),
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
    );
  }
}
