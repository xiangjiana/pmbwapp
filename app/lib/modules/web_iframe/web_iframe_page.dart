import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' show ObDialog;
import 'package:ob_package/modules/web_iframe/web_iframe_page_controller.dart';
import 'package:ob_package/widget/enter_game_button.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import '../home_modules/home_main/main_controller.dart';
import 'components/gradient_linear_progress_bar.dart';
import 'package:ob_com_http/src/gen/mod/main/game_queryMerchantList_post_resp_model.dart';

class WebIframePage extends StatefulWidget {
  const WebIframePage({
    Key? key,
  }) : super(key: key);

  @override
  State<WebIframePage> createState() => _WebIframePageState();
}

class _WebIframePageState extends State<WebIframePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    WebIframePageController controller = Get.find<WebIframePageController>();
    controller.animationController = AnimationController(
        vsync: this, upperBound: 0.9, duration: const Duration(seconds: 10));
    controller.animationController!.forward();
    controller.animationController!.addListener(() {
      controller.progeess.value = controller.animationController!.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WebIframePageController>(
      builder: (controller) => Scaffold(
        body: Obx(() => Container(
              decoration: BoxDecoration(
                color: Color(0xff151E25),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      (controller.gameTypeIndex.value == -1 || controller.gameCodeBgMap[controller
                              .gameTypeList[controller.gameTypeIndex.value]
                              .venueTypeCode]!=null)
                          ? Assets.images.venue.cgJumpDianzi.path
                          : controller.gameCodeBgMap[controller
                              .gameTypeList[controller.gameTypeIndex.value]
                              .venueTypeCode]!,
                      package: BaseX.pkg),
                ),
              ),
              child: Stack(
                children: [
                  HtmlElementView(viewType: controller.viewId),
                  _electronicGames(controller),
                  _topArea(controller),
                  _fullscreenRestore(controller),
                ],
              ),
            )),
      ),
    );
  }

  //电子游戏的网格列表
  Widget _electronicGames(WebIframePageController controller) {
    return Obx(() => (controller.gameTypeIndex.value != -1 &&
            controller.gameTypeList[controller.gameTypeIndex.value]
                    .venueTypeCode ==
                'dy' &&
            controller.dyGameList.length > 0)
        ? PointerInterceptor(
            child: Container(
                width: 1.sw,
                height: 1.sh,
                color: ObTheming.scaffoldBackgroundColor,
                child: Column(
                  children: [
                    ObTheme(
                        child: AppBar(
                      backgroundColor: Get.theme.backgroundColor,
                      centerTitle: false,
                      title: Text(controller.dyGameVenueName.value),
                      leading: ObBackButton(),
                    )),
                    Expanded(
                      child: GridView.builder(
                          padding: EdgeInsets.only(
                              left: 20.w,
                              right: 20.w,
                              top: 16.w,
                              bottom: 16.w +
                                  (kIsWeb
                                      ? 0
                                      : MediaQuery.of(context).padding.bottom)),
                          itemCount: controller.dyGameList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 15.w,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15.w,
                                  childAspectRatio: 164 / 210),
                          itemBuilder: (BuildContext context, int index) {
                            /// status状态(0已禁用,1开启中,2维护中)
                            bool isWeihu =
                                controller.dyGameList[index].status == 2;

                            ///dy=ob电子，此处写死
                            return InkWell(
                              onTap: () {
                                if (isWeihu) {
                                  OBDialogUtil.show(
                                    PointerInterceptor(
                                        child: ObDialog.alert(
                                      title: 'alert'.tr,
                                      content:
                                          'this_game_is_under_maintenance_please_select_another_game'
                                              .tr,
                                      confirmText: 'confirm'.tr,
                                      onConfirmListener: () {
                                        Get.back();
                                      },
                                    )),
                                  );
                                  return;
                                }
                                controller.loginGame(
                                  controller.dyGameList[index].venueCode,
                                  'dy',
                                  gameId: controller.dyGameList[index].gameId
                                      .toString(),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 164.w,
                                      height: 204.w,
                                      decoration: BoxDecoration(
                                        color: Color(0xff222B31),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        children: [
                                          ObImage.network(
                                            '${controller.dyGameList[index].iconUrl}',
                                            width: 164.w,
                                            height: 164.w,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, object, stack) {
                                              return Container(
                                                width: 164.w,
                                                height: 164.w,
                                                alignment: Alignment.center,
                                                child: ObImage.asset(
                                                  Assets.images.venue
                                                      .venueDefaultBg.path,
                                                  fit: BoxFit.fitWidth,
                                                  width: 80.w,
                                                  height: 82.w,
                                                  // color: Color(0xFF000000),
                                                ),
                                              );
                                            },
                                          ),
                                          Spacer(),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                  child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10.w),
                                                child: Text(
                                                  "${controller.dyGameList[index].gameName}",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14),
                                                ),
                                              )),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 10.w, right: 10.w),
                                                decoration: BoxDecoration(
                                                    color: isWeihu
                                                        ? Colors.white30
                                                        : null,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    gradient: isWeihu
                                                        ? null
                                                        : LinearGradient(
                                                            //渐变位置
                                                            begin: Alignment
                                                                .centerLeft, //右上
                                                            end: Alignment
                                                                .centerRight, //左下
                                                            colors: [
                                                                ColorName
                                                                    .colorMain,
                                                                ColorName
                                                                    .colorMain,
                                                              ])),
                                                padding: EdgeInsets.only(
                                                    top: 2.w,
                                                    bottom: 3.w,
                                                    left: 9.55.w,
                                                    right: 9.55.w),
                                                child: Text(
                                                  isWeihu
                                                      ? "maintain".tr
                                                      : "game_join".tr,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.w,
                                          )
                                        ],
                                      ),
                                    ),
                                    controller.dyGameList[index].iconStatus !=
                                                1 &&
                                            controller.dyGameList[index]
                                                    .iconStatus !=
                                                2 &&
                                            controller.dyGameList[index]
                                                    .iconStatus !=
                                                3
                                        ? SizedBox()
                                        : ObImage.asset(
                                            controller.dyGameList[index]
                                                        .iconStatus ==
                                                    1
                                                ? Assets
                                                    .images
                                                    .icon
                                                    .classificationRecommend
                                                    .path
                                                : controller.dyGameList[index]
                                                            .iconStatus ==
                                                        2
                                                    ? Assets.images.icon
                                                        .classificationHot.path
                                                    : controller
                                                                .dyGameList[
                                                                    index]
                                                                .iconStatus ==
                                                            3
                                                        ? Assets
                                                            .images
                                                            .icon
                                                            .classificationNewTour
                                                            .path
                                                        : '',
                                            width: 34.w,
                                            height: 16.w,
                                          ),
                                    isWeihu
                                        ? Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 164.w,
                                              height: 164.w,
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ObImage.asset(
                                                    Assets.images.icon
                                                        .gameWeixiu.path,
                                                    width: 24.w,
                                                    height: 24.w,
                                                  ),
                                                  SizedBox(
                                                    height: 4.w,
                                                  ),
                                                  Text(
                                                    'search_in_maintenance'.tr,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        : SizedBox()
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                )),
          )
        : Container());
  }

  //全屏后取消全屏的小箭头
  Widget _fullscreenRestore(WebIframePageController controller) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: 300),
        top: controller.fullscreen.value ? 0 : -23.w,
        left: controller.gameCode.value == 'imone-sb'
            ? 0.75.sw - 23.w
            : 0.5.sw - 23.w,
        child: controller.isInTopPage.value
            ? PointerInterceptor(
                child: GestureDetector(
                  onTap: controller.toogleFullscreen,
                  child: Container(
                    width: 46.w,
                    height: 22.w,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.3),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5.w),
                          bottomRight: Radius.circular(5.w),
                        )),
                    child: ObImage.asset(
                      Assets.images.icon.homeMoreDown.path,
                      width: 16.w,
                      height: 16.w,
                    ),
                  ),
                ),
              )
            : SizedBox(
                width: 0,
                height: 0,
              ),
      ),
    );
  }

  Widget _topArea(WebIframePageController controller) {
    return Obx(
      () => AnimatedPositioned(
        left: 0,
        top: controller.fullscreen.value ? -300 : 0,
        duration: const Duration(milliseconds: 600),
        child: controller.isInTopPage.value
            ? PointerInterceptor(
                child: Container(
                  width: 1.sw,
                  color: const Color(0xff151E25),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _topbar(controller),
                      _progress(controller),
                      if (controller.gameTypeIndex.value != -1)
                        _gameCates(controller),
                      if (controller.gameTypeIndex.value != -1)
                        _games(controller)
                    ],
                  ),
                ),
              )
            : const SizedBox(
                width: 0,
                height: 0,
              ),
      ),
    );
  }

  //游戏列表
  Widget _games(WebIframePageController controller) {
    return Obx(
      () => controller.showGames.value
          ? AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: 1.sw,
              height: 120.w,
              color: Color(0xff151E25),
              padding: EdgeInsets.only(
                  left: 16.w, top: 18.w, right: 0, bottom: 18.w),
              child: Obx(
                () => ListView(
                  scrollDirection: Axis.horizontal,
                  children: controller
                      .gameTypeList[controller.gameTypeIndex.value].venueList
                      .map((e) => _game(e, controller))
                      .toList(),
                ),
              ),
            )
          : Container(),
    );
  }

  Widget _game(Venue gameData, WebIframePageController controller) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          Get.find<MainController>().updateVenue(gameData.venueType,gameData.venueCode);
          if (gameData.venueType == 'dy') {
            if (controller
                    .findVenue(gameData.venueCode, gameData.venueType)
                    ?.status ==
                2) {
              OBDialogUtil.show(
                PointerInterceptor(
                    child: ObDialog.alert(
                  title: 'alert'.tr,
                  content:
                      'this_game_is_under_maintenance_please_select_another_game'
                          .tr,
                  confirmText: 'confirm'.tr,
                  onConfirmListener: () {
                    Get.back();
                  },
                )),
              );
              return;
            }
            controller.dyGameVenueName.value=gameData.venueName;
            controller.gameCode.value=gameData.venueCode;
            controller.getGameListByVenueCode(gameData.venueCode);
          } else {
            controller.loginGame(gameData.venueCode, gameData.venueType);
          }
        },
        child: Container(
            width: 104.w,
            height: 90.w,
            margin: EdgeInsets.only(right: 12.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
                color: Color(0xff151E25),
                border: Border.all(
                    color: gameData.venueCode == controller.gameCode.value
                        ? Colors.white
                        : Colors.transparent,
                    width: 1),
                image: DecorationImage(
                    image: NetworkImage(gameData.venueTransferIconUrlApp),
                    fit: BoxFit.fill)),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                Positioned(
                  child: Container(
                      width: 52.w,
                      height: 90.w,
                      child: Text(
                        gameData.venueName,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                  top: 8.w,
                  left: 9.w,
                ),
                gameData.status == 2
                    ? Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
                          color: Colors.black.withOpacity(0.3),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ObImage.asset(
                              Assets.images.icon.gameWeixiu.path,
                              width: 24.w,
                              height: 24.w,
                            ),
                            SizedBox(
                              height: 4.w,
                            ),
                            Text(
                              'search_in_maintenance'.tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none),
                            )
                          ],
                        ),
                      )
                    : SizedBox()
              ],
            )),
      ),
    );
  }

  //游戏分类列表
  Widget _gameCates(WebIframePageController controller) {
    return Container(
      width: 1.sw,
      height: 44.w,
      color: Color(0xff151E25),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
      child: ListView(
          scrollDirection: Axis.horizontal,
          controller: controller.gameCatesScrollController,
          children: controller.gameTypeList
              .where((e) => e.venueList.length > 0)
              .map(
                (e) => _gameCate(controller, e),
              )
              .toList()),
    );
  }

  //游戏分类，是否选中，是否展开
  Widget _gameCate(WebIframePageController controller, VenueTypeCodeAndVenues gameTypeData) {
    bool selected = controller.gameTypeList.indexOf(gameTypeData) ==
        controller.gameTypeIndex.value;
    return GestureDetector(
      onTap: () {
        controller.toogleShowGames(gameTypeData);
      },
      child: Container(
        height: 28.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 12.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.04),
            border: Border.all(
              color:
                  selected ? Color(0xff3BC117) : Colors.white.withOpacity(0.04),
            )),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            selected
                ? ColorFiltered(
                    colorFilter:
                        ColorFilter.mode(Color(0xff3BC117), BlendMode.modulate),
                    child: ObImage.asset(
                      controller.gameCodeIconMap[gameTypeData.venueTypeCode] ??
                          "",
                      width: 16.w,
                      height: 16.w,
                    ),
                  )
                : ObImage.asset(
                    controller.gameCodeIconMap[gameTypeData.venueTypeCode] ??
                        "",
                    width: 16.w,
                    height: 16.w,
                  ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              gameTypeData.venueList.length > 0
                  ? gameTypeData.venueList[0].venueTypeName
                  : "",
              style: TextStyle(
                  color: selected
                      ? Color(0xff3BC117)
                      : Colors.white.withOpacity(0.6),
                  fontSize: 12.w),
            ),
            if (selected)
              Obx(
                () => RotatedBox(
                  child: ObImage.asset(
                    Assets.images.gameCateSelected.path,
                    width: 16.w,
                    height: 16.w,
                  ),
                  quarterTurns: controller.showGames.value ? 0 : 2,
                ),
              ),
          ],
        ),
      ),
    );
  }

  //进度条
  Widget _progress(WebIframePageController controller) {
    return Obx(() => controller.progeessShow.value
        ? GradientLinearProgressBar(
            strokeWidth: 2.w,
            colors: [
              Color(0xff3BC117),
              Color(0xff3BC117),
            ],
            backgroundColor: Color.fromRGBO(93, 97, 105, 1),
            value: controller.loaded.value ? 1 : controller.progeess.value,
          )
        : Container());
  }

  Widget _topbar(WebIframePageController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 44.w,
      color: const Color(0xff151E25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              OBDialogUtil.show(
                PointerInterceptor(
                    child: ObDialog.alert(
                  title: 'alert'.tr,
                  content: "confirm_exit_game".tr,
                  confirmText: "confirm".tr,
                  cancelText: "cancel".tr,
                  onConfirmListener: () {
                    controller.animationController?.dispose();
                    Get.back();
                    Get.back();
                  },
                  onCancelListener: () {
                    Get.back();
                  },
                )),
              );
            },
            child: ObImage.asset(
              Assets.images.comCloseWhite.path,
              width: 26.w,
              height: 26.w,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          SizedBox(
            width: 150.w,
            child: Text(
              controller.gameName.value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () async {
              controller.isInTopPage.value = false;
              await Get.toNamed(AppRoutes.TRANSFER);
              controller.isInTopPage.value = true;
              Future.delayed(const Duration(milliseconds: 100), () {
                controller.setGameTopToolsZIndexAndPosition();
              });
            },
            child: ObImage.asset(
              Assets.images.comAccount.path,
              width: 24.w,
              height: 24.w,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          if (!controller.runWaterHide.value)
            GestureDetector(
              onTap: controller.showRunWater,
              child: ObImage.asset(
                Assets.images.icon.comRunningWater.path,
                width: 24.w,
                height: 24.w,
              ),
            ),
          if (!controller.runWaterHide.value)
            const SizedBox(
              width: 10,
            ),
          GestureDetector(
            onTap: controller.refresh,
            child: ObImage.asset(
              Assets.images.comRefresh.path,
              width: 24.w,
              height: 24.w,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: controller.toogleFullscreen,
            child: ObImage.asset(
              Assets.images.comFullscreen.path,
              width: 24.w,
              height: 24.w,
            ),
          ),
        ],
      ),
    );
  }
}
