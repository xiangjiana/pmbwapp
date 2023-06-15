import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme, PrimaryButton;

class EmptyUnSettledList extends StatelessWidget {
  const EmptyUnSettledList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60.w),
        Container(
          alignment: Alignment.center,
          child: pkObImage(Assets.images.queJilu.path),
          // color: Colors.white.withOpacity(0.04),
          width: 234.w,
          height: 234.w,
        ),
        SizedBox(height: 12.w),
        Text(
          'bet_histories_no_record'.tr,
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 12,
          ),
        ),
        Container(
          constraints: BoxConstraints(minWidth: 114.w),
          height: 32.w,
          margin: EdgeInsets.only(top: 24.w),
          child: OBasePrimaryButton(
            child: Text(
              'bet_histories_bet_now'.tr,
              style: const TextStyle(fontSize: 14),
            ),
            image: DecorationImage(
              image: AssetImage(Assets.images.btnbg2.path, package: BaseX.pkg),
              fit: BoxFit.fill,
            ),
            onPressed: () {
              Get.back();

              ///HomePageController homeController = Get.find<HomePageController>();
              ///homeController.pageCtrl.jumpToPage(0);
              ///homeController.currentIndex.value = 0;
              BaseX.instance.baseCallback?.HomePageController_jumpToPage0();
            },
          ),
        ),
      ],
    );
  }
}
