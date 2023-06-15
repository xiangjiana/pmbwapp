import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

import '../../../widget/enter_game_button.dart';
import '../../game/collect_widget.dart';
import '../home_main/main_controller.dart';

class HotRecommend extends StatefulWidget {
  const HotRecommend({Key? key}) : super(key: key);

  @override
  State<HotRecommend> createState() => _HotRecommendState();
}

class _HotRecommendState extends State<HotRecommend> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        id: "queryRecommendVenueGameList",
        builder: (logic) {
          List<Widget> pages = [];
          int listSize = logic.recommendVenueGameLists.length;
          List<MyCollectionGameListRecord> list = logic.recommendVenueGameLists;
          int toIndex = 3;
          for (int i = 0; i < list.length; i += 3) {
            if (i + 3 > listSize) {
              //作用为toIndex最后没有3条数据则剩余几条newList中就装几条
              toIndex = listSize - i;
            }
            List<MyCollectionGameListRecord> newList =
                list.sublist(i, i + toIndex);
            List<Widget> widgets = [];
            for (int i = 0; i < newList.length; i++) {
              widgets.add(GestureDetector(
                onTap: () {
                  bool isWeihu = newList[i].status == 2;
                  if (isWeihu) {
                    Widget alert = ObDialog.alert(
                      title: 'alert'.tr,
                      content:
                          'this_game_is_under_maintenance_please_select_another_game'
                              .tr,
                      confirmText: 'confirm'.tr,
                      onConfirmListener: () {
                        Get.back();
                      },
                    );
                    OBDialogUtil.show(
                      kIsWeb ? PointerInterceptor(child: alert) : alert,
                    );
                    return;
                  }
                  EnterGameButton.joinGame(
                    false,
                    newList[i].venueCode,
                    newList[i].venueTypeCode,
                    newList[i].gameId,
                    newList[i].venueName,
                  );
                },
                child: Container(
                  color: Color(0xff2A2C32),
                  margin:
                      EdgeInsets.only(right: newList.length == 3 ? 0 : 15.w),
                  width: 104.w,
                  height: 164.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: ObImage.network(
                          newList[i].iconUrl,
                          width: 104.w,
                          height: 106.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6.w, left: 6.w),
                        child: Text(
                          newList[i].gameName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xff94A2B0),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 7.w, left: 4.w),
                            child: Container(
                              width: 60.w,
                              height: 24.w,
                              alignment: Alignment.center,
                              child: Text(
                                "just_game".tr,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600),
                              ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    Assets.images.hotRecommendBtn.path,
                                    package: BaseX.pkg,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          GetBuilder<MainController>(
                              id: i,
                              builder: (logic) {
                                return Padding(
                                  padding: EdgeInsets.only(top: 7.w),
                                  child: CollectWidget(
                                    collectStatus: newList[i].collectStatus,
                                    index: i,
                                    callback: (int collectStatus) {
                                      newList[i].collectStatus = collectStatus;
                                      logic.update([i]);
                                    },
                                    gameId: int.parse(newList[i].gameId),
                                  ),
                                );
                              })
                        ],
                      )
                    ],
                  ),
                ),
              ));
            }
            pages.add(Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: newList.length == 3
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.start,
                children: widgets,
              ),
            ));
          }
          return logic.recommendVenueGameLists.isEmpty?SizedBox():Padding(
            padding: EdgeInsets.only(top: 8.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "popular_recommendations".tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (pageController.page == 0) {
                                return;
                              }
                              pageController.previousPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.linear);
                            },
                            child: pkObImage(Assets.images.leftBtn.path,
                                width: 24.w, height: 24.w),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (pageController.page == pages.length - 1) {
                                return;
                              }
                              pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.linear);
                            },
                            child: pkObImage(
                              Assets.images.rightBtn.path,
                              width: 24.w,
                              height: 24.w,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 164.w,
                  margin: EdgeInsets.only(top: 16.w),
                  child: PageView(
                    controller: pageController,
                    children: pages,
                  ),
                )
              ],
            ),
          );
        });
  }
}
