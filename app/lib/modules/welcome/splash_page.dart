import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_package/modules/welcome/welcome_controller.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

/// 闪屏页
class SplashPage extends GetView<WelcomeController> {
	const SplashPage({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return DefaultTextStyle(
			style: const TextStyle(
				color: Colors.white,
				decoration: TextDecoration.none,
			),
			child: Container(
				decoration: const BoxDecoration(
					gradient: LinearGradient(
						colors: [
							Color(0XFF18202A),
							Color(0XFF181524),
							Color(0XFF161F27),
						],
					),
				),
				child: Stack(
					alignment: Alignment.center,
					children: [
						Obx(() {
							if (controller.splashImageUrl.isNotEmpty) {
								return ObImage.network(
									controller.splashImageUrl,
									width: 1.sw,
									fit: BoxFit.fitWidth,
									alignment: Alignment.center,
								);
							}
							return SizedBox.shrink();
						}),
						Obx(() {
							if (controller.splashImageUrl.isEmpty && controller.splashFilePath.isNotEmpty)
								return Image.file(
									File(controller.splashFilePath),
									width: 1.sw,
									fit: BoxFit.fitWidth,
									alignment: Alignment.center,
								);
							return SizedBox.shrink();
						}),
						Positioned(
							top: kToolbarHeight - 20.w,
							right: 0,
							child: GestureDetector(
								behavior: HitTestBehavior.translucent,
								onTap: () {
									controller.goNextPage();
								},
								child: Padding(
									padding:
											EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.w),
									child: Container(
										constraints: BoxConstraints(
											minWidth: 56.w,
										),
										height: 24.w,
										alignment: Alignment.center,
										decoration: BoxDecoration(
											color: Colors.black.withOpacity(0.4),
											borderRadius: BorderRadius.circular(12.w),
										),
										child: Obx(
											() => Text(
											'skip'.tr+' ${controller.splashTime}s',
												style: TextStyle(fontSize: 12),
											),
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
