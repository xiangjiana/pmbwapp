import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:params/params.dart';
import 'package:sign/sign.dart';
import 'package:sp_util/sp_util.dart';


class Invitation {
  static const String invitationCode = 'invitationCode';

  static final signApi = Get.find<SignApi>();
  
  static Future<void> getInvitationData() async {
    //电竞使用默认的合营码
    // if (Store.clientId == Store.clientIdDJ) {
    //   Store.invitationCode.value = "6036804";
    //   return;
    // }

    ///优先从剪切板和url取合营码，如果没有取到那么再从本地获取
    ///从剪切板取
    try {
      String obCode = 'obcode';
      String inviteCode = 'inviteCode';
      final channelData =kIsWeb?null: await  Clipboard.getData(Clipboard.kTextPlain);
      if (channelData != null && channelData.text != null) {
        List<String> channel = channelData.text!.split('&');
        for (var e in channel) {
          if (e.startsWith(obCode)) {
            getInvitationCode(e, obCode);
          } else if (e.contains('i_code')) {
            getInvitationCode(e, obCode);
          } else if (e.startsWith(inviteCode)) {
            getFriendInvitationCode(e, inviteCode);
          }
        }
      } else {
        getInvitationDataOnWeb();
      }
    } catch (_) {
      Store.invitationCode.value = '';
      Store.registerReference.value = '';
      Store.friendInvitationCode.value = '';
      getInvitationDataOnWeb();
    }
    String s = Store.invitationCode.value;

    ///如果没有取到那么再从本地获取再从本地sp取
    if (!isGoodInvitationCode(s)) {
      s = SpUtil.getString(invitationCode, defValue: '') ?? '';
      if (isGoodInvitationCode(s)) {
        Store.invitationCode.value = s;
      }
    } else {}

    if (Store.invitationCode.value.isNotEmpty) {
      try {
        await checkSelectInvitationCode(Store.invitationCode.value);
      } catch (e) {
        Store.invitationCode.value = '';
      }
    }
  }

  static Future checkSelectInvitationCode(String invitationCode) async{
    await signApi.selectInvitationCode(SelectInvitationCodeParam(invitationCode: invitationCode));
  }

  //如果是web端那么尝试获取从url拿到的iCode
  static getInvitationDataOnWeb() {
    if (kIsWeb) {
      Store.invitationCode.value = WebUtil.getSessionStorage("i_code");
    }
  }

  static void getInvitationCode(String channelData, String obCode) {
    final codeData = channelData.split("=");
    if (codeData.length >= 2 && isGoodInvitationCode(codeData[1])) {
      Store.invitationCode.value = codeData[1];
    } else {
      Store.invitationCode.value = '';
    }
  }

  static void updateInvitationCode(String s) {
    if (isGoodInvitationCode(s)) {
      Store.invitationCode.value = s;
      SpUtil.putString(invitationCode, s);
    }
  }

  static void getFriendInvitationCode(String channelData, String inviteCode) {
    final codeData = channelData.split("=");
    if (codeData.length >= 2) {
      Store.friendInvitationCode.value = codeData[1];
    } else {
      Store.friendInvitationCode.value = '';
    }
  }

  static bool isGoodInvitationCode(String s) {
    return s.length == 7 && StringUtils.isDigit(s);
  }
}
