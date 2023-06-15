import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../widget/enter_game_button.dart';
import '../controller/electronic_games_controller.dart';

/**
 * OB电子
 */
class ElectronicGamesPage extends StatelessWidget {
  final logic = Get.put(ElectronicGamesController());
  final state = Get
      .find<ElectronicGamesController>()
      .state;

  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        appBar: AppBar(
          title: ObNavigationBarTitle("ob_e_game".tr),
          leading: ObBackButton(),
        ),
        backgroundColor: Get.theme.backgroundColor,
        body: GetBuilder<ElectronicGamesController>(
          builder: (logic) {
            return   Stack(
              children: [
                SmartRefresher(
                  enablePullDown: true,
                  onRefresh: (){
                    logic.getGameListByAssortId();
                  },
                  controller: state.listSmartRefreshCtrl,
                  child: GridView.builder(
                      padding: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                          top: 16.w,
                          bottom: 16.w+(kIsWeb?0:MediaQuery.of(context).padding.bottom)
                      ),
                      itemCount: logic.listData.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 15.w,
                          crossAxisCount: 2,
                          mainAxisSpacing: 15.w,
                          childAspectRatio: 164 / 210),
                      itemBuilder: (BuildContext context, int index) {
                        /// status状态(0已禁用,1开启中,2维护中)
                        bool isWeihu = logic.listData[index].status ==2;
                        ///dy=ob电子，此处写死
                        return InkWell(
                          onTap: (){
                            EnterGameButton.joinGame(
                              isWeihu,
                              logic.listData[index].venueCode,
                              'dy',
                              logic.listData[index].gameId.toString(),
                              logic.listData[index].gameName,
                              isGame: true
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
                                        '${logic.listData[index].iconUrl}',
                                        width: 164.w,
                                        height: 164.w,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, object, stack) {
                                          return Container(
                                            width: 164.w,
                                            height: 164.w,
                                            alignment: Alignment.center,
                                            child: ObImage.asset(
                                              Assets.images.venue.venueDefaultBg.path,
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
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.w
                                            ),
                                            child: Text("${logic.listData[index].gameName}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,

                                                  fontSize: 14),),
                                          )),

                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 10.w,
                                                right: 10.w
                                            ),
                                            decoration: BoxDecoration(
                                                color: isWeihu?Colors.white30:null,
                                                borderRadius: BorderRadius.circular(16),
                                                gradient:isWeihu?null: LinearGradient(
                                                  //渐变位置
                                                    begin: Alignment.centerLeft, //右上
                                                    end: Alignment.centerRight, //左下
                                                    colors: [
                                                      Color(0xffFF9047),
                                                      Color(0xffFF5722)
                                                    ])
                                            ),
                                            padding: EdgeInsets.only(
                                                top: 2.w,
                                                bottom: 3.w,
                                                left: 9.55.w,
                                                right: 9.55.w
                                            ),
                                            child: Text(isWeihu?"maintain".tr:"game_join".tr, style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12
                                            ),),
                                          )

                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.w,
                                      )
                                    ],
                                  ),
                                ),
                                logic.listData[index].iconStatus!=1&&logic.listData[index].iconStatus!=2&&logic.listData[index].iconStatus!=3?SizedBox(): ObImage.asset(
                                  logic.listData[index].iconStatus==1?Assets.images.icon.classificationRecommend.path:logic.listData[index].iconStatus==2?Assets.images.icon.classificationHot.path: logic.listData[index].iconStatus==3?Assets.images.icon.classificationNewTour.path:'' ,
                                  width: 34.w,
                                  height: 16.w,
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),

             !logic.state.systemLoadingShow&&logic.listData.isEmpty? Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: EmptyView(),):SizedBox(),


                Offstage(
                  offstage: !logic.state.systemLoadingShow,
                  child: Container(
                    color: ColorName.white.withOpacity(0.0),
                    width: 1.sw,
                    height: 1.sh,
                    child: PlaceholderLoading(
                      alignment: Alignment.topCenter,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
