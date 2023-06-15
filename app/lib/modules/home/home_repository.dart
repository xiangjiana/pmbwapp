import 'dart:async';
import 'package:activity/activity.dart';
import 'package:main/main.dart';
import 'package:message/message.dart';
import 'package:models/models.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:ob_com_http/ob_com_http.dart';
import 'package:ob_com_http/src/gen/api/invite_apis.dart';
import 'package:ob_com_http/src/gen/mod/inviteActivity/invite_inviteConfig_post_resp_model.dart';
import 'package:get/get.dart';
import 'package:params/params.dart';

class HomeRepository {
  final mainApi = Get.find<MainApi>();
  final messageApi = Get.find<MessageApi>();
  final activityApi = Get.find<ActivityApi>();

  Future<List<VenueTypeCodeAndVenues>> getMainMerchantGameListPost() async {
    try {
      return await mainApi.venueList();
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<ConfigGame>> getGameListByAssortId() async {
    try {
      return await mainApi.venueDy();
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<ObConfigAnnouncement>> getMessageCenterSelectAnnounceList() {
    try {
      return mainApi.selectAnnounceList();
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<UnReceivedBonusAndTime> getMessageCenterHasUnReceivedBonus() {
    try {
      return messageApi.hasUnReceivedBonus();
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<RespectiveUnReadAmount> getMemberUnReadAmount() {
    try {
      return messageApi.selectRespectiveUnReadAmount();
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<ActivityConfig>> getSponsorDiscount() {
    try {
      return activityApi.discountActivity(DiscountActivityParam(
        deviceType: GetPlatform.isAndroid
            ? 5
            : GetPlatform.isIOS
                ? 2
                : 4,
      ));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<InviteInviteConfigPostRespModel> getInviteInviteConfigPost() {
    final completer = Completer<InviteInviteConfigPostRespModel>();
    InviteApis.inviteInviteConfigPost(
      success: (InviteInviteConfigPostRespModel resp) {
        completer.complete(resp);
      },
      fail: (int code, String message) {
        completer.completeError(message);
      },
    );
    return completer.future;
  }
}
