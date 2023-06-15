import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide SizeExtension, ObTheme;
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../widget/enter_game_button.dart';
import '../../home_modules/home_main/main_controller.dart';
import '../collect_widget.dart';
import 'logic.dart';

class MyCollectionPage extends StatelessWidget {
  final logic = Get.find<MyCollectionLogic>();

  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: GetBuilder<MyCollectionLogic>(builder: (logic) {
        return Scaffold(
          appBar: AppBar(
            title: ObNavigationBarTitle(logic.state.type == 0
                ? 'my_collection'.tr
                : logic.state.type == 1
                    ? "recent_games".tr
                    : "recommended_for_you".tr),
            leading: ObBackButton(),
            actions: [],
          ),
          body: logic.state.myCollectionGameListRecord == null
              ? Container(
                  color: ColorName.white.withOpacity(0.0),
                  width: 1.sw,
                  height: 1.sh,
                  child: PlaceholderLoading(
                    alignment: Alignment.topCenter,
                  ),
                )
              : logic.state.myCollectionGameListRecord!.isEmpty
                  ? Center(
                      child: EmptyView(),
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20, left: 0, right: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.only(left: 20, right: 10),
                                itemCount: logic
                                    .state.myCollectionGameListRecord!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        childAspectRatio: .76),
                                itemBuilder: (BuildContext context, int index) {
                                  return _game(
                                      logic,
                                      logic.state
                                          .myCollectionGameListRecord![index],
                                      index);
                                }),
                    if(logic.state.type != 0)        _percent(logic),
                            if(logic.state.type != 0)         Center(child: _loadMore(logic)),
                            SizedBox(
                              height: ScreenUtil().bottomBarHeight + 15.w,
                            )
                          ],
                        ),
                      ),
                    ),
        );
      }),
    );
  }

  Widget _game(MyCollectionLogic controller, MyCollectionGameListRecord record,
      int index) {
    /// status状态(0已禁用,1开启中,2维护中)
    bool isWeihu = record.status == 2;
    return GestureDetector(
      onTap: () {
        if (isWeihu) {
          Widget alert = ObDialog.alert(
            title: 'alert'.tr,
            content:
                'this_game_is_under_maintenance_please_select_another_game'.tr,
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
          record.status == 2,
          record.venueCode,
          record.venueTypeCode,
          record.gameId.toString(),
          record.gameName,
        );
      },
      child: ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Container(
                        color: Color(0xff1E2024),
                        child: ObImage.network(record.iconUrl,
                            width: 110.w, height: 110.w),
                      ),
                      iconImage(record.iconStatus)
                    ],
                  ),
                  Container(
                    width: 110.w,
                    height: 30,
                    padding: EdgeInsets.only(left: 5, top: 3, bottom: 2),
                    color: Color(0xff1E2024),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 75.w,
                          child: Text(
                            record.gameName,
                            style: const TextStyle(
                                color: Color(0xff94A2B0), fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        SizedBox(width: 3.w,),
                        CollectWidget(
                            collectStatus: record.collectStatus.toInt(),
                            index: index,
                            gameId: int.parse(record.gameId),
                            callback: (collectStatus) {
                              if (logic.state.type == 0) {
                                logic.state.myCollectionGameListRecord!
                                    .removeAt(index);
                                controller.state.total--;
                              } else {
                                logic.state.myCollectionGameListRecord![index]
                                    .collectStatus = collectStatus;
                              }
                              logic.update();
                              Get.findOrNull<MainController>()
                                  ?.queryRecommendVenueGameList();
                            }),
                      ],
                    ),
                  )
                ],
              ),
              isWeihu
                  ? Container(
                      width: 110.w,
                      height: 110.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(2),
                          topRight: Radius.circular(2),
                        ),
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
                  : SizedBox(),
            ],
          )),
    );
  }

  Widget _percent(MyCollectionLogic controller) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${controller.state.myCollectionGameListRecord!.length}/${controller.state.total}",
            style: TextStyle(color: Color(0xff98A7B5), fontSize: 12),
          ),
          SizedBox(
            width: 3,
          ),
          SizedBox(
            height: 2,
            width: 70,
            child: LinearProgressIndicator(
              value: controller.state.total == 0
                  ? 1
                  : controller.state.myCollectionGameListRecord!.length /
                      controller.state.total,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Color(0xff00D114)),
            ),
          ),
          SizedBox(
            width: 3,
          ),
          if (controller.state.total != 0)
            Text(
              "${((controller.state.myCollectionGameListRecord!.length / controller.state.total) * 100).toInt()}%",
              style: TextStyle(color: Color(0xff98A7B5), fontSize: 12),
            ),
        ],
      ),
    );
  }

  Widget iconImage(int iconStatus) {
    return iconStatus != 1 && iconStatus != 2 && iconStatus != 3
        ? SizedBox()
        : ObImage.asset(
            iconStatus == 1
                ? Assets.images.icon.classificationRecommend.path
                : iconStatus == 2
                    ? Assets.images.icon.classificationHot.path
                    : iconStatus == 3
                        ? Assets.images.icon.classificationNewTour.path
                        : '',
            width: 34.w,
            height: 16.w,
          );
  }

  Widget _loadMore(MyCollectionLogic controller) {
    bool allLoaded = controller.state.myCollectionGameListRecord!.length ==
        controller.state.total;
    return UnconstrainedBox(
      child: GestureDetector(
        onTap: () async {
          //第二次加载的时候连续请求3次，每次分页=4，也就是加载12条，因为要从第28条开始加载，只能这样，需求如此
          await controller.queryMyCollectionGameList(isRefresh:false);
          await controller.queryMyCollectionGameList(isRefresh:false);
          await controller.queryMyCollectionGameList(isRefresh:false);
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 20, bottom: 20),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                allLoaded ? "load_all".tr : "load_more".tr,
                style: TextStyle(color: Color(0xff94A2B0), fontSize: 14),
              ),
              if (!allLoaded)
                SizedBox(
                  width: 5,
                ),
              if (!allLoaded)
                pkObImage(Assets.images.jiantouDown3x.path,
                    width: 20, height: 20),
            ],
          ),
          color: Color(0xff1E2024),
        ),
      ),
    );
  }
}
