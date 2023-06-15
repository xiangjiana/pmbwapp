import 'package:flutter/foundation.dart';
import 'package:ob_package/widget/back_top_container.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_package/modules/home/components/home_widget/components/home_small_title.dart';
import 'package:ob_package/modules/home/home_controller.dart';
import 'package:ob_component/ob_component.dart';
import '../../home_modules/home_banner/banner_component.dart';
import '../../home_modules/home_banner/recommend_banner.dart';
import '../../home_modules/home_copyright_information/copyright_information.dart';
import '../../home_modules/home_main/main_controller.dart';
import '../../home_modules/home_marquee/marquee_component.dart';
import '../../home_modules/home_recommend/hot_recommend.dart';
import '../../home_modules/home_venue/venue_component.dart';
import 'drawer_page.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with AutomaticKeepAliveClientMixin {
  HomePageController getXController = Get.find<HomePageController>();

  @override
  void initState() {
    Get.put(MainController(Get.find()));
      WidgetsBinding.instance?.addPostFrameCallback(
            (_) => Get.find<MainController>().context = context,
      );
    // int showCaseNum = SpUtil.getInt('showCaseNum',)!;
    // if(showCaseNum<3){
    //   SpUtil.putInt('showCaseNum', ++showCaseNum);
    //   WidgetsBinding.instance?.addPostFrameCallback(
    //         (_) => ShowCaseWidget.of(context)
    //         .startShowCase([Get.find<MainController>().one,]),
    //   );
    //   Future.delayed(Duration(seconds: 4), () {
    //     ShowCaseWidget.of(context).dismiss();
    //   });
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final child = Scaffold(
      drawerEnableOpenDragGesture: false,
      key: getXController.drawerKey,
      drawer: const DrawerPage(),
      backgroundColor: Get.theme.backgroundColor,
      body: Column(
        children: [
          DownloadTip(),
          HomeSmallTitle(getXController.drawerKey),
          ///这里
          Expanded(child:  SingleChildScrollView(
            controller: getXController.singleChildScrollViewScrollController,
            child: Column(
              children: [
                MarqueeComponent(),
                RecommendBanner(),
                HotRecommend(),
                VenueComponent(),
                BannerComponent(),
                CopyrightInformation(getXController.singleChildScrollViewScrollController),
              ],
            ),
          ))




        ],
      ),
    );
    // 只处理Android 平台 ios避免提示消息
    if (GetPlatform.isAndroid&&!kIsWeb) {
      return DoubleTapExit(
        child: child,
        onIntercept: () {
          showToast('operate_again_to_exit_the_app'.tr);
        },
      );
    } else {
      return child;
    }
  }

  //收藏页跳转回调
  void routeEventFunction() {}





  @override
  bool get wantKeepAlive => true;
}
