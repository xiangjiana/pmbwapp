import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:ob_package/modules/home/components/walltet/wallet_controller.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/repository/ui_wallet_item.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
      global: false,
      init: WalletController(),
      builder: (WalletController controller) {
        return ObTheme(
          child: Scaffold(
            backgroundColor: const Color(0xFF1C1E22),
            appBar: AppBar(
              backgroundColor: Color(0xFF1C1E22),
              title: ObNavigationBarTitle('balance_venue_tit'.tr),
              leading: ObBackButton(),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Divider(
                      height: 8.w,
                      thickness: 8.w,
                      color: const Color(0xff0E1519),
                    ),
                    SizedBox(
                      height: 16.w,
                    ),
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        UiWalletItem walletItem =
                            BalanceManager.walletItems[index];
                        return GestureDetector(
                          onTap: () {
                            if (walletItem.status != 2) {
                              controller.showBottomSheet(walletItem);
                            }
                          },
                          child: Opacity(
                            opacity: walletItem.status == 2 ? 0.6 : 1,
                            child: Container(
                              margin: EdgeInsets.only(
                                  bottom: 8.w, left: 16.w, right: 16.w),
                              height: 65.w,
                              color: Color(0xFF24262B),
                              alignment: Alignment.center,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  CachedNetworkImage(
                                    imageUrl: walletItem.venueWalletIconUrl,
                                    //"assets/images/venue/wallet_${merchant.id}.webp",
                                    width: 28.w,
                                  ),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        walletItem.name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                      if (walletItem.vipActivityGoing)
                                        SizedBox(
                                            width:200,
                                            child: Row(
                                              children: [
                                                pkObImage(
                                                  Assets
                                                      .images.icon.walletHintR.path,
                                                  width: 12.w,
                                                ),
                                                SizedBox(
                                                  width: 4.w,
                                                ),
                                                Expanded(child: Text(
                                                  'transfer_in_activities_cannot_be_transferred_out'
                                                      .tr,
                                                  style: TextStyle(
                                                    color: Color(0xFFFF5454),
                                                    fontSize: 10,
                                                  ),
                                                )),
                                              ],
                                            )),

                                      if (walletItem.status == 2)
                                        Row(
                                          children: [
                                            pkObImage(
                                              Assets
                                                  .images.icon.walletHintR.path,
                                              width: 12.w,
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            Text(
                                              'my_wallet_the_venue_is_under_maintenance'
                                                  .tr,
                                              style: TextStyle(
                                                color: Color(0xFFFF5454),
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                    walletItem.balance.isEmpty
                                        ? "-"
                                        : walletItem.status == 2
                                            ? "--"
                                            : "symbol".tr +
                                                "${AppCurrencyUtils.dealBalance(walletItem.balance)}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.w,
                                      fontFamily: FontFamily.gothamMedium,
                                      package: BaseX.pkg2,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                  SizedBox(
                                    width: 25.w,
                                  ),
                                  pkObImage(
                                    Assets.images.icon.walletRight.path,
                                    width: 28.w,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox();
                      },
                      itemCount: BalanceManager.walletItems.length,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
