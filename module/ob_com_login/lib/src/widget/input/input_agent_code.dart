import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:ob_com_base/ob_com_base.dart';

class InputAgentCode extends ObInputTextField {
  InputAgentCode({
    Key? key,
    bool autofocus = false,
    bool enabled = true,
    FocusNode? focusNode,
    ValueChanged<String>? onChanged,
    TextEditingController? controller,
    bool enableClean = false,
    onCleanTap,
    onInfoTap,
  }) : super(
          key: key,
          rimStyle: RimStyle.customize,
          editingController: controller,
          onChanged: onChanged,
          autofocus: autofocus,
          hintText: 'plz_enter_invitecode'.tr,
          focusNode: focusNode,
          enabled: enabled,
          contentPadding: EdgeInsets.only(left: 20.w),
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(7),
            FilteringTextInputFormatter.digitsOnly,
          ],
          focusedBorder: InputBorder.none,
          suffixIcon: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                visible: enableClean,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    onCleanTap?.call();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: pkObImage(
                      Assets.images.icon.comDelete2.path,
                      width: 24.w,
                      height: 24.w,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  showInfoDialog();
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 20.w,
                  ),
                  child: pkObImage(
                    Assets.images.info.path,
                    width: 15.w,
                    height: 15.w,
                  ),
                ),
              )
            ],
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 24.w,
            minHeight: 24.w,
          ),
        );
  static showInfoDialog() {
    OBDialogUtil.show(Dialog(
        child: Container(
      constraints: BoxConstraints(maxHeight: 150.w),
      padding: EdgeInsets.only(left: 16.w,right: 16.w,top: 16.w),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 32, 35, 39),
          borderRadius: BorderRadius.circular(5.w),
          border: Border.all(color: Colors.white.withOpacity(.1))),
      width: 0.8.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              pkObImage(
                Assets.images.info.path,
                width: 16.w,
                height: 16.w,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                "referral_code_description".tr,
                style: TextStyle(color: Colors.white, fontSize: 17.w),
              )
            ],
          ),
          SizedBox(
            height: 10.w,
          ),
          Text(
            "referral_code_description_info".tr,
            style: TextStyle(color: Colors.white, fontSize: 14.w),
          ),
          SizedBox(
            height: 5.w,
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: pkObImage(
                Assets.images.icon.comDelete.path,
                width: 25.w,
                height: 25.w,
              ),
            ),
            onTap: () {
              Get.back();
            },
          ),
        ],
      ),
    )));
  }
}
