import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:ob_package/modules/welcome/welcome_controller.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

/// 引导页
class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);
  final controller = Get.find<WelcomeController>();
  int get swiperItemCount=>(AppMerchantUtils.curMerchantTypes() == OBMerchantTypes.kMSGJ || 
          AppMerchantUtils.curMerchantTypes() == OBMerchantTypes.kVWBET) ? 4 : 5;
          
  @override
  Widget build(BuildContext context) {
    return Swiper(
      physics: ClampingScrollPhysics(),
      itemCount: swiperItemCount,
      loop: false,
      controller: controller.swiperController,
      pagination: _buildSwiperPagination(),
      itemBuilder: (BuildContext context, int index) {
        return _buildSwiperItem(index);
      },
    );
  }

  SwiperCustomPagination _buildSwiperPagination() {
    return SwiperCustomPagination(
      builder: (BuildContext context, SwiperPluginConfig config) {
        return ObCustomSwiperPagination(
          count: swiperItemCount,
          config: config,
          newstyle: true,
          alignment: Alignment(0, 0.85),
        );
      },
    );
  }

  Widget _buildSwiperItem(int index) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: Colors.white,
        decoration: TextDecoration.none,
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0XFF18202A),
              Color(0XFF181524),
              Color(0XFF161F27),
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 55.w,),
                Text(
                  getImgTitleByIndex(index),
                  style: TextStyle(color: Colors.white, fontSize: LocaleUtils.isLocale?20.w:24.w,wordSpacing: -3.w),
                ),
                SizedBox(height: 10.w,),
                Opacity(
                  opacity: 0.5,
                  child: Text(
                    getImgSubTitleByIndex(index),
                    style: TextStyle(color: Colors.white, fontSize: 14.w,wordSpacing: -1.w),
                  ),
                ),
                ObImage.asset(
                  getAssetImgPathByIndex(index),
                  width: 1.sw,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Align(
              alignment: const Alignment(0.9, -0.85),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: controller.goLogin,
                child: Container(
                  height: 24.w,
                  width: 48.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(0.2),),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withOpacity(.05)
                  ),
                  child: Text( 
                      'skip'.tr,
                      style: const TextStyle(fontSize: 12,color: Colors.white),
                    ),
                ),
              ),
            ),
            if (index == swiperItemCount - 1)
              Align(
                alignment: const Alignment(0, 0.93),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: controller.goLogin,
                  child: Container(
                    height: 30.w,
                    width: 80.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorName.colorMain,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                        'welcome_try_it_now'.tr,
                        style: const TextStyle(fontSize: 14),
                      ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
  String getAssetImgPathByIndex(int index){
    if(index==0){
      String locale = Get.locale?.languageCode ?? "en";
      if(locale=='en'){
        return Assets.welcome.guidePicEnglish013x.path;
      }else if(locale=='zh'){
        return Assets.welcome.guidePicChina013x.path;
      }else if(locale=='th'){
        return Assets.welcome.guidePicThailand013x.path;
      }else if(locale=='ms'){
        //缺少马来西亚的
        return Assets.welcome.guidePicChina013x.path;
      }else if(locale=='vi'){
        return Assets.welcome.guidePicVietnam013x.path;
      }else{
        return Assets.welcome.guidePicChina013x.path;
      }
    }else{
      return 'assets/welcome/guide_pic_0${index + 1}@3x.webp'.toPng();
    }
  }
  String getImgTitleByIndex(int index){
    String s='';
    switch (index) {
      case 0:
        s='onboardingpage1'.tr;
        break;
      case 1:
        s='onboardingpage3'.tr;
        break;
      case 2:
        s='onboardingpage5'.tr;
        break;
      case 3:
        s='onboardingpage7'.tr;
        break;
      case 4:
        s='onboardingpage9'.tr;
        break;
      default:
    }
    return s;
  }
  String getImgSubTitleByIndex(int index){
    String s='';
    switch (index) {
      case 0:
        s='onboardingpage2'.tr;
        break;
      case 1:
        s='onboardingpage4'.tr;
        break;
      case 2:
        s='onboardingpage6'.tr;
        break;
      case 3:
        s='onboardingpage8'.tr;
        break;
      case 4:
        s='onboardingpage10'.tr;
        break;
      default:
    }
    return s;
  }
}
