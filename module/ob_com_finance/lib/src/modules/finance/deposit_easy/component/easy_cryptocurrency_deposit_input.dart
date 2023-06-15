import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/add_virtual_account/component/tag.dart';
import 'package:ob_com_finance/src/modules/finance/deposit/component/title_tile.dart';
import 'package:ob_com_finance/src/modules/finance/deposit/repository/ui_pay_type.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme, PrimaryButton;
import '../deposit_easy_controller.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:ui' as ui;

class EasyCryptocurrencyDepositInput extends StatelessWidget {
  final UiPayType payType;
  final DepositEasyController controller;
  final GestureTapCallback? serviceTap;
  final Color? titleColor;

  const EasyCryptocurrencyDepositInput({
    Key? key,
    required this.payType,
    this.serviceTap,
    this.titleColor,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> protocols = [];

    controller.usdtAddressMap.forEach((key, value) {
      protocols.add(GestureDetector(
        onTap: () {
          //
          controller.updateProtocol(key);
        },
        child: Obx(() {
          return Padding(
            padding: EdgeInsets.only(right: protocols.length == 3 ? 0 : 9.w),
            child: Tag(
              fontSize: 14,
              borderRadius: Store.clientId == Store.clientIdDJ ? 4.w : 24.w,
              width: 106.w,
              height: 40.w,
              label: key,
              selected: controller.selectedProtocol == key,
            ),
          );
        }),
      ));
    });

    _buildButton(List<Color> colors, String title, GestureTapCallback onTap) {
      return InkWell(
        onTap: onTap,
        child: Container(
          width: 155.w,
          height: 40.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: ObTheming.buttonGradientNew,
            borderRadius: BorderRadius.circular(2),
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Column(
            children: [
              TitleTile(
                title: 'add_virtual_account_select_transaction_agreement'.tr,
                suffix: 'know_v_currency'.tr,
                titleColor: titleColor,
                onSuffixClickListener: () {
                  Get.toNamed(AppRoutes.CRYPTOCURRENCY_DEPOSIT_WIKI);
                },
              ),
              Row(
                mainAxisAlignment: protocols.length == 3
                    ? MainAxisAlignment.spaceAround
                    : MainAxisAlignment.start,
                children: protocols,
              ),
              SizedBox(
                height: 17.w,
              ),
              TitleTile(
                title: 'recharge_address'.tr,
                titleColor: titleColor,
              ),
              Container(
                height: 11.w,
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
                height: 393.w,
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 34.w),
                        padding: EdgeInsets.all(25.w),
                        width: 240.w,
                        height: 240.w,
                        child: Obx(() {
                          return RepaintBoundary(
                              key: controller.state.globalKey,
                              child: BarcodeWidget(
                                barcode: Barcode.qrCode(
                                  errorCorrectLevel:
                                      BarcodeQRCorrectionLevel.high,
                                ),
                                padding: EdgeInsets.all(2),
                                data:
                                    "${controller.usdtAddressMap[controller.selectedProtocol]}",
                                width: 100,
                                height: 100,
                                backgroundColor: Colors.white,
                                color: Colors.black,
                              ));
                        }),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              Assets.images.icon.rechargeAddresschildBg.path,
                              package: BaseX.pkg,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 16.w,
                    ),
                    Obx(() {
                      return Container(
                        margin: EdgeInsets.only(left: 15.w, right: 15.w),
                        child: Text(
                          "${controller.usdtAddressMap[controller.selectedProtocol]}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      );
                    }),
                    SizedBox(
                      height: 19.w,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildButton([
                          Color(0xffFF9047),
                          Color(0xffFF5722),
                        ], "copy_address".tr, () {
                          if (kIsWeb) {
                            WebUtil.copyText2Clipboard(
                                "${controller.usdtAddressMap[controller.selectedProtocol]}");
                          } else {
                            Clipboard.setData(ClipboardData(
                                text:
                                    "${controller.usdtAddressMap[controller.selectedProtocol]}"));
                          }
                          showToast("address_copy_successfully".tr);
                        }),
                        SizedBox(
                          width: 17.81.w,
                        ),
                        _buildButton([
                          Color(0xffFF9047),
                          Color(0xffFF5722),
                        ], "save_photo".tr, () {
                          getPerm();
                        }),
                      ],
                    ),
                  ],
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      Assets.images.icon.rechargeAddressBg.path,
                      package: BaseX.pkg,
                    ),
                  ),
                )),
            // Positioned(top: 74.w, right: 0, child: _buildCustomerService())
          ],
        ),
        ObImage.network(
          payType.picture,
          width: double.infinity,
        ),
        Container(
          margin:
              EdgeInsets.only(top: 16.w, left: 16.w, right: 16.w, bottom: 17.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.w),
                child: Text(
                  "vip_level_active_alert_title".tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),

              Text.rich(TextSpan(
                  text: 'save_money_tip1'.tr,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                        text: 'save_money_tip2'.tr,
                        style: TextStyle(
                          color: Color(0xffFF5722),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        )),
                    TextSpan(
                        text: 'save_money_tip3'.tr,
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        )),
                    TextSpan(
                        text: 'save_money_tip4'.tr,
                        style: TextStyle(
                          color: Color(0xffFF5722),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        )),
                    TextSpan(
                        text:
                            '${'save_money_tip5'.tr}\n${'save_money_tip6'.tr}',
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                              text: '${'save_money_tip7'.tr}\n',
                              style: TextStyle(
                                color: Color(0xffFF5722),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              )),
                          TextSpan(
                            text:
                                '${'save_money_tip8'.tr}\n${'save_money_tip9'.tr}',
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ]),
                  ])),

              // Container(
              //   width: double.infinity,
              //   height: 20.h,
              //   color: Colors.red,
              // ),
              //
              //
              //
              //
              // Text.rich(TextSpan(
              //     text: 'save_money_tip6'.tr,
              //     style: TextStyle(
              //       color: Colors.white60,
              //       fontSize: 12,
              //       fontWeight: FontWeight.w400,
              //     ),
              //     children: [
              //       TextSpan(
              //           text:  '${'save_money_tip7'.tr}${GetPlatform.isWeb?'\n':''}',
              //           style: TextStyle(
              //             color: Color(0xffFF5722),
              //             fontSize: 12,
              //             fontWeight: FontWeight.w400,
              //           )),
              //     ])),
              // Text.rich(TextSpan(
              //   text:  '${'save_money_tip8'.tr}${GetPlatform.isWeb?'\n':''}',
              //   style: TextStyle(
              //     color: Colors.white60,
              //     fontSize: 12,
              //     fontWeight: FontWeight.w400,
              //   ),
              // )),
              // Text.rich(TextSpan(
              //   text:  '${'save_money_tip9'.tr}${GetPlatform.isWeb?'\n':''}',
              //   style: TextStyle(
              //     color: Colors.white60,
              //     fontSize: 12,
              //     fontWeight: FontWeight.w400,
              //   ),
              // )),
            ],
          ),
        ),
      ],
    );
  }

  Future getPerm() async {
    //web端不能请求权限会报错，直接调用JS方法创建下载二维码
    if (kIsWeb) {
      createrQRDownload(
          controller.usdtAddressMap[controller.selectedProtocol]!);
      return;
    }
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.photos,
    ].request();

    if (statuses[Permission.storage] == PermissionStatus.granted &&
        (statuses[Permission.photos] == PermissionStatus.granted ||
            statuses[Permission.photos] == PermissionStatus.limited)) {
      capturePng(); // 已有权限开始保存
    } else {
      openAppSettings(); // 没有权限打开设置页面
    }
  }

  Future<String> capturePng() async {
    try {
      RenderRepaintBoundary boundary =
          controller.state.globalKey.currentContext!.findRenderObject()!
              as RenderRepaintBoundary;
      double dpr = ui.window.devicePixelRatio;
      ui.Image image = await boundary.toImage(pixelRatio: dpr);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      final result =
          await ImageGallerySaver.saveImage(byteData!.buffer.asUint8List());
      print(result); // result是图片地址
      showToast('image_saved_successfully'.tr);
    } catch (e) {
      print(e);
    }
    return 'null';
  }
}
