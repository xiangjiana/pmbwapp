import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_package/utils/tool_kit.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/login_game/login_game.dart';
import 'package:ob_package/modules/home/components/message_badge.dart';
import 'package:ob_package/modules/home/components/service_badge.dart';
import 'package:ob_com_http/ob_com_http.dart';
import 'package:ob_component/ob_component.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../home_main/main_controller.dart';
import '../home_marquee/marquee_component.dart';

class BannerComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BannerComponentState();
  }
}

class _BannerComponentState extends State<BannerComponent> {
  final String dictionaryKey = 'resource.banner.interval.time';
  final AuthService authService = Get.find<AuthService>();
  final isModuleInViewPort = false.obs;

  String get vipLevel => authService.vipLevel;
  int _curIndex = 0;

  @override
  Widget build(BuildContext context) {
    final delay = (int.tryParse(Store.dictionary[dictionaryKey]) ?? 3) * 1000;

    return GetBuilder<MainController>(
        id: "bottomBanner",
        builder: (logic) {
          final List<GameBottomBanner> banner = logic.gameBottomBanner;
          return banner.isEmpty || banner[0].pictureUrl.isEmpty
              ? SizedBox()
              : Padding(
                  padding: EdgeInsets.only(top: 24.w),
                  child: GestureDetector(
                    onTap: () {
                      _onBannerItemClick(banner[0]);
                    },
                    child: Container(
                      height: 120.w,
                      width: 343.w,
                      child: Builder(builder: (context) {
                        String pictureUrl = banner[0].pictureUrl;
                        return pictureUrlImageWidget(pictureUrl);
                      }),
                    ),
                  ),
                );
        });
  }

  Widget pictureUrlImageWidget(String pic) {
    if (pic.isEmpty) return SizedBox();
    if (pic.startsWith('http://') || pic.startsWith('https://')) {
      return ObImage.network(
        pic,
        fit: BoxFit.fitWidth,
        cacheKey: pic,
      );
    } else {
      return pkObImage(
        pic,
        fit: BoxFit.fitWidth,
      );
    }
  }

  void _onBannerItemClick(GameBottomBanner item) {
    if (!Store.isLogin.value) {
      Get.toNamed(AppRoutes.LOGIN);
      return;
    }

    if (item.isLink == 1) {
      if (item.linkTargetId == 1) {
        String link = ToolKit.instance.addSignatureForActivityUrl(
          link: item.linkTargetUrl,
          type: DiscountEnum.banner,
        );
        //跳本地
        WebUtil.openInApp(
          link,
          title: item.bannerName,
          hasLoading: true,
        );
      } else if (item.linkTargetId == 0) {
        if (item.status == 0) {
          showToast("home_baccarat_game_is_disabled".tr);
          return;
        }
        if(!Store.isLogin.value){
          Get.toNamed(AppRoutes.LOGIN, arguments: {});
        }
        GameLoginUtils.openH5GamPage(
          item.venueCode,
          item.venueTypeCode,
          "${item.gameId}",
          title: item.bannerName,
        );
      } else if (item.linkTargetId == 2) {
        //外部地址跳转浏览器
        WebUtil.openInBrowser(item.linkTargetUrl);
      } else {
        if (GetPlatform.isWeb) {
          WebUtil.jumpToOffice();
        } else {
          WebUtil.openInApp(
            item.linkTargetUrl,
            title: item.bannerName,
          );
        }
      }
    }
  }
}
