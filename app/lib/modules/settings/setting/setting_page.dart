import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/modules/settings/setting/component/setting_tile.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:ob_package/utils/bw_back.dart';

import 'cache_manager.dart';
import 'setting_controller.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> with WidgetsBindingObserver {
  final controller = Get.find<SettingController>();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      controller.cacheReception();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        appBar: AppBar(
          title: ObNavigationBarTitle('setting'.tr),
          leading: GetPlatform.isWeb ? BwBackButton() : ObBackButton(),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: 48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // GestureDetector(
                //   onTap: controller.logout,
                //   child: Container(
                //     width: 200.w,
                //     height: 30.w,
                //     alignment: Alignment.center,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(30.w),
                //       color: Colors.white.withOpacity(0.1),
                //     ),
                //     child: Text(
                //       'setting_sign_out'.tr,
                //       style: TextStyle(
                //           fontSize: 16, color: Colors.white, height: 1.0),
                //     ),
                //   ),
                // )
                SizedBox(
                  width: 200.w,
                  child: SecondaryButton(
                    block: true,
                    size: ButtonSize.large,
                    child: Text(
                      'setting_sign_out'.tr,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    onPressed: controller.logout,
                  ),
                ),
              ],
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Divider(
                height: 8.w,
                thickness: 8.w,
                color: Color(0xff0E1519),
              ),
            ),
            Column(
              children: [
                if (controller.supportLang.length > 1)
                  SettingTile(
                    title: 'lang'.tr,
                    description: 'cn_lang'.tr,
                    onPress: () => Get.toNamed(AppRoutes.LANG_SETTING),
                  ),
                SettingTile(
                  title: 'find_password_update'.tr,
                  description: '',
                  onPress: controller.navigateVerifyIdentity,
                ),
                if (!GetPlatform.isWeb)
                  Obx(
                    () => SettingTile(
                      title: 'setting_clear_cache'.tr,
                      description: CacheManager.sizeDes.value,
                      onPress: controller.clearCache,
                      isShow: false,
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  child: Divider(indent: 16),
                ),
                SettingTile(
                  title: 'feedback_title'.tr,
                  onPress: () => Get.toNamed(AppRoutes.FEEDBACK),
                ),
                if (!GetPlatform.isWeb)
                  Obx(
                    () => SettingTile(
                      title: 'setting_check_for_updates'.tr,
                      newMark: Visibility(
                        visible: controller.versioNewMark.value,
                        child: Container(
                          margin: EdgeInsets.only(right: 10.w),
                          alignment: Alignment(0, 0),
                          height: 20.w,
                          width: 36.w,
                          decoration: new BoxDecoration(
                            color: ColorName.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Text(
                            'NEW',
                            style: TextStyle(
                              color: ColorName.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      description: 'setting_current_version'.tr +
                          'V${controller.version}',
                      onPress: () => UpdateUtil.checkUpdateVersion(flag: true),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  child: Divider(indent: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
