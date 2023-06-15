import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ob_com_base/ob_com_base.dart';

import '../../../widget/enter_game_button.dart';
import '../../home_modules/home_user/user_controller.dart';
import '../../settings/lang_setting/lang_setting_controller.dart';
import '../home_controller.dart';

class DrawerPage extends StatefulWidget {

  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery
                .of(context)
                .padding
                .top,
          ),
          Container(
            height: 49.w,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, right: 4.w),
                      child: pkObImage(Assets.images.leftMenu.path,
                          height: 32.w, width: 24.w, fit: BoxFit.fill),
                    ),
                    pkObImage(Assets.images.pmLogo.path,
                        height: 30.w, width: 101.w, fit: BoxFit.fitHeight),
                  ],
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 49.w,
                    padding: EdgeInsets.only(right: 16.w, left: 16.w),
                    child: UnconstrainedBox(
                      child: pkObImage(Assets.images.closeDrawer.path,
                          height: 16.w, width: 16.w, fit: BoxFit.fitHeight),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              width: 1.sw, height: 1.w, color: Colors.white.withAlpha(10)),
          Expanded(
              child: SingleChildScrollView(
                child: Obx(() {
                  return Column(
                    children: [
                      _buildWidget(
                          topMargin: 17.5.w,
                          topTorderRadius: true,
                          iconPath: Assets.images.recommendItemIcon.path,
                          text: "recommended_for_you".tr,
                          onTap: () {
                            Get.toNamed(AppRoutes.My_Collection, arguments: {
                              "type": 2
                            });
                          }),
                      Obx(() {
                        return _buildWidget(
                            topTorderRadius: true,
                            iconPath: Assets.images.subtractItemIcon.path,
                            text: "my_collection".tr,
                            disTap: !Get
                                .find<UserController>()
                                .isLogin
                                .value,
                            onTap: () {
                              if (Store.isLogin.value) {
                                Get.toNamed(
                                    AppRoutes.My_Collection, arguments: {
                                  "type": 0
                                });
                              } else {
                                Get.toNamed(AppRoutes.LOGIN,
                                    arguments: {});
                              }
                            });
                      }),
                      Obx(() {
                        return _buildWidget(
                            disTap: !Get
                                .find<UserController>()
                                .isLogin
                                .value,
                            topTorderRadius: true,
                            iconPath: Assets.images.recentlyItemIcon.path,
                            text: "recent_games".tr,
                            onTap: () {
                              if (Store.isLogin.value) {
                                Get.toNamed(
                                    AppRoutes.My_Collection, arguments: {
                                  "type": 1
                                });
                              } else {
                                Get.toNamed(AppRoutes.LOGIN,
                                    arguments: {});
                              }
                            });
                      }),
                      _buildWidget(
                          topMargin: 7.5.w,
                          topTorderRadius: true,
                          bottomTorderRadius: true,
                          iconPath: Assets.images.tyItemIcon.path,
                          text: "discount_sports".tr,

                          ///体育
                          onTap: () {
                            Get.toNamed(AppRoutes.GAME_GRID, parameters: {
                              "venueTypeCode": "ty",
                              "title": "discount_sports".tr
                            });
                          }),
                      _buildWidget(
                          topMargin: 2.w,
                          topTorderRadius: true,
                          bottomTorderRadius: true,
                          iconPath: Assets.images.zrItemIcon.path,
                          text: "discount_real_person".tr,
                          onTap: () {
                            Get.toNamed(AppRoutes.GAME_GRID, parameters: {
                              "venueTypeCode": "zr",
                              "title": "discount_real_person".tr
                            });
                          }),
                      _buildWidget(
                          topMargin: 2.w,
                          topTorderRadius: true,
                          bottomTorderRadius: true,
                          iconPath: Assets.images.djItemIcon.path,
                          text: "discount_gaming".tr,

                          ///电竞
                          onTap: () {
                            Get.toNamed(AppRoutes.GAME_GRID, parameters: {
                              "venueTypeCode": "dj",
                              "title": "discount_gaming".tr
                            });
                          }),


                      _buildWidget(
                          topMargin: 2.w,
                          topTorderRadius: true,
                          bottomTorderRadius: true,
                          iconPath: Assets.images.qpItemIcon.path,
                          text: "discount_chess_and_cards".tr,
                          onTap: () {
                            Get.toNamed(AppRoutes.GAME_GRID, parameters: {
                              "venueTypeCode": "qp",
                              "title": "discount_chess_and_cards".tr
                            });
                          }),

                      _buildWidget(
                          topMargin: 2.w,
                          topTorderRadius: true,
                          bottomTorderRadius: true,
                          iconPath: Assets.images.cpItemIcon.path,
                          text: "discount_lottery".tr,

                          ///彩票
                          onTap: () {
                            Get.toNamed(AppRoutes.GAME_GRID, parameters: {
                              "venueTypeCode": "cp",
                              "title": "discount_lottery".tr
                            });
                          }),


                      _buildWidget(
                          topMargin: 2.w,
                          topTorderRadius: true,
                          bottomTorderRadius: true,
                          iconPath: Assets.images.pyItemIcon.path,
                          text: "bu_yu".tr,
                          onTap: () {
                            Get.toNamed(AppRoutes.GAME_GRID, parameters: {
                              "venueTypeCode": "by",
                              "title": "bu_yu".tr
                            });
                          }),
                      _buildWidget(
                          topMargin: 2.w,
                          topTorderRadius: true,
                          bottomTorderRadius: true,
                          iconPath: Assets.images.dzItemIcon.path,
                          text: "discount_video_game".tr,

                          ///电子
                          onTap: () {
                            Get.toNamed(AppRoutes.GAME_GRID, parameters: {
                              "venueTypeCode": "dy",
                              "title": "discount_video_game".tr
                            });
                          }),
                      _buildWidget(
                          topMargin: 2.w,
                          topTorderRadius: true,
                          bottomTorderRadius: true,
                          iconPath: Assets.images.qklItemIcon.path,
                          text: "qkl".tr,
                          onTap: () {
                            Get.toNamed(AppRoutes.GAME_GRID, parameters: {
                              "venueTypeCode": "qkl",
                              "title": "qkl".tr
                            });
                          }),



                      // _buildWidget(
                      //     topMargin: 2.w,
                      //     topTorderRadius: true,
                      //     bottomTorderRadius: true,
                      //     iconPath: Assets.images.doujItemIcon.path,
                      //     text: "douji".tr,
                      //     onTap: () {
                      //       Get.toNamed(AppRoutes.GAME_GRID, parameters: {
                      //         "venueTypeCode": "wgb",
                      //         "title": "douji".tr
                      //       });
                      //     }),
                      _buildWidget(
                          topMargin: 8.w,
                          topTorderRadius: true,
                          iconPath: Assets.images.yhItemIcon.path,
                          text: "yhhd".tr,
                          isHot: true,
                          onTap: () {
                            if (Get.isRegistered<HomePageController>()) {
                              Get.back();
                              Get.find<HomePageController>().onTap(1);
                            }
                          }),
                      _buildWidget(
                          topTorderRadius: true,
                          disTap: !Get
                              .find<UserController>()
                              .isLogin
                              .value,
                          iconPath: Assets.images.jlbItemIcon.path,
                          onTap: () {
                            if (!Store.isLogin.value) {
                              Get.toNamed(AppRoutes.LOGIN,
                                  arguments: {});
                              return;
                            }
                            Get.toNamed(AppRoutes.VIP_LEVEL);
                          },
                          customWidget: Row(
                            children: [
                              Text(
                                "VIP",
                                style: TextStyle(
                                    color: Store.isLogin.value ? Color(
                                        0xffFFBF39) : Color(0xff98A7B5)
                                        .withAlpha(70),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 3.9.w,
                              ),
                              Text(
                                "jlb".tr,
                                style: TextStyle(
                                    color: Store.isLogin.value ? Colors.white : Color(0xff98A7B5)
                                        .withAlpha(70),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )),
                      _buildWidget(
                        onTap: () {
                          PublicResources.jumpToMemberServicePage();
                        },
                        bottomTorderRadius: true,
                        iconPath: Assets.images.serviceItemIcon.path,
                        text: "contact_customer_service".tr,
                      ),
                      _buildLanguageWidgets(),
                      SizedBox(
                        height: 89.w,
                      )
                    ],
                  );
                }),
              ))
        ],
      ),
    );
  }


  _buildLanguageWidgets() {
    return GetBuilder<LangSettingController>(
        init: LangSettingController(),
        builder: (controller) {
          List<Widget> widgets = [];
          for (int i = 0; i < controller.langList.length; i++) {
            widgets.add(_buildWidget(
                onTap: () {
                  if (i == 0) {
                    controller.isOpenLanguage = !controller.isOpenLanguage;
                    controller.update();
                  } else {
                    controller.choseLang(
                        controller.langList[i].langCode ?? '', i);
                    // var curItem = controller.langList.removeAt(i);
                    // controller.langList.insert(0, curItem);
                    // controller.update();
                  }
                },
                topMargin: i == 0 ? 8.w : 0,
                topTorderRadius: i == 0 ? true : false,
                iconPath: i == 0 ? Assets.images.languageItemIcon.path : '',
                bottomTorderRadius: !controller.isOpenLanguage,
                text: "${controller.langList[i].langTitle}",
                needRightIcon: i == 0 ? true : false,
                isOpen: controller.isOpenLanguage
            ));
          }
          return Column(
            children: widgets,
          );
        });
  }

  _buildWidget({
    bool topTorderRadius = false,
    bool bottomTorderRadius = false,
    String iconPath = "",
    String text = "",
    double topMargin = 0,
    bool isHot = false,
    Widget? customWidget,
    bool needRightIcon = false,
    GestureTapCallback? onTap,
    bool isOpen = false,
    bool disTap = false,
  }) {
    return iconPath.isEmpty && !isOpen ? SizedBox() : Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: topMargin),
      child: GestureDetector(
        onTap: () {
          onTap!();
        },
        child: Container(
          width: 1.sw,
          height: 36.w,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 14.w, right: 39.w),
                    child: iconPath.isEmpty ? SizedBox(
                        height: 16.w, width: 16.w
                    ) : pkObImage(iconPath,
                        height: 16.w,
                        width: 16.w,
                        fit: BoxFit.fill,
                        color: disTap ?
                        Color(0xff67707B).withAlpha(70)
                            : null),
                  ),
                  customWidget ??
                      Text(
                        text,
                        style: TextStyle(
                            color: disTap
                                ? Color(0xff98A7B5).withAlpha(70)
                                : Color(0xff98A7B5),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                ],
              ),
              isHot
                  ? Container(
                margin: EdgeInsets.only(right: 8.7.w),
                alignment: Alignment.center,
                width: 35.22.w,
                height: 16.w,
                decoration: BoxDecoration(
                    color: Color(0xffF6AB0D).withAlpha(14),
                    borderRadius: BorderRadius.all(Radius.circular(2))),
                child: Text(
                  'HOT',
                  style: TextStyle(
                      color: Color(0xffF6AB0D),
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400),
                ),
              )
                  : needRightIcon
                  ? Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: pkObImage(
                    isOpen ? Assets.images.itemDownIcon.path : Assets.images
                        .itemRightIcon.path,
                    height: 12.w, width: 12.w, fit: BoxFit.cover),
              )
                  : SizedBox()
            ],
          ),
          decoration: BoxDecoration(
            color: Color(isOpen ? 0xff191A1E : 0xff24262B),
            borderRadius: BorderRadius.only(
              topLeft:
              topTorderRadius ? Radius.circular(2) : Radius.circular(0),
              topRight:
              topTorderRadius ? Radius.circular(2) : Radius.circular(0),
              bottomLeft:
              bottomTorderRadius ? Radius.circular(2) : Radius.circular(0),
              bottomRight:
              bottomTorderRadius ? Radius.circular(2) : Radius.circular(0),
            ),
          ),
        ),
      ),
    );
  }
}
