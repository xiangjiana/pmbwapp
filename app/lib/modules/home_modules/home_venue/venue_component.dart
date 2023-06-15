import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:sp_util/sp_util.dart';
import '../../../utils/showcaseview/src/showcase.dart';
import '../../../widget/enter_game_button.dart';
import '../home_main/main_controller.dart';

class VenueComponent extends StatelessWidget {
  String getChangGuanBg(String gameCode) {
    String path = "";
    switch (gameCode) {
      case "ty":
        path = Assets.images.icon.changguanTy.path;
        break;
      case "zr":
        path = Assets.images.icon.changguanZr.path;
        break;
      case 'dj':
        path = Assets.images.icon.changguanDj.path;
        break;
      case "qp":
        path = Assets.images.icon.changguanQp.path;
        break;
      case 'by':
        path = Assets.images.icon.changguanPy.path;
        break;
      case "cp":
        path = Assets.images.icon.changgaunCp.path;
        break;
      case "qkl":
        path = Assets.images.icon.obHashBg.path;
        break;
      case "dy":
        path = Assets.images.icon.obDianyouBg.path;
        break;
    }

    return path;
  }

  MainController mainController = Get.find<MainController>();

  dealBottomTap(VenueTypeCodeAndVenues data, bool isJinYon, bool isWeihu,
      MainController ctx) {
    if (isJinYon) {
      return;
    }
    EnterGameButton.joinGame(
      isWeihu,
      ctx.bottomVenueDataList[0].venueSelected!.venueCode,
      ctx.bottomVenueDataList[0].venueSelected!.venueType,
      null,
      ctx.bottomVenueDataList[0].venueSelected!.venueName,
    );
  }

