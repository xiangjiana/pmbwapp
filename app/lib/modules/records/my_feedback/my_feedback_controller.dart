import 'dart:async';

import 'package:exception/exception.dart';
import 'package:get/get.dart';
import 'package:models/models.dart' show FeedbackPageResponse;
import 'package:ob_com_http/src/gen/mod/feedBack/feedBack_feedBackList_post_resp_model.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:params/params.dart';
import 'package:setting/setting.dart';

class MyFeedbackController extends GetxController with ObPageController {
  int pageSize = 20;
  int pageNum = 1;
  final smartRefreshCtrl = RefreshController(initialRefresh: false);

  RxBool _firstRefresh = true.obs;

  bool get firstRefresh => _firstRefresh.value;
  final settingApi = Get.find<SettingApi>();


  FeedBackFeedBackListPostRespModel? model;
  @override
  void onInit() {
    super.onInit();
    onRefresh();
  }

  @override
  onRefresh() {
    if (_firstRefresh.value == true) {
      _firstRefresh.value = false;
    }
    return super.onRefresh();
  }


  @override
  Future<PageResponse> getPageList(int page) async {
    try {
      FeedbackPageResponse model =
          await settingApi.feedBackList(PageParam(pageNum: page, pageSize: 20));
          print(model);
      return PageResponse(
        model.pageNum.toInt(),
        model.pageSize.toInt(),
        model.record.sublist(0),
        model.totalPage.toInt(),
        model.totalRecord.toInt(),
      );
    } on ServerException catch (e) {
      showToast(e.message);
      return Future.error(e.message);
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
