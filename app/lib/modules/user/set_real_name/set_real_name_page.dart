import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:ob_package/modules/user/set_real_name/set_real_name_controller.dart';

import '../../home/components/mine_widget/gradient_icon_button.dart';

class SetRealNamePage extends GetView<SetRealNameController> {
  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        appBar: AppBar(
          title: ObNavigationBarTitle('set_real_name'.tr),
          leading: ObBackButton(),
          actions: [
            // _rightItem('reuse_contract'.tr, onTap: controller.onTapBarRightItem)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 8.w,
                child: ColoredBox(
                  color: Color(0xff0E1519),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'user_profile_actual_name'.tr,
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 14,
                        height: 1,
                      ),
                    ),
                    Obx(() => _buildUsernameTextField(context)),
                    SizedBox(
                      height: 16.w,
                    ),
                    _buildSettingButton(),
                    SizedBox(
                      height: 16.w,
                    ),
                    Center(
                      child: Text(
                        "user_cannot_be_modified_after_confirmation".tr,
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 14,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUsernameClearButton() {
    return Offstage(
      offstage: controller.usernameClearButtonHide.value,
      child: IconButton(
        iconSize: 14,
        padding: EdgeInsets.zero,
        onPressed: controller.onTapClearUsername,
        icon:
            Assets.images.icon.comDelete.asObImage2(width: 14.w, height: 14.w),
      ),
    );
  }

  Widget _buildUsernameTextField(BuildContext context) {
    return TextField(
      onChanged: (value) => controller.onChangeUsername(value),
      maxLength: 64,
      controller: controller.usernameTextController,
      cursorColor: Theme.of(context).colorScheme.primary,
      focusNode: controller.usernameFocusNode,
      autofocus: false,
      style: TextStyle(
        fontSize: 14,
      ),
      enabled: true,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r'[\u4e00-\u9fa5a-zA-Z\u0E00-\u0E7F\s·.aAàÀảẢãÃáÁạẠăĂằẰẳẲẵẴắẮặẶâÂầẦẩẨẫẪấẤậẬbBcCdDđĐeEèÈẻẺẽẼéÉẹẸêÊềỀểỂễỄếẾệỆfFgGhHiIìÌỉỈĩĨíÍịỊjJkKlLmMnNoOòÒỏỎõÕóÓọỌôÔồỒổỔỗỖốỐộỘơƠờỜởỞỡỠớỚợỢpPqQrRsStTuUùÙủỦũŨúÚụỤưƯừỪửỬữỮứỨựỰvVwWxXyYỳỲỷỶỹỸýÝỵỴzZ]'),
        )
      ],
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        isDense: true,
        counterText: "",
        hintText: "add_bank_account_please_enter_cardholder_name".tr,
        hintStyle: TextStyle(
          color: Theme.of(context).textSelectionTheme.selectionColor,
          fontSize: 14,
        ),
        suffixIcon: _buildUsernameClearButton(),
        suffixIconConstraints: BoxConstraints(maxHeight: 24, maxWidth: 24),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildSettingButton() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: OBasePrimaryButton(
          child: Text(
            'submit'.tr,
            style: TextStyle(fontSize: 14),
          ),
          image: DecorationImage(
            image: AssetImage(Assets.images.btnbg.path, package: BaseX.pkg),
            fit: BoxFit.fill,
          ),
          size: ButtonSize.large,
          block: true,
          disabled: !controller.isSetButtonEnable.value,
          onPressed: controller.onTapSetRealName,
        ),
      );
    });
  }
}
