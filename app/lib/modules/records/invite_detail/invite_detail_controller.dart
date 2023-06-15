import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/mixin/mixin_web_signal_handler.dart';
import 'package:ob_com_http/src/gen/api/domain_apis.dart';
import 'package:ob_com_http/src/gen/mod/domain/domain_getFriendInvitationDomainLink_post_resp_model.dart';
import 'package:ob_com_http/src/gen/mod/inviteActivity/invite_inviteConfig_post_resp_model.dart';

import 'package:ob_component/ob_component.dart';
import 'package:permission_handler/permission_handler.dart';

import '../discount_detail/repository/repository.dart';

class InviteDetailController extends GetxController with WebSignalHandler {
  GlobalKey globalKey = GlobalKey();
  RxString inviteLink = "".obs;
  InviteInviteConfigPostRespModel inviteConfig = Get.arguments;
  final repository = Get.find<DiscountDetailRepository>();
  final _isLoading = GetPlatform.isWeb ? false.obs : true.obs;

  set isLoading(bool value) => _isLoading.value = value;

  bool get isLoading => _isLoading.value;

  @override
  void jumpToPage(String page) {
    super.jumpToPage(page);

    if (page == WebUtil.sharingLink) {
      showPoster(); // 好友邀请
    } else if (page == WebUtil.inviteRecord) {
      Get.toNamed(AppRoutes.ACTIVITY_RECORD, arguments: {
        "inviteRewardSendPosition": inviteConfig.inviteRewardSendPosition,
        "betRewardSendPosition": inviteConfig.betRewardSendPosition,
      }); //邀请记录
    }
  }

  String? get _activityStartAt {
    if (inviteConfig.activityStartTime.isEmpty) {
      return '';
    }
    final str =
        inviteConfig.activityStartTime.split(" ").first.replaceAll("-", ".");
    if (str.isNotNullOrEmpty) return str;
    return '';
  }

  String? get _activityEndAt {
    if (inviteConfig.activityEndTime.isEmpty) {
      return '';
    }
    final str =
        inviteConfig.activityEndTime.split(' ').first.replaceAll('-', '.');
    if (str.isNotNullOrEmpty) return str;
    return '';
  }

  get _statusExpiredTimeText {
    var nowTime = DateTime.now();
    DateTime dateTimeStart = DateTime.parse(inviteConfig.activityStartTime);
    DateTime dateTimeEnd = DateTime.parse(inviteConfig.activityEndTime);
    if (nowTime.isAfter(dateTimeStart) && nowTime.isBefore(dateTimeEnd)) {
      return '$_activityStartAt-$_activityEndAt';
    }
    return 'invite_activity_record_state_7'.tr;
  }

  void showPoster() {
    Get.generalDialog(
      barrierColor: Colors.black.withOpacity(0.8),
      barrierDismissible: false,
      transitionDuration: Duration(milliseconds: 250),
      barrierLabel: 'Poster',
      pageBuilder: (context, _, __) {
        return DefaultTextStyle(
          style: const TextStyle(decoration: TextDecoration.none),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RepaintBoundary(
                    key: globalKey,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 50.w),
                      clipBehavior: Clip.hardEdge,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                        color: Color(0xff151E25),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AspectRatio(
                            aspectRatio: 275 / 308,
                            child: ObImage.network(
                              inviteConfig.sharePicture,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.w,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        inviteConfig.title,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'discount_activity_time'.tr + _statusExpiredTimeText,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white60,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Obx(() {
                                  if (inviteLink.isNotEmpty)
                                    return Container(
                                      color: Colors.white,
                                      padding: EdgeInsets.all(4.0),
                                      width: 65,
                                      height: 65,
                                      child: BarcodeWidget(
                                          barcode: Barcode.qrCode(
                                            errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                                          ),
                                          padding: EdgeInsets.all(2),
                                          data: inviteLink.value,
                                          width: 60,
                                          height: 60,
                                          backgroundColor:Colors.white,
                                          color: Colors.black,
                                        ));
                                  else
                                    return SizedBox();
                                })
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 39.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: copyLink,
                        child: Column(
                          children: [
                            ObImage.asset(
                              Assets.images.course.comCopy.path,
                              width: 48.w,
                            ),
                            SizedBox(height: 8.w),
                            Text(
                              'discount_copy_link'.tr,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.white60),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: downloadPoster,
                        child: Column(
                          children: [
                            ObImage.asset(
                              Assets.images.course.comDown.path,
                              width: 48.w,
                            ),
                            SizedBox(height: 8.w),
                            Text(
                              'download_image'.tr,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.white60),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8.w),
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0XFF393D3E),
                        borderRadius: BorderRadius.circular(20.w),
                      ),
                      child: OBasePrimaryButton(
                        child: Text(
                          'search_cancel'.tr,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        image: DecorationImage(
                          image: AssetImage(Assets.images.btnbg3.path,
                              package: BaseX.pkg),
                          fit: BoxFit.fill,
                        ),
                        block: true,
                        size: ButtonSize.large,
                        onPressed: () => Get.back(),
                      ),
                    ),
                  ),
                  Container(
                    height: 18.w,
                  )
                ],
              )),
        );
      },
    );
  }

  void downloadPoster() async {
    if (inviteLink.isEmpty) {
      showToast("download_failed_due_to_no_address".tr);
      return;
    }
    if (!GetPlatform.isWeb) {
      bool isGranted = await PermissionUtils.isCheckPermission(
        list: GetPlatform.isAndroid
            ? [Permission.storage]
            : [Permission.photos, Permission.photosAddOnly],
      );
      if (!isGranted) {
        showToast('please_turn_on_storage_permission'.tr);
        Future.delayed(Duration(milliseconds: 600), () {
          openAppSettings(); // 没有权限打开设置页面
        });
        return;
      }
    }

    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    final result = await ImageGallerySaver.saveImage(pngBytes);
    if (result is bool && result) {
      showToast('saved_successfully'.tr);
    } else {
      if (result is Map) {
        bool isSuccess = result['isSuccess'];
        if (isSuccess is bool && isSuccess) {
          showToast('saved_successfully'.tr);
        } else {
          showToast('save_failed'.tr);
        }
      } else {
        showToast('save_failed'.tr);
      }
    }
  }

  void copyLink() async {
    if (inviteLink.isEmpty) {
      showToast("copy_failed_due_to_no_address".tr);
      return;
    }
    if (GetPlatform.isWeb) {
      WebUtil.copyText2Clipboard(inviteLink.value);
    } else {
      await Clipboard.setData(ClipboardData(text: inviteLink.value));
    }
    showToast("access_record_copy_successfully".tr);
  }

  void initSharingLink() {
    runCatch(() async {
      inviteLink.value = await repository.getActivitySharingDomainLink();
    }, onError: (_) async {
      inviteLink.value = "";
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    initSharingLink();
  }
}
