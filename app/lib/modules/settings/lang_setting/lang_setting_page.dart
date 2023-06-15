import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:ob_package/modules/settings/lang_setting/lang_setting_controller.dart';

class LangSettingPage extends GetView<LangSettingController> {
  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        appBar: AppBar(
          title: ObNavigationBarTitle('chose_lang'.tr),
          leading: ObBackButton(),
          actions: [
            // _rightItem('reuse_contract'.tr, onTap: controller.onTapBarRightItem)
          ],
        ),
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 8.w,
                  child: const ColoredBox(
                    color: Color(0xff0E1519),
                  ),
                ),
                for (int i = 0; i < controller.langList.length; i++)
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => controller.choseLang(
                        controller.langList[i].langCode ?? '', i),
                    child: Container(
                      color: Colors.transparent,
                      height: 48.w,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 16.w,
                          ),
                          Text(
                            "${controller.langList[i].langTitle}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const Spacer(),
                          Obx(
                            () => Visibility(
                              visible: i == controller.checkNum.value,
                              child: ObImage.asset(
                                Assets.images.icon.comSelect.path,
                                width: 24.w,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
