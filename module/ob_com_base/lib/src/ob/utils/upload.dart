import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:repository/utils/upload.dart';

class UploaderPlugin {
  //意见反馈图片上传url
  static String _feedback = '/setting/upload';

  //会员头像¬url
  static String _avatar = '/user/upload';

  /// 意见反馈上传图片 && 溢出申请上传图片
  static void feedBackUpload(
      {required String filePath,
      required Function(UploadImageMod) success,
      required Function fail,
      bool use = false,
      ProgressCallback? progressCallback}) {
    UploaderUtils().start(
      url: _feedback,
      name: 'feedback_title'.tr,
      filePath: filePath,
      success: success,
      fail: fail,
      use: use,
      progressCallback: progressCallback,
    );
  }

  /// 头像上传图片
  static void avatarUpload(
      {required String filePath,
      required Function(UploadImageMod) success,
      required Function fail,
      bool use = false,
      ProgressCallback? progressCallback}) {
    UploaderUtils().start(
      url: _avatar,
      name: 'member_avatar'.tr,
      filePath: filePath,
      success: success,
      fail: fail,
      use: use,
      avatar: true,
      progressCallback: progressCallback,
    );
  }
}
