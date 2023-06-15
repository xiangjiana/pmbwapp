import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_package/modules/settings/feedback/components/feedback_label_row.dart';
import 'package:ob_package/modules/settings/feedback/feedback_controller.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:permission_handler/permission_handler.dart';
import 'package:sprintf/sprintf.dart';

class FeedbackPageNew extends StatefulWidget {
  @override
  _FeedbackPage createState() => _FeedbackPage();
}

class _FeedbackPage extends BottomKeyboardInputState {
  final FeedbackController feedBackController = Get.find<FeedbackController>();

  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.red,
          title: ObNavigationBarTitle('feedback_title'.tr),
          leading: ObBackButton(),
          actions: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Get.toNamed(AppRoutes.MY_FEEDBACK);
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    'feedback_my'.tr,
                    style: TextStyle(
                      fontSize: 14,
                      color: Get.theme.colorScheme.primary.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(8.w),
            child: Divider(
              height: 8.w,
              thickness: 8.w,
              color: Get.theme.scaffoldBackgroundColor,
            ),
          ),
        ),
        body: Stack(
          children: [
            CustomScrollView(
              controller: feedBackController.customScrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: 16.w),
                    child: FeedBackLabelRow("my_feedback_question_type".tr),
                  ),
                ),
                _buildQuestionType(),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: 32.w),
                    child: FeedBackLabelRow("my_feedback_question_desc".tr),
                  ),
                ),
                _buildQuestionDepiction(),
                _buildFeedbackGraphics(),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                      top: 24.w,
                      bottom: 66.w,
                    ),
                    child: Obx(
                          () =>
                          OBasePrimaryButton(
                            block: true,
                            size: ButtonSize.large,
                            disabled: !feedBackController.canSubmit.value,
                            loadingStatus: feedBackController.isLoadingStatus
                                .value,
                            onPressed: () {
                              KeyboardUtil().hideKeyboard(context);
                              feedBackController.submit();
                            },
                            image: DecorationImage(
                              image: AssetImage(
                                Assets.images.btnbg.path,
                                package: BaseX.pkg,
                              ),
                              fit: BoxFit.fill,
                            ),
                            child: Text(
                              'submit'.tr,
                              style: TextStyle(
                                fontSize: 16,
                                color: Get.theme.colorScheme.primary,
                              ),
                            ),
                          ),
                    ),
                  ),
                ),
              ],
            ),
            Obx(
                  () =>
                  Visibility(
                    visible: feedBackController.isLoadingStatus.value,
                    child: Container(
                      color: Colors.black.withOpacity(.10),
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  //图片上传
  SliverPadding _buildFeedbackGraphics() {
    return SliverPadding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.w),
      sliver: SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.zero,
          child: Uploader(
            beforeAdd: () async {
              if (kIsWeb) {
                return true;
              }
              List<Permission> list = [];
              if (GetPlatform.isAndroid) {
                list = [Permission.storage];
              } else {
                list = [Permission.photos, Permission.photosAddOnly];
              }
              bool isGranted = await PermissionUtils.isCheckPermission(
                  list: list);
              if (!isGranted) {
                await PermissionUtils.requestStorageAndPhotosPermission(
                  applyFor: list,
                  onSuccess: () {
                    isGranted = true;
                  },
                  onFailed: () async {
                    isGranted = false;
                    showToast(sprintf('please_turn_on_storage_permission'.tr, [
                      GetPlatform.isAndroid
                          ? 'storage_permission'.tr
                          : 'photos_permission'.tr
                    ]));
                    Future.delayed(const Duration(milliseconds: 600), () {
                      openAppSettings(); // 没有权限打开设置页面
                    });
                  },
                );
                return isGranted;
              }
              return isGranted;
            },
            maxCount: 3,
            customRequest: feedBackController.uploadImage,
            onChange: (List<String> list) {
              feedBackController.imagePaths = list.obs;
            },
          ),
        ),
      ),
    );
  }

  //反馈描述
  SliverToBoxAdapter _buildQuestionDepiction() {
    return SliverToBoxAdapter(
      child: Container(
        width: 343.w,
        height: 228.w,
        margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.w),
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.primary.withOpacity(0.04),
          borderRadius: BorderRadius.circular(8.w),
        ),
        padding: EdgeInsets.all(16.w),
        child: TextField(
          style: TextStyle(
            fontSize: 14,
            color: Get.theme.colorScheme.primary,
          ),
          autofocus: Store.isAutoFocus,
          controller: feedBackController.textEditingController,
          maxLength: 200,
          maxLines: 10,
          decoration: InputDecoration(
            border: InputBorder.none,
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintStyle: TextStyle(
              fontSize: 14,
              color: Get.theme.colorScheme.primary.withOpacity(0.4),
            ),
            hintText: "feedback_hint".tr,
            counterStyle: TextStyle(
              fontSize: 14,
              color: Get.theme.colorScheme.primary.withOpacity(0.6),
            ),
          ),
        ),
      ),
    );
  }

  //反馈问题类型
  SliverPadding _buildQuestionType() {
    return SliverPadding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 12.w),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            return Obx(
              () => GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  feedBackController.hideKeyboard();
                  feedBackController.selectedType.value = index;
                  feedBackController.setCanSubmit();
                },
                child: Padding(
                  padding: EdgeInsets.all(6.w),
                  child: Container(
                    width: 106.w,
                    height: 36.w,
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: feedBackController.selectedType.value == index
                          ? const Color(0xff40b421)
                          : Get.theme.colorScheme.primary.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(18.w),
                    ),
                    child: Text(
                      problemTypes[index] ?? "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: LocaleUtils.isLocale ? 12 : 14,
                        color: feedBackController.selectedType.value == index
                            ? Get.theme.colorScheme.primary
                            : Get.theme.colorScheme.primary.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          childCount: problemTypes.length,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0.w,
          mainAxisSpacing: 0.w,
          childAspectRatio: 118 / 48,
          crossAxisCount: 3,
        ),
      ),
    );
  }

  @override
  closeKeyBoard() {
    double offset = feedBackController.customScrollController.offset;
    feedBackController.customScrollController.animateTo(
        feedBackController.customScrollController.offset - offset,
        duration: Duration(milliseconds: 400),
        curve: Curves.ease);
  }

  @override
  openKeyBoard() {
    double offset = feedBackController.customScrollController.offset;
    if (offset == 0 && !Store.isAutoFocus) {
      feedBackController.customScrollController.animateTo(
          feedBackController.customScrollController.offset + 200.w,
          duration: Duration(milliseconds: 400),
          curve: Curves.ease);
    }
  }
}
