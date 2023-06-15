import 'package:capital/capital.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_com_base/ob_com_base.dart';

class RefreshLottie extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry? padding;

  RefreshLottie({
    Key? key,
    required this.width,
    required this.height,
    this.padding,
  }) : super(key: key);

  RxInt status = 0.obs;
  final capitalApi = Get.find<CapitalApi>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPressed,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Container(
          color: Colors.transparent,
          child: Obx(
            () => Stack(
              children: [
                if (status.value == 1)
                if (!kIsWeb)
                  Lottie.asset(
                    Assets.lottie.refresh,
                    width: width,
                    height: height,
                    key: UniqueKey(),
                    animate: true,
                    package: BaseX.pkg,
                  )
                else
                  Image.asset(Assets.images.refreshGif.path,width: width,height:height,package: BaseX.pkg,)
                else if (status.value == 2)
                  if (!kIsWeb)
                    Lottie.asset(
                      Assets.lottie.refreshSuccess,
                      width: width,
                      height: height,
                      key: UniqueKey(),
                      animate: true,
                      repeat: false,
                      package: BaseX.pkg,
                    )
                  else
                    Image.asset(Assets.images.refresh.path,width: width,height:height,package: BaseX.pkg,)
                else
                  if (!kIsWeb)
                    Lottie.asset(
                      Assets.lottie.refresh,
                      width: width,
                      height: height,
                      animate: false,
                      package: BaseX.pkg,
                    )
                  else
                    Image.asset(Assets.images.refresh.path,width: width,height:height,package: BaseX.pkg,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onPressed() async {
    try {
      if (status.value == 2) return;
      bool enabled = CoolDownManager.handler(
        key: 'refreshBalance',
        duration: 1000,
      );
      if (!enabled) return;
      status.value = 1;
      if (Store.clientId == Store.clientIdDJ) {
        await capitalApi.withdraw();
      }
      await BalanceManager.refreshAll(true);
      status.value = 2;
      await Future.delayed(const Duration(seconds: 1));
      status.value = 0;
    } catch (e) {
      status.value = 0;
    }
  }
}
