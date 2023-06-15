import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide SizeExtension;
import 'package:ob_package/modules/game/gamegrid/game_grid_page_controller.dart';
import 'package:ob_package/widget/enter_game_button.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

import '../collect_widget.dart';

class GameGridPage extends StatefulWidget {
  const GameGridPage({super.key});

  @override
  State<GameGridPage> createState() => _GameGridPageState();
}

class _GameGridPageState extends State<GameGridPage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return GetBuilder<GameGridPageController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: Text(controller.title.value),
                backgroundColor: Color(0xff1E2024),
                centerTitle: true,
                leading: ObBackButton(),
              ),
              backgroundColor: Color(0xff24262B),
              body: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 60, left: 10, right: 10),
                    child: SingleChildScrollView(
                      controller: controller.scrollController,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _gameGrid(controller),
                          _percent(controller),
                          _loadMore(controller),
                        ],
                      ),
                    ),
                  ),
                  _filterArea(controller),
                ],
              ),
            ));
  }

  Widget _filterArea(GameGridPageController controller) {
    return Obx(
      () => Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.showFilter1.value =
                          !controller.showFilter1.value;
                      controller.venueListTempSelected.clear();
                      controller.venueListTempSelected
                          .addAll(controller.venueListSelected);
                      controller.showFilter2.value = false;
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                      color: Color(0xff1E2024),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          pkObImage(Assets.images.frame2083x.path,
                              width: 20.w, height: 20.w),
                          Text(
                            "view_all_providers".tr,
                            style: TextStyle(
                                color: Color(0xff98A7B5), fontSize: 14),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          if (controller.venueListTempSelected.isNotEmpty)
                            _numDot(controller.venueListTempSelected.length),
                          if (controller.venueListTempSelected.isNotEmpty)
                            SizedBox(
                              width: 4.w,
                            ),
                          Padding( 
                            padding: EdgeInsets.only(top: 3.w),
                            child: pkObImage(Assets.images.jiantouDown3x.path,
                                width: 12.w, height: 12.w),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.showFilter2.value =
                          !controller.showFilter2.value;
                      controller.showFilter1.value = false;
                    },
                    child: Container(
                      color: const Color(0xff1E2024),
                      padding: EdgeInsets.symmetric(
                          horizontal: 7.w, vertical: 4.w),
                      child: Row(
                        children: [
                          Text(
                            controller.orders
                                .where((e) =>
                                    e['value'] == controller.orderKey.value)
                                .toList()[0]['name'],
                            style: const TextStyle(
                                color: Color(0xff98A7B5), fontSize: 14),
                          ),
                          pkObImage(Assets.images.jiantouDown3x.path,
                              width: 12.w, height: 12.w),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (controller.showFilter1.value) filter1(controller),
            if (controller.showFilter2.value) filter2(controller),
          ],
        ),
      ),
    );
  }

  Widget filter2(GameGridPageController controller) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        decoration: const BoxDecoration(
            color: Color(0xff1E2024),
            border: Border(
                top: BorderSide(
              width: 8,
              color: Color(0xff1E2024),
            ))),
        child: Column(
            children: controller.orders
                .map((order) => GestureDetector(
                      onTap: () {
                        controller.orderKey.value = order['value'];
                        controller.showFilter1.value = false;
                        controller.showFilter2.value = false;
                        controller.refreshData();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10),
                        decoration: const BoxDecoration(
                            color: Color(0xff24262B),
                            border: Border(
                                top: BorderSide(
                              width: 6,
                              color: Color(0xff1E2024),
                            ))),
                        child: Opacity(
                          opacity: controller.orderKey.value == order['value']
                              ? 1 
                              : .6,
                          child: Row( 
                            children: [ 
                              pkObImage(order['iconAssetPath'],
                                  width: 20, height: 20),
                              SizedBox(width: 10.w,),
                              Text(
                                order['name'],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList()),
      ),
    );
  }

  Widget filter1(GameGridPageController controller) {
    return Obx(() {
      if (controller.venueTypeCodeAndVenues.isEmpty) {
        return Container();
      }
      return Container(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        decoration: BoxDecoration(
            color: Color(0xff1E2024),
            border: Border(
                top: BorderSide(
              width: 8,
              color: Color(0xff1E2024),
            ))),
        child: Column(children: [
          ...controller.venueTypeCodeAndVenues[0].venueList
              .map((e) => GestureDetector(
                    onTap: () {
                      if (controller.venueListTempSelected.contains(e)) {
                        controller.venueListTempSelected.remove(e);
                      } else {
                        controller.venueListTempSelected.add(e);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: const BoxDecoration(
                          color: Color(0xff24262B),
                          border: Border(
                              top: BorderSide(
                            width: 6,
                            color: Color(0xff1E2024),
                          ))),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                  color: const Color(0xff98A7B5),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Checkbox(
                                value: controller.venueListTempSelected
                                        .indexOf(e) >=
                                    0,
                                onChanged: (v) {
                                  if (controller.venueListTempSelected
                                          .indexOf(e) >=
                                      0) {
                                    controller.venueListTempSelected.remove(e);
                                  } else {
                                    controller.venueListTempSelected.add(e);
                                  }
                                },
                                fillColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Color(0xff5819CD);
                                  }
                                  return Color(0xff98A7B5);
                                }),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            e.venueName,
                            style: const TextStyle(
                                color: Color(0xff98A7B5), fontSize: 14),
                          ),
                          const Spacer(),
                          _numDot(e.venueCodeNumber.toInt(),
                              bgColor:
                                  controller.venueListTempSelected.contains(e)
                                      ? const Color.fromARGB(255, 255, 92, 0)
                                      : const Color(0xffaaaaaa)),
                        ],
                      ),
                    ),
                  ))
              .toList(),
          SizedBox(
            height: 10.w,
          ),
          Row(
            children: [
              Expanded(
                  child: OBasePrimaryButton(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                  image: DecorationImage(
                    image:
                        AssetImage(Assets.images.btnbg3.path, package: BaseX.pkg),
                    fit: BoxFit.fill, 
                  ),
                ),
                child: Text("chognzhi".tr),
                onPressed: () {
                  controller.venueListTempSelected.clear();
                  controller.venueListSelected.clear();
                  controller.showFilter1.value = false;
                  controller.refreshData();
                },
              )),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                  child: OBasePrimaryButton(
                  image: DecorationImage(
                    image:
                        AssetImage(Assets.images.btnbg2.path,package: BaseX.pkg),
                    fit: BoxFit.fill, 
                  ),
                child: Text("confirm".tr),
                onPressed: () {
                  controller.venueListSelected.clear();
                  controller.venueListSelected
                      .addAll(controller.venueListTempSelected);
                  controller.refreshData();
                  controller.showFilter1.value = false;
                },
              )),
            ],
          )
        ]),
      );
    });
  }

  Widget _numDot(int num, {Color bgColor = const Color(0xff3BC117)}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Text(
        "$num",
        style: TextStyle(color: Colors.white, fontSize: 12,height: 1),
      ),
      alignment: Alignment.center,
      constraints: BoxConstraints(minWidth: 16.w,maxHeight: 16.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16.w),
      ),
    );
  }

  Widget _gameGrid(GameGridPageController controller) {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: controller.list.length,
            
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10.w,
                crossAxisCount: 3,
                mainAxisSpacing: 5.w, 
                childAspectRatio: .76),
            itemBuilder: (BuildContext context, int index) {
              return _game(controller,controller.list[index], index);
            }),
      ),
    );
  }

  Widget _game(GameGridPageController controller,MyCollectionGameListRecord configGame, int index) {
    /// status状态(0已禁用,1开启中,2维护中)
    bool isWeihu = configGame.status == 2;
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
          configGame.status == 2,
          configGame.venueCode,
          configGame.venueTypeCode,
          configGame.gameId.toString(),
          configGame.gameName,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.hardEdge,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff1E2024),
                  ),
                  child: ObImage.network(configGame.iconUrl,
                      width: 110.w, height: 110.w),
                ),
                iconImage(configGame.iconStatus.toInt()),
                isWeihu
                    ? Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 110.w,
                          height: 110.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
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
                        ),
                      )
                    : SizedBox(),
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
                      configGame.gameName,
                      style: const TextStyle(
                          color: Color(0xff94A2B0), fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  SizedBox(width: 3.w,),
                  CollectWidget(
                      collectStatus: configGame.collectStatus.toInt(),
                      index: index,
                      gameId: int.tryParse(configGame.gameId) ?? 0,
                      callback: (collectStatus) {
                        configGame.collectStatus = collectStatus;
                        controller.update();
                      }),
                ],
              ),
            )
          ],
        ),
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

  Widget _percent(GameGridPageController controller) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${controller.list.length}/${controller.total.value}",
              style: TextStyle(color: Color(0xff98A7B5), fontSize: 12),
            ),
            SizedBox(
              width: 3,
            ),
            SizedBox(
              height: 2,
              width: 70,
              child: LinearProgressIndicator(
                value: controller.total.value == 0
                    ? 1
                    : controller.list.length / controller.total.value,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Color(0xff00D114)),
              ),
            ),
            SizedBox(
              width: 3,
            ),
            if (controller.total.value != 0)
              Text(
                "${((controller.list.length / controller.total.value) * 100).toInt()}%",
                style: TextStyle(color: Color(0xff98A7B5), fontSize: 12),
              ),
          ],
        ),
      ),
    );
  }

  Widget _loadMore(GameGridPageController controller) {
    return UnconstrainedBox(
      child: Obx(
        () {
          bool allLoaded = controller.list.length == controller.total.value;
          return GestureDetector(
            onTap: () async {
              //第二次加载的时候连续请求3次，每次分页=4，也就是加载12条，因为要从第28条开始加载，只能这样，需求如此
              await controller.fetchData();
              await controller.fetchData();
              await controller.fetchData();
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
          );
        },
      ),
    );
  }
}
