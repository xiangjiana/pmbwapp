import 'package:activity/activity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_package/modules/vip/vip_level/component/vip_level_widget.dart';
import 'package:ob_package/modules/vip/vip_level/repository/ui_vipLevel.dart';
import 'package:ob_package/modules/vip/vip_level/repository/vip_level_repository.dart';
import 'package:ob_component/ob_component.dart';
import 'package:params/params.dart';

class VipLevelController extends GetxController
    with SingleGetTickerProviderMixin, KeyboardManager {
  late TabController tabController;
  final VipLevelRepository repository;
  final AuthService authService;
  final ScrollController scrollController = ScrollController();
  final TextEditingController textController = TextEditingController();
  FocusNode focusNode = FocusNode();
  final FocusNode inputFocusNode = FocusNode();
  late bool curIsVND;

  VipLevelController(this.repository, this.authService) {
    tabController = TabController(length: tabBarTitle.length, vsync: this);
  }

  RxBool firstLoad = true.obs;
  RxList<Widget> tabBarTitle = <Widget>[].obs;
  RxList<Widget> tabBarViews = <Widget>[].obs;
  RxBool visible = false.obs;
  RxInt selectedLevel = 0.obs;
  RxBool isTabViewCanScroll = false.obs;
  RxBool isLoadingStatus = false.obs;
  RxBool vipPromotionState = true.obs;
  RxString minActivity = '5'.obs;

  Map<String, String> gameCodeMap = Map<String, String>();
  Rx<UserActivityInfo> userVipActivityInfo = UserActivityInfo(activityStatus: 0).obs;
  Rx<UiVipLevel> selectVipLevel = UiVipLevel('', '', '', '', '', '').obs;

  RxString selectedVenueName = "please_choose".tr.obs;
  Map routeArguments = {};

  // = {
  //   'listIn': [],
  //   'listRebate': [],
  // };
  double lowestTransferQuota = 0.0;

  final _isAllowTransfer = false.obs;

  bool get isAllowTransfer => _isAllowTransfer.value;

  String get vipLevel => authService.vipLevel;

  String get userName => authService.userName;

  bool get isAvatarHttpUrl => authService.isAvatarHttpUrl;

  String get userAvatarUrl => authService.userAvatarUrl;

  String get vipExperience => authService.vipExperience;

  String get vipLabel => authService.vipLabel;

  double get vipExperienceNum => authService.vipExperienceNum;

  Map<String, String> vipGrade = {
    "0": Assets.vip.grade.vipGrade00.path,
    "1": Assets.vip.grade.vipGrade01.path,
    "2": Assets.vip.grade.vipGrade02.path,
    "3": Assets.vip.grade.vipGrade03.path,
    "4": Assets.vip.grade.vipGrade04.path,
    "5": Assets.vip.grade.vipGrade05.path,
    "6": Assets.vip.grade.vipGrade06.path,
    "7": Assets.vip.grade.vipGrade07.path,
    "8": Assets.vip.grade.vipGrade08.path,
    "9": Assets.vip.grade.vipGrade09.path,
    "10": Assets.vip.grade.vipGrade10.path,
  };
  Map<String, String> noVipGrade = {
    "0": Assets.vip.grade.vipGrade00.path,
    "1": Assets.vip.grade.vipGrade01No.path,
    "2": Assets.vip.grade.vipGrade02No.path,
    "3": Assets.vip.grade.vipGrade03No.path,
    "4": Assets.vip.grade.vipGrade04No.path,
    "5": Assets.vip.grade.vipGrade05No.path,
    "6": Assets.vip.grade.vipGrade06No.path,
    "7": Assets.vip.grade.vipGrade07No.path,
    "8": Assets.vip.grade.vipGrade08No.path,
    "9": Assets.vip.grade.vipGrade08No.path,
    "10": Assets.vip.grade.vipGrade10No.path,
  };
  Map<String, Color> vipColorStart = {
    "0": Color(0xFFF4CCCC),
    "1": Color(0xFFF6DEC7),
    "2": Color(0xFFFDECB9),
    "3": Color(0xFFD2E0A2),
    "4": Color(0xFFADD2EF),
    "5": Color(0xFFC5C2ED),
    "6": Color(0xFFE8B5EF),
    "7": Color(0xFFF0CEB6),
    "8": Color(0xFFCEDCDF),
    "9": Color(0xFFB1CAF1),
    "10": Color(0xFF070707),
  };
  Map<String, Color> vipColorEnd = {
    "0": Color(0xFFF1AEAE),
    "1": Color(0xFFF2CBB1),
    "2": Color(0xFFF7DDA3),
    "3": Color(0xFFC6E195),
    "4": Color(0xFFA9C7F0),
    "5": Color(0xFFDCC5E9),
    "6": Color(0xFFE8B5EF),
    "7": Color(0xFFE5B59D),
    "8": Color(0xFFAFC2C4),
    "9": Color(0xFF959FC1),
    "10": Color(0xFF101010),
  };

  Map<String, Color> noVipColorStart = {
    "0": Color(0xFFEBEBEB),
    "1": Color(0xFFEBEBEB),
    "2": Color(0xFFEBEBEB),
    "3": Color(0xFFEBEBEB),
    "4": Color(0xFFEBEBEB),
    "5": Color(0xFFEBEBEB),
    "6": Color(0xFFEBEBEB),
    "7": Color(0xFFEBEBEB),
    "8": Color(0xFFEBEBEB),
    "9": Color(0xFFEBEBEB),
    "10": Color(0xFFEBEBEB),
  };
  Map<String, Color> noVipColorEnd = {
    "0": Color(0xFFA5A5A5),
    "1": Color(0xFFA5A5A5),
    "2": Color(0xFFA5A5A5),
    "3": Color(0xFFA5A5A5),
    "4": Color(0xFFA5A5A5),
    "5": Color(0xFFA5A5A5),
    "6": Color(0xFFA5A5A5),
    "7": Color(0xFFA5A5A5),
    "8": Color(0xFFA5A5A5),
    "9": Color(0xFFA5A5A5),
    "10": Color(0xFFA5A5A5),
  };

  Map<String, Color> vipTextColor = {
    "0": Color(0xFFAE1E17),
    "1": Color(0xFFAC4E0E),
    "2": Color(0xFFAF7A00),
    "3": Color(0xFF425500),
    "4": Color(0xFF003179),
    "5": Color(0xFF3A0F7D),
    "6": Color(0xFF8C103E),
    "7": Color(0xFF703F25),
    "8": Color(0xFF455B5D),
    "9": Color(0xFF435C7E),
    "10": Color(0xFFF3D4A0),
  };
  Map<String, Color> noVipTextColor = {
    "0": Color(0xFF333333),
    "1": Color(0xFF333333),
    "2": Color(0xFF333333),
    "3": Color(0xFF333333),
    "4": Color(0xFF333333),
    "5": Color(0xFF333333),
    "6": Color(0xFF333333),
    "7": Color(0xFF333333),
    "8": Color(0xFF333333),
    "9": Color(0xFF333333),
    "10": Color(0xFF333333),
  };
  final activityApi = Get.find<ActivityApi>();

  @override
  void onInit() {
    super.onInit();
    curIsVND = AppCurrencyUtils.getAppCurrencySymbolIsVND();
    if (curIsVND) {
      focusNode.addListener(() {
        if (!focusNode.hasFocus) {
          // textController.text =
          //     '${textController.text.substring(0, textController.text.length - 1)}0';
          focusNode.unfocus();
        }
      });
    }
    // getFirstDepositGetUserVipActivityInfo(int.parse(vipLevel));
    getFirstDepositGetUserVipActivityInfo(
      int.parse(vipLevel),
      gameCodeMap[selectedVenueName.value],
    );

    onRefresh();
    scrollController.addListener(() {
      visible.value = scrollController.offset > 256.w;
    });
    textController.addListener(() {
      double value =
          (double.tryParse(textController.text.replaceAll(',', '')) ?? 0);
      if (value == 0) {
        _isAllowTransfer.value = false;
      } else if (value >= lowestTransferQuota) {
        _isAllowTransfer.value = true;
      } else {
        _isAllowTransfer.value = false;
      }
    });
  }

  void getAccountMoneyMerchantGame() {
    runCatch(() async {
      final res = await repository.getAccountMoneyMerchantGame();
      for (var element in res) {
        gameCodeMap[element.venueName] = element.venueCode;
      }
    });
  }

  void getUserApiSelectVipInfo() {
    runCatch(() async {
      final res = await repository.getUserApiSelectVipInfo(userName);
      res.listGrade.sort((a, b) =>
          int.parse(a.vipSerialNum).compareTo(int.parse(b.vipSerialNum)));
      res.listIn.sort((a, b) =>
          int.parse(a.vipSerialNum).compareTo(int.parse(b.vipSerialNum)));
      res.listPromotion.sort((a, b) =>
          int.parse(a.vipSerialNum).compareTo(int.parse(b.vipSerialNum)));
      if (userVipActivityInfo.value.approveTime != '' &&
          res.updatedAt != '' &&
          userVipActivityInfo.value.activityStatus != 2) {
        if (DateTime.parse(userVipActivityInfo.value.approveTime ?? "")
                .difference(DateTime.parse(res.updatedAt))
                .inSeconds <
            0) {
          vipPromotionState.value = true;
        } else {
          vipPromotionState.value = res.vipPromotionState == 1;
        }
      } else {
        vipPromotionState.value = res.vipPromotionState == 1;
      }
      firstLoad.value = false;
      res.listIn.forEach((element) {
        element.vipGradeName = "VIP" + element.vipSerialNum;
      });
      res.listPromotion.forEach((element) {
        element.vipGradeName = "VIP" + element.vipSerialNum;
      });
      res.listGrade.forEach((element) {
        element.vipGradeName = "VIP" + element.vipSerialNum;
      });
      tabBarTitle.clear();
      tabBarViews.clear();
      routeArguments['listIn'] = res.listIn;
      routeArguments['listRebate'] = res.listRebate;

      for (int i = 0; i < res.listGrade.length; i++) {
        var item = res.listGrade[i];
        if (item.vipSerialNum == '0') continue; // 过滤调LV0
        if (vipLevel == '0') {
          selectVipLevel.value.nextGrade = res.listGrade[1].vipGradeName;
        } else {
          if (vipLevel == item.vipSerialNum) {
            selectedLevel.value = i - 1;
            int j = i == res.listGrade.length - 1 ? i : i + 1;
            selectVipLevel.value.nextGrade = res.listGrade[j].vipGradeName;
            lowestTransferQuota = curIsVND
                ? res.listPromotion[i].lowestTransferQuota / 1000.0
                : res.listPromotion[i].lowestTransferQuota.toDouble();
          }
        }
        tabBarTitle.add(Tab(
          child: Text(
            item.vipGradeName,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              fontFamily: FontFamily.dINMedium,
              package: BaseX.pkg2,
            ),
          ),
        ));
        tabBarViews.add(VipLevelWidget(
          grade: item,
          userLevel: vipLevel,
          level: item.vipSerialNum,
          rights: res.listIn[i],
          promotion: res.listPromotion[i],
          venueList: res.listPromotion[i].gameName.split(','),
        ));
      }
      tabController = TabController(
        length: tabBarTitle.length,
        vsync: this,
      );
      tabController.animateTo(selectedLevel.value);
      tabController.addListener(() {
        selectedLevel.value = tabController.index;
      });
    }, handleError: (_) {
      firstLoad.value = false;
    });
  }

  void getUserApiSelectVipLevel() {
    runCatch(() async {
      final res = await repository.getUserApiSelectVipLevel(userName);
      selectVipLevel.value = UiVipLevel(
        res.depositAmountCurr.fixed(2),
        res.depositAmountTotal.fixed(2),
        res.validBetsCurr.fixed(2),
        res.validBetsTotal.fixed(2),
        vipLabel,
        '',
      );
    });
  }

  getFirstDepositGetUserVipActivityInfo(int vipSerialNum,
      [String? gameCode]) async {
    runCatch(() async {
      userVipActivityInfo.value = await activityApi.getUserVipActivityInfo(UserActivityInfoParam(vipSerialNum: vipSerialNum, gameCode: gameCode));
      var res = await repository.commonGetSystemConfigurationValuePost();
      minActivity.value = res;
      getUserApiSelectVipInfo();

      update(['submitButton']);
    });
  }

  void postFirstDepositActivityDeposit(
    String transferAmount,
    String gameCode,
    int vipSerialNum,
  ) {
    runCatch(() async {
      isLoadingStatus.value = true;
      await activityApi.activityDeposit(ActivityDepositReqParam(
          activityId: vipSerialNum.toString(),
          activityType: 2,
          amount: transferAmount,
          deviceNo: "APP",
          gameCode: gameCode,
          vipSerialNum: vipSerialNum));
      isLoadingStatus.value = false;
      OBDialogUtil.show(ObDialog.alert(
        title: 'warm_tips'.tr,
        content: 'successful_transfer'.tr,
        confirmText: 'confirm'.tr,
        onConfirmListener: () => {Get.back(result: true)},
      ));
      getFirstDepositGetUserVipActivityInfo(
        int.parse(vipLevel),
        gameCodeMap[selectedVenueName.value],
      );
      BalanceManager.syncAll();
      update();
    }, handleError: (e) {
      isLoadingStatus.value = false;
    });
  }

  onRefresh() {
    BalanceManager.syncAll();
    getAccountMoneyMerchantGame();
    getUserApiSelectVipLevel();
    //getUserApiSelectVipInfo();
  }

  @override
  void onClose() {
    tabController.dispose();
    scrollController.dispose();
    textController.dispose();
    inputFocusNode.dispose();
    super.onClose();
  }
}
