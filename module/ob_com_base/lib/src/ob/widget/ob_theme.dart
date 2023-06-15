import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ob_com_base/src/ob/utils/app_merchant_utils.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ob_com_base/ob_com_base.dart'
    show Assets, ColorName, Store, pkObImage;
import 'package:get/get.dart';
import '../ob_theming.dart';

class ObTheme extends StatelessWidget {
  final Widget child;
  final TabFixedSizedIndicator? tabFixedSizedIndicator;

  const ObTheme({Key? key, required this.child, this.tabFixedSizedIndicator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Theme(
      data: themeData.copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        primaryColor: const Color(0xffFF9047),
        scaffoldBackgroundColor: ObTheming.scaffoldBackgroundColor,
        indicatorColor: const Color(0xff491605),
        textTheme: const TextTheme(
          subtitle1: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        platform: TargetPlatform.android,
        appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
            elevation: 0,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            backgroundColor: const Color(0xFF151e25),
            systemOverlayStyle: SystemUiOverlayStyle.light,
            centerTitle: true,
            iconTheme: IconThemeData(size: 24.w, color: Colors.white)),
        tabBarTheme: TabBarTheme(
          labelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          unselectedLabelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          labelColor: const Color(0xffFFFFFF),
          unselectedLabelColor: const Color(0xffFFFFFF).withOpacity(0.6),
          indicator: tabFixedSizedIndicator ??
              TabFixedSizedIndicator(
                Size(24.w, 3.w),
                ColorName.colorMain1,
                radius: Radius.circular(3.w),
              ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          alignLabelWithHint: false,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.06),
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.06),
            ),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.06),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.06),
            ),
          ),
          hintStyle: TextStyle(
            height: 2.5,
            color: Colors.white.withOpacity(0.3),
            fontSize: 14,
          ),
          labelStyle: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 18,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        dividerTheme: DividerThemeData(
          thickness: 1.w,
          space: 1.w,
          color: Colors.white.withOpacity(0.06),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: const Color(0xff1D2933),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.w)),
          ),
        ),
      ),
      child: RefreshConfiguration(
        headerBuilder: () => ObRefreshHeader(
          idleText: Get.locale!.languageCode=='en'?'Pull down to refresh':null,
          releaseText: Get.locale!.languageCode=='en'?'Pull down to refresh':null,
        ),
        //上拉加载更多的footer需要根据不同app来，默认OB旗舰
        footerBuilder: () => ObRefreshFooter(
            imageNoMore: imageNoMore()),
        hideFooterWhenNotFull: true,
        child: child,
      ),
    );
  }
  Widget imageNoMore() {
    if (Store.clientId == Store.clientIdDJ) {
      return pkObImage(
        Assets.images.icon.homeUeLogoDianjing.path,
        height: 24,
      );
    } else if (Store.clientId == Store.clientIdFYB) {
      return pkObImage(
        Assets.images.icon.fybRefreshFooter.path,
        height: 24,
      );
    } else if (Store.clientId == Store.clientIdPG) {
      if (AppMerchantUtils.curMerchantTypes() == OBMerchantTypes.kMSGJ) {
        return pkObImage(
          Assets.images.icon.homeUnderLogoMsgj.path,
          height: 24,
        );
      }else if (AppMerchantUtils.curMerchantTypes() == OBMerchantTypes.kX1BET) {
        return pkObImage(
          Assets.images.icon.homeUnderLogoX1bet.path,
          height: 24,
        );
      }else if (AppMerchantUtils.curMerchantTypes() == OBMerchantTypes.kZ68BET) {
        return pkObImage(
          Assets.images.icon.homeUeLogoZ68bet.path,
          height: 24,
        );
      }else if (AppMerchantUtils.curMerchantTypes() == OBMerchantTypes.k86BET) {
        return pkObImage(
          Assets.images.icon.homeUnderLogo86bet.path,
          height: 24,
        );
      }else {
        if (Get.locale?.languageCode == "zh") {
          return pkObImage(
            Assets.images.icon.homeUnderLogoBw.path,
            height: 24,
          );
        } else {
          return pkObImage(
            Assets.images.icon.homeUnderLogoBwWhiteEn.path,
            height: 24,
          );
        }
      }
    }
    return const SizedBox(width: 0,height: 0,);
  }
}
