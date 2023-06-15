import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:models/models.dart';
import 'package:ob_package/modules/web_iframe/ui_fake.dart'
    if (dart.library.html) 'dart:js' as js;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';
import 'package:ob_package/modules/records/discount_detail/repository/repository.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:sprintf/sprintf.dart';

mixin DiscountDetailsMixin on GetxController {
  ActivityConfig? discount;

  GlobalKey globalKey = GlobalKey();
  RxString sharingLink = "".obs;

  String? get _activityStartAt {
    final str =
        discount?.activityStartTime.split(" ").first.replaceAll("-", ".");
    if (str.isNotNullOrEmpty) return str;
    return '';
  }

  String? get _activityEndAt {
    final str = discount?.activityEndTime.split(' ').first.replaceAll('-', '.');
    if (str.isNotNullOrEmpty) return str;
    return '';
  }

  //activityStatus 活动状态 1-未展示 2-未开始 3-进行中 4-已过期 5-已结束 6-已停用
  get _statusExpiredTimeText {
    if ((discount?.activityStatus ?? 0) < 4 && discount?.cycle == 1) {
      return '$_activityStartAt-$_activityEndAt';
    }
    return (discount?.activityStatus ?? 0) < 4
        ? 'long_term'.tr
        : 'invite_activity_record_state_7'.tr;
  }

  @override
  void onInit() {
    discount = Get.arguments;
    super.onInit();
  }

  void initSharingLink() {
    runCatch(() async {
      final repository = Get.find<DiscountDetailRepository>();
      sharingLink.value = await repository.getActivitySharingDomainLink();
    }, onError: (_) async {
      sharingLink.value = "";
    });
  }

  void showPoster() {
    initSharingLink();
    if (kIsWeb) {
      js.context.callMethod('setPointerEvents', ['auto']);
    }
    Get.generalDialog(
      barrierColor: Colors.black.withOpacity(0.8),
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 250),
      barrierLabel: 'Poster',
      pageBuilder: (context, _, __) {
        return PointerInterceptor(
          child: DefaultTextStyle(
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
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.w),
                          ),
                          color: const Color(0xff151E25),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AspectRatio(
                              aspectRatio: 275 / 308,
                              child: ClipRRect(
                                clipBehavior: Clip.hardEdge,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8.w),
                                  topRight: Radius.circular(8.w),
                                ),
                                child: ObImage.network(
                                  discount?.sharePicture ?? '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 12.w,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          discount?.title ?? '',
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          'discount_activity_time'.tr +
                                              _statusExpiredTimeText,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.white60,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Obx(() {
                                    if (sharingLink.isNotEmpty) {
                                      return Container(
                                          color: Colors.white,
                                          padding: const EdgeInsets.all(2),
                                          width: 65,
                                          height: 65,
                                          child: BarcodeWidget(
                                            barcode: Barcode.qrCode(
                                              errorCorrectLevel:
                                                  BarcodeQRCorrectionLevel.high,
                                            ),
                                            padding: const EdgeInsets.all(2),
                                            data: sharingLink.value,
                                            width: 60,
                                            height: 60,
                                            backgroundColor: Colors.white,
                                            color: Colors.black,
                                          ));
                                    } else {
                                      return const SizedBox();
                                    }
                                  })
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: kIsWeb ? 0 : 39.w),
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
                                  fontSize: 12,
                                  color: Colors.white60,
                                ),
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
                                'discount_download_image'.tr,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white60,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: kIsWeb ? 0 : 8.w),
                    Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0XFF393D3E),
                          borderRadius: BorderRadius.circular(20.w),
                        ),
                        child: OBasePrimaryButton(
                          block: true,
                          image: DecorationImage(
                            image: AssetImage(
                              Assets.images.btnbg3.path,
                              package: BaseX.pkg,
                            ),
                            fit: BoxFit.fill,
                          ),
                          size: ButtonSize.large,
                          onPressed: () {
                            Get.back();
                            if (kIsWeb) {
                              js.context
                                  .callMethod('setPointerEvents', ['none']);
                            }
                          },
                          child: Text(
                            'cancel'.tr,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: kIsWeb ? 0 : 18.w,
                    )
                  ],
                )),
          ),
        );
      },
    );
  }

  void copyLink() async {
    if (sharingLink.isEmpty) {
      showToast("copy_failed_can_not_share".tr);
      return;
    }
    if (kIsWeb) {
      WebUtil.copyText2Clipboard(sharingLink.value);
    } else {
      await Clipboard.setData(ClipboardData(text: sharingLink.value));
    }
    showToast("copy_successfully".tr);
  }

  void downloadPoster() async {
    if (!CoolDownManager.handler(
        key: 'kCoolDownDownloadDiscountPoster', duration: 500)) return;
    if (sharingLink.isEmpty) {
      showToast("download_failed_can_not_share".tr);
      return;
    }

    if (kIsWeb) {
      Map data = {
        "imageUrl": discount?.sharePicture,
        "qrCodeText": sharingLink.value,
        "title": discount?.title ?? '',
        "date": 'discount_activity_time'.tr + _statusExpiredTimeText
      };
      js.context.callMethod("downloadDiscountPoster", [jsonEncode(data)]);
      return;
    }

    List<Permission> list = [];
    if (GetPlatform.isAndroid) {
      list = [Permission.storage];
    } else {
      list = [Permission.photos, Permission.photosAddOnly];
    }
    bool isGranted = await PermissionUtils.isCheckPermission(list: list);
    if (!isGranted) {
      PermissionUtils.requestStorageAndPhotosPermission(
        applyFor: list,
        onSuccess: () {
          isGranted = true;
        },
        onFailed: () async {
          isGranted = false;
          showToast(sprintf('please_turn_on_storage_permission'.tr, [
            GetPlatform.isAndroid
                ? 'storage_permission'.tr
                : 'photos_permission'.tr
          ]));
          Future.delayed(const Duration(milliseconds: 600), () {
            openAppSettings(); // 没有权限打开设置页面
          });
        },
      );
      return;
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
          showToast('discount_failed_to_save'.tr);
        }
      } else {
        showToast('discount_failed_to_save'.tr);
      }
    }
  }
}
