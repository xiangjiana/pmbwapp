import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:get/get.dart';
import 'package:ob_package/modules/settings/lock_setting/lock_setting_controller.dart';
import 'package:ob_package/modules/settings/lock_setting/switch_tile.dart';
import 'package:ob_package/modules/settings/setting/component/setting_tile.dart';

class LockSettingPage extends StatefulWidget {
  const LockSettingPage({Key? key}) : super(key: key);

  @override
  _LockSettingPageState createState() => _LockSettingPageState();
}

class _LockSettingPageState extends State<LockSettingPage> with RouteAware {
  final controller = Get.find<LockSettingController>();

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
    super.didChangeDependencies();
  }

  @override
  void didPopNext() {
    controller.initLockSettingState();
    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        appBar: AppBar(
          title: ObNavigationBarTitle('lock_setting_unlock_settings'.tr),
          leading: ObBackButton(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Divider(height: 8.w, thickness: 8.w, color: Color(0xff0E1519)),
              SizedBox(height: 16.w),
              Obx(() {
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: ()=>Get.toNamed(AppRoutes.SETUP_GESTURE_PASSWORD),
                  child: SwitchTile(
                    value: controller.isLockSettingOpen,
                    title: 'lock_setting_unlock_settings'.tr,
                    subtitle: 'lock_setting_can_use_gesture_password'.tr,
                    onChanged: (b) => controller.toggleLockSetting(),
                    children: [
                      SettingTile(
                        title: 'lock_setting_change_gesture_password'.tr,
                        onPress: () => Get.toNamed(AppRoutes.SETUP_GESTURE_PASSWORD),
                      )
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
