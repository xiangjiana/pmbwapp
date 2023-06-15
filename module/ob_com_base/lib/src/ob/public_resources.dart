// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:config/config.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';

import 'package:repository/utils/net.dart';

class PublicResources {
  static final configApi = Get.find<ConfigApi>();
  static String withdrawalKey = '取款教程';
  static String withdrawalKey2 = 'Withdrawal Tutorial';
  static String gameInfoKey = '游戏介绍';
  static String gameInfoKey2 = 'Game Introduction';
  static String transferKey = '转账教程';
  static String transferKey2 = 'Transfer Tutorial';
  static String techHelpKey = '技术支持';
  static String techHelpKey2 = 'Technical Support';
  static String feedbackKey = '意见反馈';
  static String feedbackKey2 = 'Feedback';
  static String depositKey = '存款教程';
  static String depositKey2 = 'Deposit Tutorial';
  static String contractUsKey = '联系我们';
  static String contractUsKey2 = 'Contact us';

  static GestureRecognizer gestureRecognizer = TapGestureRecognizer()
    ..onTap = jumpToMemberServicePage;

  //用于textSpan
  static GestureRecognizer jumpRecognizer() {
    return gestureRecognizer;
  }

  /// 每次点击均需要拿最新的线上客服地址，接口报错时会拿缓存的数据，当接口不通且缓存被清理时，才会拿预埋的客服地址
  /// 类型[0:会员客服地址,1:代理客服地址,2:IOS下载地址,3:安卓下载地址,4:桌面端下载地址,5:投诉建议邮箱,6:客户邮箱,7:合营部ID]
  static Future<String> getCustomerServiceLink(int type) async {
    final completer = Completer<String>();

    try {
      final res = await configApi.customerAddr();
      if (res.memberUrl.isEmpty) {
        completer.complete('');
      }
      final resourcesUrl = res.memberUrl;
      if (!completer.isCompleted) {
        completer.complete(resourcesUrl);
      }
    } catch (e) {
      completer.completeError(e);
    }
    try {
      Future.delayed(const Duration(seconds: 5), () {
        if (!completer.isCompleted) {
          completer.completeError('使用默认的客服链接');
        }
      });
    } catch (e) {
      if (!completer.isCompleted) {
        completer.completeError('使用默认的客服链接');
      }
    }
    return completer.future;
  }

  //会员客服跳转
  static Future<void> jumpToMemberServicePage(
      {bool openBrowser = false}) async {
    if (Store.clientId == Store.clientIdDJ && Store.openBrowser) {
      openBrowser = true;
    }

    try {
      if (CoolDownManager.handler(key: 'kMemberService', duration: 1000)) {
        if (kIsWeb && Net().isConnect && GetPlatform.isIOS) {
          WebUtil.windowPreOpen();
        }
        showLoading();
        Store.memberCustomerUrl = await getCustomerServiceLink(0);
        if (Store.memberCustomerUrl.trim().isEmpty) {
          WebUtil.openInApp(
            Tools.getConfigFromFlavor(MEMBER_CUSTOMER_URL)!,
            showTitle: true,
            title: 'online_service'.tr,
            openBrowser: openBrowser,
          );
        } else {
          if (Store.memberCustomerUrl.replaceAll(' ', '') != '') {
            Store.memberCustomerUrl =
                Store.memberCustomerUrl.replaceAll(' ', '');
            Store.memberCustomerUrl = Store.memberCustomerUrl.contains('http')
                ? Store.memberCustomerUrl
                : 'https://' + Store.memberCustomerUrl;
          }
          WebUtil.openInApp(
            Store.memberCustomerUrl,
            showTitle: true,
            title: 'online_service'.tr,
            openBrowser: openBrowser,
          );
        }
        dismissLoading();
      }
    } catch (e) {
      errorJumpToService(ServiceType.MEMBER, openBrowser: openBrowser);
      if (kIsWeb) {
        WebUtil.windowClose();
      }
    }
  }

