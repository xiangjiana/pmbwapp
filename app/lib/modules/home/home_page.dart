import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/modules/home/home_controller.dart';
import '../../utils/showcaseview/src/showcase_widget.dart';
import 'components/capital/capital_page.dart';
import 'components/discount_widget.dart';
import 'components/home_widget.dart';
import 'package:ob_package/modules/home/components/controller/home_widget_auto_refresh_manager.dart';
import 'components/mine_widget_new/mine_new_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  GlobalKey globalKey = GlobalKey();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      // 应用程序可见,不可操作。
      case AppLifecycleState.inactive:
        break;
      // 应用程序可见,可操作, 前台
      case AppLifecycleState.resumed:
        HomeWidgetAutoRefreshManager.instance.startRefreshTimer();
        Store.needUpdateKeyBoardBottom = true;
        break;
      // 应用程序不可见，不可操作, 后台
      case AppLifecycleState.paused:
        Store.needUpdateKeyBoardBottom = true;
        if (Store.nativeRouting != AppRoutes.GAME) {
          HomeWidgetAutoRefreshManager.instance.cancelRefreshTimer();
        }
        break;
      // 虽然还在运行，但已经没有任何存在的界面。
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      initState: (state) {
        WidgetsBinding.instance?.addObserver(this);
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
          RenderBox renderBox =
              globalKey.currentContext!.findRenderObject() as RenderBox;
          HomePageController.bottomNavigationBarHeight =
              renderBox.paintBounds.height;
        });
      },
      dispose: (state) {
        WidgetsBinding.instance?.removeObserver(this);
      },
      builder: (HomePageController controller) {
        return Scaffold(
          body: ShowCaseWidget(
            builder: Builder(builder: (context) {
              return Stack(
                children: [
                  PageView(
                    controller: controller.pageCtrl,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      HomeWidget(),
                      if (AppMerchantUtils.loadCurMerchantBy(
                          OBModules.kPreferentialActivities))
                        DiscountWidget(),
                      const CapitalPage(
                          // isHome: true,
                          ),
                      const MineNewWidget()
                    ],
                  ),
                ],
              );
            }),
          ),
          bottomNavigationBar: Container(
            color: const Color(0xff1D2933),
            child: SafeArea(
              child: Obx(
                () => Stack(
                  children: <Widget>[
                    CustomNavigationBar(
                      key: globalKey,
                      iconSize: 24.w,
                      elevation: 0,
                      strokeColor: Get.theme.splashColor,
                      backgroundColor: const Color(0xff1D2933),
                      unSelectedColor: Colors.white60,
                      selectedColor: Colors.white,
                      items: [
                        CustomNavigationBarItem(
                            title: Text(
                              'home'.tr,
                              style: const TextStyle(
                                color: Colors.white60,
                                fontSize: 10,
                              ),
                            ),
                            selectedTitle: Text(
                              'home'.tr,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                            icon: ObImage.asset(
                              Assets.images.icon.tabHomeNor.path,
                              width: 24.w,
                            ),
                            selectedIcon: ObImage.asset(
                              Assets.images.icon.tabHomeOn.path,
                              width: 24.w,
                            )
                            // kIsWeb
                            //     ? ObImage.asset(
                            //         Assets.images.icon.tabHomeOn.path,
                            //         width: 24.w,
                            //       )
                            //     : Lottie.asset(
                            //         controller.isBackTop.value
                            //             ? Assets.lottie.top
                            //             : Assets.lottie.home,
                            //         width: 24.w,
                            //         height: 24.h,
                            //         repeat: false,
                            //         package: BaseX.pkg,
                            //       ),
                            ),
                        if (AppMerchantUtils.loadCurMerchantBy(
                            OBModules.kPreferentialActivities))
                          CustomNavigationBarItem(
                              title: Text(
                                'discount'.tr,
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 10),
                              ),
                              selectedTitle: Text(
                                'discount'.tr,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                              icon: ObImage.asset(
                                Assets.images.icon.tabDisNor.path,
                                width: 24.w,
                              ),
                              selectedIcon: ObImage.asset(
                                Assets.images.icon.tabDisOn.path,
                                width: 24.w,
                              )

                              // kIsWeb
                              //     ? ObImage.asset(
                              //         Assets.images.icon.tabDisOn.path,
                              //         width: 24.w,
                              //       )
                              //     : Lottie.asset(
                              //         Assets.lottie.discount,
                              //         width: 24.w,
                              //         height: 24.h,
                              //         repeat: false,
                              //         package: BaseX.pkg,
                              //       ),
                              ),
                        CustomNavigationBarItem(
                            title: Text(
                              'financial'.tr,
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 10),
                            ),
                            selectedTitle: Text(
                              'financial'.tr,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            icon: ObImage.asset(
                              Assets.images.icon.tabMoneyNor.path,
                              width: 24.w,
                            ),
                            selectedIcon: ObImage.asset(
                              Assets.images.icon.tabMoneyOn.path,
                              width: 24.w,
                            )),
                        CustomNavigationBarItem(
                            title: Text(
                              'mine'.tr,
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 10),
                            ),
                            selectedTitle: Text(
                              'mine'.tr,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            icon: ObImage.asset(
                              Assets.images.icon.tabMeNor.path,
                              width: 24.w,
                            ),
                            selectedIcon: ObImage.asset(
                              Assets.images.icon.tabMeOn.path,
                              width: 24.w,
                            )
                            // kIsWeb
                            //     ? ObImage.asset(
                            //         Assets.images.icon.tabMeOn.path,
                            //         width: 24.w,
                            //       )
                            //     : Lottie.asset(
                            //         Assets.lottie.mine,
                            //         width: 24.w,
                            //         height: 24.h,
                            //         repeat: false,
                            //         package: BaseX.pkg,
                            //       ),
                            ),
                      ],
                      currentIndex: controller.currentIndex.value,
                      onTap: controller.onTap,
                    ),
                    Divider(
                      height: 1.w,
                      thickness: 1.w,
                      color: Get.theme.primaryColor.withOpacity(0.1),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
