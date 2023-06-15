import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_http/ob_com_http.dart';
import 'package:params/params.dart';
import '../../../login_game/login_game.dart';
import '../../../utils/tool_kit.dart';
import '../home_main/main_controller.dart';
import 'package:visibility_detector/visibility_detector.dart';

class RecommendBanner extends StatefulWidget {
  const RecommendBanner({Key? key}) : super(key: key);

  @override
  State<RecommendBanner> createState() => _RecommendBannerState();
}

class _RecommendBannerState extends State<RecommendBanner> {
  int _curIndex = 0;
  final String dictionaryKey = 'resource.banner.interval.time';
  final isModuleInViewPort = false.obs;

  @override
  Widget build(BuildContext context) {
    final delay = (int.tryParse(Store.dictionary[dictionaryKey]) ?? 3) * 1000;
    final banner = Store.bannerList;
    return GetBuilder<MainController>(
        id: 'recommendBanner',
        builder: (logic) {
          return VisibilityDetector(
            key: UniqueKey(),
            onVisibilityChanged: (VisibilityInfo info) {
              isModuleInViewPort.value = info.visibleFraction != 0;
            },
            child: banner.isEmpty
                ? SizedBox()
                : Container(
              height: 120.w + 22.w,
              width: 375.w,
              child: _buildSwiper(delay, banner),
            ),
          );
        });
  }

  Widget _buildSwiper(int delay, RxList banner,) {
    return Obx(() {
      return Swiper(
        autoplay: isModuleInViewPort.value && banner.length > 1,
        autoplayDelay: delay,
        index: _curIndex,
        viewportFraction: 276 / 375,
        itemCount: banner.length,
        onIndexChanged: (index) {},
        itemBuilder: (BuildContext context, int index) {
          String pictureUrl = banner[index].pictureUrl;
          return Padding(
            padding: EdgeInsets.only(left: 7.w, right: 7.w, bottom: 22.w),
            child: GestureDetector(
              onTap: () => _onBannerItemClick(index), //banner 跳转事件
              child: ObImage.network(
                pictureUrl,
                fit: BoxFit.fitWidth,
                cacheKey: pictureUrl,
                errorBuilder: (context, object, stack) {
                  return ObImage.asset(
                    Assets.images.home02.path,
                    fit: BoxFit.fitWidth,
                  );
                },
              ),
            ),
          );
        },
        pagination: _buildSwiperCustomPagination(banner.length),
      );
    });
  }

  SwiperCustomPagination _buildSwiperCustomPagination(int count) {
    return SwiperCustomPagination(
      builder: (BuildContext context, SwiperPluginConfig config) {
        return ObCustomSwiperPagination(
          count: count,
          config: config,
          marginBottom: 8.w,
          mainAxisAlignment: MainAxisAlignment.center,
        );
      },
    );
  }

  void _onBannerItemClick(int index) {
    if (!Store.isLogin.value) {
      Get.toNamed(AppRoutes.LOGIN);
      return;
    }
    setState(() {
      _curIndex = index;
    });
    final banner = Store.bannerList;
    ConfigBannerRespDTO item = banner[index];
    if (item.isLink == 1) {
      if (item.linkTarget == 1) {
        // if(GetPlatform.isWeb){
        //   Get.toNamed(
        //     AppRoutes.DISCOUNT_DETAIL,
        //     parameters: {
        //       "url": ToolKit.instance.addSignatureForActivityUrl(
        //         link: item.targetUrl,
        //         type: DiscountEnum.discount,
        //       ),
        //       'title': item.bannerName,
        //     },
        //   );
        // }else{
        //   String link = ToolKit.instance.addSignatureForActivityUrl(
        //     link: item.targetUrl,
        //     type: DiscountEnum.banner,
        //   );
        //   //跳本地
        //   WebUtil.openInApp(
        //     link,
        //     title: item.bannerName,
        //     hasLoading: true,
        //   );
        // }
        String link = ToolKit.instance.addSignatureForActivityUrl(
          link: item.targetUrl,
          type: DiscountEnum.banner,
        );
        //跳本地
        WebUtil.openInApp(
          link,
          title: item.bannerName,
          hasLoading: true,
        );
      } else if (item.linkTarget == 0) {
        if (item.status == 0) {
          showToast("home_baccarat_game_is_disabled".tr);
          return;
        }
        GameLoginUtils.openH5GamPage(
          item.gameCode,
          item.venueType,
          "${item.gameId}",
          title: item.bannerName,
        );
      } else if (banner[index].linkTarget == 2) {
        //外部地址跳转浏览器
        WebUtil.openInBrowser(item.targetUrl);
      } else {
        if (GetPlatform.isWeb) {
          WebUtil.jumpToOffice();
        } else {
          WebUtil.openInApp(
            item.targetUrl,
            title: item.bannerName,
          );
        }
      }
    }
  }
}