  ///跳转教程
  static jumpToNavigateHelp(String sKey) async {
  }
  // static jumpToNavigateHelp(String sKey) async {
  //   String key = langTutorName(sKey);
  //   if (Store.isEasyPay) {
  //     Store.allHelp.tutorNameList.removeWhere((element) =>
  //         (element.id == "1455440328554188801" ||
  //             element.tutorName == "help_course_title1".tr ||
  //             element.tutorName == '存款教程'));
  //   }
  //   try {
  //     if (!ConnectivityX.instance.isConnected) {
  //       showToast("no_more_data_for_now".tr);
  //       return;
  //     }
  //
  //     TutorName? tutorFixed = getTutor(key, tutorNameList);
  //     if (tutorFixed != null) {
  //       if (key == contractUsKey || key == contractUsKey2) {
  //         Get.toNamed(
  //           AppRoutes.CONTACT_US,
  //           parameters: {
  //             'tutorId': tutorFixed.id,
  //             'tutorName': tutorFixed.tutorName
  //           },
  //         );
  //         return;
  //       }
  //       if (key == feedbackKey || key == feedbackKey2) {
  //         Get.toNamed(
  //           AppRoutes.FEEDBACK,
  //           parameters: {
  //             'tutorId': tutorFixed.id,
  //             'tutorName': tutorFixed.tutorName
  //           },
  //         );
  //         return;
  //       }
  //     }
  //
  //     if (Store.allHelp.tutorNameList.isEmpty) {
  //       //跳转空态页面
  //       Get.toNamed(
  //         AppRoutes.HELP_EMPTY,
  //         parameters: {'tutorName': getTutorName(key)},
  //       );
  //       return;
  //     }
  //
  //     TutorNameList? tutor = getTutor2(key, Store.allHelp.tutorNameList);
  //     if (null != tutor && null != tutorFixed) {
  //       List<Map<String, dynamic>> bookmarks = makeBookmarks(tutor.id);
  //       List<TutorContentList> exEntents = makeContents(tutor.id);
  //       if (exEntents.isEmpty) {
  //         //跳转空态页面
  //         Get.toNamed(
  //           AppRoutes.HELP_EMPTY,
  //           parameters: {'tutorName': getTutorName(key)},
  //         );
  //         return;
  //       }
  //
  //       if (tutorFixed.route.isEmpty) {
  //         showToast("wrong_route".tr);
  //         return;
  //       }
  //
  //       if (bookmarks.isEmpty) {
  //         if ([AppRoutes.DEPOSIT_COURSE, AppRoutes.GAME_INTRODUCE]
  //             .contains(tutorFixed.route)) {
  //           Get.toNamed(
  //             AppRoutes.HELP_EMPTY,
  //             parameters: {'tutorName': getTutorName(key)},
  //           );
  //           return;
  //         }
  //       }
  //
  //       Get.toNamed(
  //         tutorFixed.route,
  //         parameters: {'tutorId': tutor.id, 'tutorName': tutor.tutorName},
  //         arguments: {'bookmarks': bookmarks, 'contents': exEntents},
  //       );
  //     }
  //   } catch (_) {}
  // }

  static TutorName? getTutor(String key, List<TutorName> list) {
    for (var o in list) {
      if (key == langTutorName(o.tutorName)) {
        return o;
      }
    }
    return null;
  }

  // static TutorNameList? getTutor2(String key, List<TutorNameList> list) {
  //   for (var o in list) {
  //     if (key == langTutorName(o.tutorName)) {
  //       return o;
  //     }
  //   }
  //   return null;
  // }

  static String getTutorName(String key) {
    if (key == withdrawalKey || key == withdrawalKey2)
      return 'help_course_text2'.tr;
    if (key == gameInfoKey || key == gameInfoKey2)
      return 'help_course_text4'.tr;
    if (key == transferKey || key == transferKey2)
      return 'help_course_text3'.tr;
    if (key == techHelpKey || key == techHelpKey2)
      return 'help_course_text5'.tr;
    if (key == feedbackKey || key == feedbackKey2)
      return 'help_course_text7'.tr;
    if (key == depositKey || key == depositKey2) return 'help_course_text1'.tr;
    if (key == contractUsKey || key == contractUsKey2)
      return 'help_course_text6'.tr;
    return '';
  }