  _customItem(bool isJinYon, VenueTypeCodeAndVenues venues,
      {double? width, double? height, bool isBottomCenter = false}) {
    return InkWell(
      onTap: () {
        if (!isJinYon) {
          EnterGameButton.joinGame(
            venues.venueSelected?.status == 2,
            venues.venueSelected!.venueCode,
            venues.venueSelected!.venueType,
            null,
            venues.venueSelected!.venueName,
          );
        }
      },
      onLongPress: () {
        if (!isJinYon) {
          Get.dialog(Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff1D2933),
              ),
              width: 327.w,
              height: 440.w,
              child: Column(
                children: [
                  _buildVenunTitle(),
                  Expanded(
                      child:
                          _buildVenueView(Get.find<MainController>(), venues))
                ],
              ),
            ),
          ));
        }
      },
      child: Opacity(
        opacity: isJinYon ? 0.6 : 1,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: ObImage.network('${venues.venueTypeIconUrl}',
                  width: width ?? 164.w,
                  height: height ?? 164.w,
                  fit: BoxFit.cover, errorBuilder: (
                BuildContext context,
                Object error,
                StackTrace? stackTrace,
              ) {
                return ObImage.asset(
                  getChangGuanBg(venues.venueTypeCode),
                  width: width ?? 164.w,
                  height: height ?? 164.w,
                );
              }),
            ),
            isJinYon
                ? Positioned(
                    left: isBottomCenter ? 0 : 11.w,
                    right: isBottomCenter ? 0 : null,
                    bottom: 9.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                          'is_disabled'.tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ))
                : Positioned(
                    left: isBottomCenter ? 0 : 11.w,
                    right: isBottomCenter ? 0 : null,
                    bottom: 9.w,
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 164.w / 2),
                      alignment: isBottomCenter ? Alignment.center : null,
                      child: Text(
                        _handleVenueName(
                          venues.venueSelected?.venueName ?? '',
                          venues.venueSelected?.venueTypeName ?? '',
                        ),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                Get.locale?.languageCode == 'zh' ? 16 : 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  _customWrap(List<VenueTypeCodeAndVenues> venueDataList, double top) {
    List<Widget> widgets = [];
    for (int index = 0; index < venueDataList.length; index++) {
      bool isJinYon = false;
      if (venueDataList[index].venueSelected == null) {
        isJinYon = true;
      }
      widgets.add(_customItem(
        isJinYon,
        venueDataList[index],
      ));
    }
    return Padding(
      padding: EdgeInsets.only(top: top),
      child: Wrap(spacing: 15.w, runSpacing: 15.w, children: widgets),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (ctx) {


      return Column(
        children: [
          Obx(() {
            if (ctx.venueDataList.isEmpty) {
              return const SizedBox();
            } else  {
              List<Widget> widgets =[];
              ctx.venueDataList.forEach((element) {
                bool isJinYon = false;
                if (element.venueSelected == null) {
                  isJinYon = true;
                }
                late Widget item;
                if(element.imageType==2){//大图
                  item = _customItem(isJinYon, element,
                      width: 343.w, height: 164.w);

                }else if(element.imageType==1){//中图
                  item =   _customItem(
                    isJinYon,
                    element,
                  );
                }else { ///小图
                  item =   _customItem(isJinYon, element,
                      width: 104.w, height: 164.w, isBottomCenter: true);
                }
                widgets.add(item);

              });
              return  Padding(
                padding:  EdgeInsets.only(
                    top: 24.w
                ),
                child: Wrap(spacing: 15.w, runSpacing: 15.w, children:widgets),
              );
            }
          }),
        ],
      );
    });
  }

  String _handleVenueName(String venueName, String venueTypeName) {
    // if (venueName.contains(venueTypeName)) {
    //   return '${venueName.substring(0, venueName.indexOf(venueTypeName, 0))}\n${venueName.replaceAll(venueName.substring(0, venueName.indexOf(venueTypeName, 0)), "")}';
    // }
    return venueName;
  }

  Widget _buildShowcase(Widget child) {
    String lang =
        SpUtil.getString("LanguageCode", defValue: 'zh_CN') ?? "zh_CN";
    return Showcase(
      contentOrientation: "ABOVE",
      key: mainController.one,
      descTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      description: "",
      child: child,
      costomTipWidgetWidth: _textSize(
            "long_press_to_switch_venues".tr,
            TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ).width +
          16.w +
          16.w,
      costomTipWidget: Container(
          height: 60.w,
          constraints: BoxConstraints(
            minHeight: 60.w,
            minWidth: 155.w,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Assets.images.icon.caseTipBg.path,
                package: BaseX.pkg,
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 8.w, bottom: 6.w),
          child: Row(
            children: [
              ObImage.asset(
                Assets.images.icon.selectChangguanIcon.path,
                width: 16.w,
                height: 16.w,
              ),
              Text(
                "long_press_to_switch_venues".tr,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: -0.3),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
          )),
    );
  }

  Size _textSize(String text, TextStyle style) {
    final textPainter = (TextPainter(
            text: TextSpan(text: text, style: style),
            maxLines: 1,
            textScaleFactor: MediaQuery.of(Get.context!).textScaleFactor,
            textDirection: TextDirection.ltr)
          ..layout())
        .size;
    return textPainter;
  }

  Widget _buildVenunTitle() {
    return Container(
      height: 59.w,
      width: 327.w,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 0.w),
            width: 327.w,
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Text(
              "please_select_a_fast_venue".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  decoration: TextDecoration.none),
            ),
          ),
          Positioned(
              top: 20.w,
              right: 16.w,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Get.back();
                },
                child: ObImage.asset(
                  Assets.images.icon.comCloseWhite.path,
                  width: 24.w,
                  height: 24.w,
                ),
              ))
        ],
      ),
    );
  }

  //场馆布局
  Widget _buildVenueView(MainController ctx, VenueTypeCodeAndVenues data) {
    return GridView.builder(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 16.w,
          bottom: 16.w,
        ),
        itemCount: data.venueList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 15.w,
          crossAxisCount: 3,
          mainAxisSpacing: 16.w,
          childAspectRatio: 72 / 80,
        ),
        itemBuilder: (BuildContext context, int index1) {
          bool isWeihu = data.venueList[index1].status == 2;
          bool isJinYon = data.venueList[index1].status == 0;
          return Container(
            width: 72.w,
            height: 102.w,
            child: GestureDetector(
              onTap: () async {
                if (isJinYon) {
                  return;
                }
                Get.back();
                EnterGameButton.joinGame(
                  isWeihu,
                  data.venueList[index1].venueCode,
                  data.venueList[index1].venueType,
                  null,
                  data.venueList[index1].venueName,
                );
                // 更新长按选择的场馆
                if(GetPlatform.isWeb){
                  ctx.updateVenue(data.venueList[index1].venueType,
                      data.venueList[index1].venueCode);
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 72.w,
                    height: 72.w,
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: isWeihu || isJinYon ? 0.6 : 1,
                          child: ObImage.network(
                            data.venueList[index1].venueIconUrlApp,
                            width: 72.w,
                            height: 72.w,
                          ),
                        ),
                        isWeihu || isJinYon
                            ? Center(
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
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      child: AutoSizeText(
                                        isWeihu
                                            ? 'search_in_maintenance'.tr
                                            : "is_disabled".tr,
                                        textAlign: TextAlign.center,
                                        minFontSize: 8,
                                        maxFontSize: 12,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          height: 0.9,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                  Text(
                    '${data.venueList[index1].venueName}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        height: 1.1,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _buildVenueChild(VenueTypeCodeAndVenues data, MainController ctx) {
    if (data.venueTypeCode == 'dy') {
      return Builder(builder: (context) {
        bool isJinYon = false;
        if (data.venueSelected == null) {
          isJinYon = true;
        }
        Widget? child = InkWell(
          onTap: () {
            if (!isJinYon) {
              EnterGameButton.joinGame(
                data.venueSelected?.status == 2,
                data.venueSelected!.venueCode,
                data.venueSelected!.venueType,
                null,
                data.venueSelected!.venueName,
              );
            }
          },
          onLongPress: () {
            if (!isJinYon) {
              Get.dialog(Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff1D2933),
                  ),
                  width: 327.w,
                  height: 440.w,
                  child: Column(
                    children: [
                      _buildVenunTitle(),
                      Expanded(child: _buildVenueView(ctx, data))
                    ],
                  ),
                ),
              ));
            }
          },
          child: Opacity(
            opacity: isJinYon ? 0.6 : 1,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ObImage.network('${data.venueTypeIconUrl}',
                      width: 163.5.w,
                      height: 96.w,
                      fit: BoxFit.cover, errorBuilder: (
                    BuildContext context,
                    Object error,
                    StackTrace? stackTrace,
                  ) {
                    return ObImage.asset(
                      getChangGuanBg(data.venueTypeCode),
                      width: 163.5.w,
                      height: 96.w,
                    );
                  }),
                ),
                isJinYon
                    ? Positioned(
                        left: 8.w,
                        top: 15.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                              'is_disabled'.tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ))
                    : Container(
                        padding: EdgeInsets.only(
                          top: 15.w,
                          left: 15.w,
                        ),
                        child: Text(
                          '${data.venueSelected?.venueName}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
              ],
            ),
          ),
        );
        return child;
      });
    }
    return Builder(builder: (context) {
      bool isJinYon =
          data.venueSelected == null || data.venueSelected!.status == 0;
      bool isWeihu =
          data.venueSelected != null && data.venueSelected!.status == 2;
      return GestureDetector(
        onTap: () {
          dealBottomTap(data, isJinYon, isWeihu, ctx);
        },
        child: Container(
          width: 163.5.w,
          height: 96.w,
          child: Stack(
            children: [
              Opacity(
                opacity: isWeihu || isJinYon ? 0.6 : 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ObImage.network('${data.venueTypeIconUrl}',
                      width: 163.5.w,
                      height: 96.w,
                      fit: BoxFit.cover, errorBuilder: (
                    BuildContext context,
                    Object error,
                    StackTrace? stackTrace,
                  ) {
                    return ObImage.asset(
                      getChangGuanBg(data.venueTypeCode),
                      width: 163.5.w,
                      height: 96.w,
                    );
                  }),
                ),
              ),
              (isWeihu || isJinYon)
                  ? SizedBox()
                  : Padding(
                      padding: EdgeInsets.only(
                        left: 10.w,
                        top: 20.w,
                      ),
                      child: Text(
                        '${data.venueSelected?.venueName}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
              (isWeihu || isJinYon)
                  ? Container(
                      margin: EdgeInsets.only(top: 8.w, left: 15.w),
                      alignment: Alignment.topLeft,
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
                          AutoSizeText(
                            isWeihu
                                ? 'search_in_maintenance'.tr
                                : "is_disabled".tr,
                            minFontSize: 8,
                            maxFontSize: 12,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                            ),
                          )
                        ],
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      );
    });
  }

  //场馆布局
  Widget _buildVenueBelow(MainController ctx) {
    return Obx(() {
      return ctx.bottomVenueDataList.isEmpty
          ? SizedBox()
          : Container(
              margin: EdgeInsets.only(
                top: 16.w,
                bottom: 16.w,
                left: ctx.bottomVenueDataList.length == 1 ? 20.w : 0,
              ),
              width: 1.sw,
              alignment: ctx.bottomVenueDataList.length == 1
                  ? Alignment.topLeft
                  : Alignment.topCenter,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildVenueChild(ctx.bottomVenueDataList[0], ctx),
                  SizedBox(width: 16.w),
                  ctx.bottomVenueDataList.length > 1
                      ? _buildVenueChild(ctx.bottomVenueDataList[1], ctx)
                      : SizedBox()
                ],
              ),
            );
    });
  }
}
