import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:ob_package/modules/user/user_profile/component/input_tile.dart';
import 'package:ob_package/modules/user/user_profile/user_profile_controller.dart';
import 'package:ob_package/utils/bw_back.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  Widget _buildBorderWrapper(Widget child) {
    return Container(
      width: 76.w,
      height: 76.w,
      padding: EdgeInsets.all(4.w),
      decoration: ShapeDecoration(
        shape: CircleBorder(
          side: BorderSide(width: 1, color: Color(0xffFF5722)),
        ),
      ),
      child: child,
    );
  }

  Widget _buildEmptyWrapper(Widget child) {
    return Container(
      width: 76.w,
      height: 76.w,
      padding: EdgeInsets.all(4.w),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(
        global: true,
        init: UserProfileController(Get.find(), Get.find()),
        builder: (controller) {
          return ObTheme(
            child: Scaffold(
              appBar: AppBar(
                title: ObNavigationBarTitle(
                    'user_profile_personal_information'.tr),
                leading: GetPlatform.isWeb ? BwBackButton() : ObBackButton(),
                bottom: PreferredSize(
                  preferredSize: Size(double.infinity, 8),
                  child: Divider(
                    height: 8.w,
                    thickness: 8.w,
                    color: Color(0xff0E1519),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      _userIconAreaWidget(context,controller),
                      Divider(),
                      InputTile(
                        label: 'user_profile_username'.tr,
                        controller: controller.userNameCtl,
                      ),
                      Divider(),
                      InputTile(
                        label: 'user_profile_actual_name'.tr,
                        hint: 'user_profile_must_be_the_same_as_the_name_of_the_bank_card'.tr,
                        onPress: controller.selectRealName,
                        controller: controller.realNameCtl,
                      ),
                      Divider(),
                      InputTile(
                        label: 'gender'.tr,
                        hint: 'not_selected'.tr,
                        enabled: false,
                        readOnly: true,
                        onPress: controller.selectGender,
                        controller: controller.genderCtl,
                      ),
                      Divider(),
                      InputTile(
                        label: 'date_of_birth'.tr,
                        hint: 'user_profile_add_the_date'.tr,
                        enabled: false,
                        readOnly: controller.isBirthDay,
                        onPress: controller.selectBirth,
                        controller: controller.birthDayCtl,
                      ),
                      if (AppMerchantUtils.loadCurMerchantBy(OBModules.kSMSVerification))
                        Divider(),
                      if (AppMerchantUtils.loadCurMerchantBy(OBModules.kSMSVerification))
                        InputTile(
                          label: 'user_phone'.tr,
                          hint: 'user_profile_bind_mobile_phone'.tr,
                          controller: controller.phoneCtl,
                          onPress: controller.navigateBindPhone,
                        ),
                      Divider(),
                      InputTile(
                        label: 'email'.tr,
                        hint: 'user_profile_bind_email'.tr,
                        controller: controller.emailCtl,
                        onPress: controller.navigateBindEmail,
                      ),
                      Divider(),
                      SizedBox(height: 16.w),
                      Text(
                        'user_profile_for_your_privacy'.tr,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(height: 40.w),
                      if (AppMerchantUtils.loadCurMerchantBy(OBModules.kCustomerService))
                        ContactCustomerService(),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget _userIconAreaWidget(
    BuildContext context,
    UserProfileController controller,
  ) {
    Widget _buildItem(BuildContext context, int index) {
      if (index == 0) {
        return GestureDetector(
          onTap: () => controller.selectAvatar(),
          child: controller.isAvatar
              ? _buildBorderWrapper(
                  Avatar(
                    child: Text(
                      'replace'.tr,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    backgroundImage: controller.isAvatarHttpUrl
                        ? NetworkImage(controller.userAvatarUrl)
                        : AssetImage(
                            controller.userAvatarUrl.toPng(),
                            package: BaseX.pkg,
                          ) as ImageProvider,
                    backgroundColor: ColorName.colorBackground,
                    backgroundImageColorFilter:
                        Color(0xff000000).withOpacity(0.6),
                    radius: 34.w,
                  ),
                )
              : _buildEmptyWrapper(
                  Avatar(
                    child: ObImage.asset(
                      Assets.images.icon.courseAdd.path,
                      width: 24.w,
                      package: BaseX.pkg,
                    ),
                    backgroundColor: ColorName.white.withOpacity(0.04),
                    foregroundColor: Colors.white,
                    radius: 34.w,
                  ),
                ),
        );
      }

      String? url = controller.localAvatarUrls.safe(index - 1);
      if (url == null || url.length == 0)
        return ColoredBox(color: ColorName.colorBackground);

      Avatar av = Avatar(
        backgroundColor: ColorName.colorBackground,
        backgroundImage: AssetImage(
          url.toPng(),
          package: BaseX.pkg,
        ),
        radius: 34.w,
      );

      return controller.userAvatarUrl == url
          ? _buildBorderWrapper(av)
          : GestureDetector(
              onTap: () => controller.updateLocalAvatar(url),
              child: _buildEmptyWrapper(av),
            );
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.w),
      width: double.infinity,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1.0,
          mainAxisSpacing: 24.w,
          crossAxisSpacing: 8.w,
        ),
        itemBuilder: _buildItem,
        itemCount: (controller.localAvatarUrls.length + 1),
      ),
    );
  }
}