  static String langTutorName(String key) {
    if (key == withdrawalKey || key == withdrawalKey2) return withdrawalKey;
    if (key == gameInfoKey || key == gameInfoKey2) return gameInfoKey;
    if (key == transferKey || key == transferKey2) return transferKey;
    if (key == techHelpKey || key == techHelpKey2) return techHelpKey;
    if (key == feedbackKey || key == feedbackKey2) return feedbackKey;
    if (key == depositKey || key == depositKey2) return depositKey;
    if (key == contractUsKey || key == contractUsKey2) return contractUsKey;
    return '';
  }

  //代理客服跳转
  static Future<void> jumpToAgentServicePage({bool openBrowser = false}) async {
    try {
      if (CoolDownManager.handler(
          key: 'kAgentNCustomService', duration: 1000)) {
        showLoading();
        Store.agentCustomerUrl = await getCustomerServiceLink(1);

        if (Store.agentCustomerUrl.trim().isEmpty) {
          WebUtil.openInApp(
            Tools.getConfigFromFlavor(AGENT_CUSTOMER_URL)!,
            showTitle: true,
            title: 'contact_customer_service'.tr,
            openBrowser: openBrowser,
          );
        } else {
          if (Store.agentCustomerUrl.replaceAll(' ', '') != '') {
            Store.agentCustomerUrl = Store.agentCustomerUrl.replaceAll(' ', '');
            Store.agentCustomerUrl = Store.agentCustomerUrl.contains('http')
                ? Store.agentCustomerUrl
                : 'https://' + Store.agentCustomerUrl;
          }
          WebUtil.openInApp(
            Store.agentCustomerUrl,
            showTitle: true,
            title: 'contact_customer_service'.tr,
            openBrowser: openBrowser,
          );
        }
        dismissLoading();
      }
    } catch (e) {
      errorJumpToService(ServiceType.AGENT, openBrowser: openBrowser);
    }
  }

  // static List<TutorContentList> makeContents(String tutorId) {
  //   List<TutorContentList> exEntents = [];
  //   Store.allHelp.tutorContentList.forEach((content) {
  //     if (tutorId == content.tutorId) {
  //       exEntents.add(content);
  //     }
  //   });
  //   return exEntents;
  // }
  //
  // static List<Map<String, dynamic>> makeBookmarks(String tutorId) {
  //   List<Map<String, dynamic>> bookmarks = [];
  //   Store.allHelp.bookMarkList.forEach((mark) {
  //     if (tutorId == mark.tutorId) {
  //       String bookmarkId = mark.id;
  //       List<TutorContentList> contents = [];
  //       Store.allHelp.tutorContentList.forEach((content) {
  //         if (bookmarkId == content.bookmarkId) {
  //           contents.add(content);
  //         }
  //       });
  //       bookmarks.add({
  //         'title': mark.bookmarkName,
  //         'imagePath': mark.bookmarkPicture,
  //         'datas': contents
  //       });
  //     }
  //   });
  //   return bookmarks;
  // }

  static void errorJumpToService(ServiceType target,
      {bool openBrowser = false}) {
    dismissLoading();
    if (!Get.currentRoute.contains(AppRoutes.WEB)) {
      Store.agentCustomerUrl = Flavor.I.getString(AGENT_CUSTOMER_URL)!;
      Store.memberCustomerUrl = Flavor.I.getString(MEMBER_CUSTOMER_URL)!;
      WebUtil.openInApp(
        target == ServiceType.MEMBER
            ? Store.memberCustomerUrl
            : Store.agentCustomerUrl,
        showTitle: true,
        title: 'contact_customer_service'.tr,
        openBrowser: openBrowser,
      );
    }
  }
}

enum ServiceType {
  MEMBER,
  AGENT,
}
