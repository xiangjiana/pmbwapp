import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/modules/user/avatar_clip/avatar_clip_controller.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class AvatarClipPage extends StatelessWidget {
  AvatarClipPage({Key? key}) : super(key: key);
  final AvatarClipController controller = Get.find<AvatarClipController>();

  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        appBar: AppBar(
          title: ObNavigationBarTitle('avatar_cropping'.tr),
          leading: ObBackButton(),
          actions: [
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.transparent,
                ),
              ),
              onPressed: () => controller.handleClipImg(),
              child: Text(
                'save'.tr,
                style: TextStyle(
                  fontSize: 14.w,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Obx(
              () => Crop(
                controller: controller.cropController,
                image: controller.currentImage ?? Uint8List(0),
                onCropped: (croppedData) => controller.onCropped(croppedData),
                // onStatusChanged: (status) {
                //   setState(() {});
                // },
                initialSize: .8,
                withCircleUi: true,
                maskColor:
                    controller.isPreview ? ColorName.colorBackground : null,
                baseColor: ColorName.colorBackground,
                progressColor: ColorName.white.withOpacity(.2),
                cropStyle: CropStyle.line,
                cornerDotBuilder: (size, style, edgeAlignment) {
                  return controller.isPreview
                      ? const SizedBox.shrink()
                      : BorderControl(edgeAlignment);
                },
              ),
            ),
            Positioned(
              right: 16,
              bottom: 16,
              child: GestureDetector(
                onTapDown: (_) => controller.isPreview = true,
                onTapUp: (_) => controller.isPreview = false,
                child: CircleAvatar(
                  backgroundColor: controller.isPreview
                      ? ColorName.colorBackground
                      : Colors.white.withOpacity(0.1),
                  child: Center(
                    child: Icon(
                      Icons.crop_free_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
