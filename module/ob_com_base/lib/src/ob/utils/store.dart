import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';

import 'package:sp_util/sp_util.dart';

/// 放一些全局使用的变量值
class Store {
  static void init() {
    isLogin = false.obs;
    accountStatus = 0.obs;
    messageTabIndex = 0.obs;
    hasUnreadMessage = false.obs;
    currentRootPageIndex = 0;
    isHomeManualRefresh = false;
    rankingScrollNum = 0;
    homeGameModules = [];
    recycleTipSwitch = true;
    isUpgradeDialogShow = false;
    userPassword = '';
    activityTypes = [];
    activityTypes = [];
    isActivityManualRefresh = false;
    isDirtyHomeGameModules = false;
    isAutoFocus = true;
    getURLable = false;
    isBaimhWithdraw = false;

    BaseX.instance.baseCallback?.Store_init();
  }

  static bool isSystemMaintenance = false; //系统维护
  static RxBool isLogin = false.obs; //是否已登录
  static bool isEasyPay = true;
  static RxBool hideAgentSwitch = false.obs; //新代理系统入口开关
  static RxInt accountStatus = 0.obs; //账号状态（1正常，2登录锁定，3游戏锁定，4充提锁定）
  static RxInt messageTabIndex = 0.obs; // 消息中心Tab索引值
  static RxBool hasUnreadMessage = false.obs; // 是否有未读消息
  static RxInt hasUnreadMessageNum = 0.obs; // 是否有未读消息
  static int currentRootPageIndex = 0; //当前根页面是第几个tab
  static Map dictionary = defaultDictionary; // 字典
  static bool isHomeManualRefresh = false; // 手动下拉刷新标识
  static int rankingScrollNum = 0; // 首页排行滚动页数
  static List homeGameModules = []; // 首页模块配置
  static bool recycleTipSwitch = true; // 取款一键回收不再提示开关
  static bool isUpgradeDialogShow = false; //自动更新弹窗
  static RxBool isUmeShow = false.obs;
  static String userPassword = '';
  static List activityTypes = [];
  static bool isActivityManualRefresh = false;
  static bool isDirtyHomeGameModules = false; // 十大模块配置是否被缓存
  static bool isAutoFocus = true;
  static bool getURLable = false;
  static String nativeRouting = "";
  static DateTime appActiveTime = DateTime.now(); // app初次到首页的时间
  static bool isBaimhWithdraw = false; //白马会取款标实
  static List<UiCallingCode> callingCode = callingCodeDefault;
  static RxInt checkInviteActivityEntry = 0.obs; //好友邀请活动入口
  static bool needUpdateKeyBoardBottom =
      false; // ios 偶发后台切回，有系统键盘时， 底部安全边距错误问题， 是否需要强制更新
  static RxString invitationCode = ''.obs;
  static RxString friendInvitationCode = ''.obs;
  static RxString registerReference = ''.obs;
  static bool isIpLimited = false;
  static String deviceId = '';
  static String tyPayUrl = '';
  static String agentTyPayUrl = '';
  static bool isTyPayOn = false;
  static String registerDefaultVentureCode = '';
  static String payMerchant = '';
  static String merchantCurrency = SpUtil.getString(Constants.appCurrency)??Tools.getConfigFromFlavor(MERCHANT_CURRENCY)!;//当前默认币种
  //
  static RxString curLanguageCode = ''.obs;

  ///客户端标识：6==电竞；5==美播；其他==ob旗舰
  static int clientId = -1;
  static int clientIdDJ = 6;
  static int clientIdMB = 5;
  static int clientIdFYB = 40; //富盈宝
  static int clientIdPG = 66; //Ob包网

  static OBMerchantTypes clientChildId = OBMerchantTypes.kOBBW;

  static bool openBrowser = false;
  /// H5 下载app横幅
  static RxBool showDow = true.obs;

  static RxList bannerList = defaultBanner;
  static List banks = defaultBanks; // 银行列表
  static String agentCustomerUrl =
      Tools.getConfigFromFlavor(AGENT_CUSTOMER_URL)!; //代理链接
  static String memberCustomerUrl =
      Tools.getConfigFromFlavor(MEMBER_CUSTOMER_URL)!; //会员链接

  //static HelpAllPostRespModel allHelp = defaultHelpAll; //教程数据配置
  //static InviteInviteConfigPostRespModel? inviteConfig; //好友邀请配置信息

}

/// 初始化Banner
RxList<ConfigBannerRespDTO> defaultBanner = <ConfigBannerRespDTO>[

  
].obs;

/// 初始化银行列表，后端没数据时容错
List<BankDto> defaultBanks = [
  BankDto(bankCode: 'ABC', bankName: 'agricultural_bank_of_china'.tr),
  BankDto(bankCode: 'BCM', bankName: 'bank_of_communications'.tr),
  BankDto(bankCode: 'BOC', bankName: 'bank_of_china'.tr),
  BankDto(bankCode: 'CCB', bankName: 'china_construction_bank'.tr),
  BankDto(bankCode: 'CEB', bankName: 'china_everbright_bank'.tr),
  BankDto(bankCode: 'CGB', bankName: 'china_guangfa_bank'.tr),
  BankDto(bankCode: 'CIB', bankName: 'industrial_bank'.tr),
  BankDto(bankCode: 'CMB', bankName: 'china_merchants_bank'.tr),
  BankDto(bankCode: 'CMBC', bankName: 'china_minsheng_bank'.tr),
  BankDto(bankCode: 'CNCB', bankName: 'citic_bank'.tr),
  BankDto(bankCode: 'HXB', bankName: 'hsbc_bank'.tr),
  BankDto(bankCode: 'ICBC', bankName: 'icbc'.tr),
  BankDto(bankCode: 'PAB', bankName: 'ping_an_bank'.tr),
  BankDto(bankCode: 'PSBC', bankName: 'china_postal_savings_bank'.tr),
  BankDto(
      bankCode: 'SPDB', bankName: 'shanghai_pudong_development_bank'.tr)
];

/// 初始化默认字典配置，后端没数据时容错，需和中控后台配置的key保持一致
Map defaultDictionary = {
  'login.jump.countdown.time': '3', // 跳过默认倒计时(秒)
  'resource.banner.interval.time': '3', // APP-banner轮播时间(秒)
  'transfer.agent.oneclickrecycling.interval.time': '10', // 一键回收按钮点击间隔时间(秒)
  'wallet.totalamount.refresh.interval.time': '10', // 总金额刷新按钮点击间隔时间(秒)
  'transfer.centerwallet.refresh.interval.time': '10', // 中心钱包金额刷新按钮点击间隔时间(秒)
  'deposit.immediately.countdown.time': '30', // 点击立即存款后倒计时时间(分钟)
  'log.logreport.url': '1', //  日志上报功能
  'log.logreport.onoff': '1', // 日志上报开关(0关1开)
  'withdraw.card.show.onoff': '0', // 默认隐藏银行卡取款
};

/// 帮助二级页面标题
List<String> appBarTitle = [
  'help_course_title1'.tr,
  'help_course_title2'.tr,
  'help_course_title3'.tr,
  'help_course_title4'.tr,
  'help_course_title5'.tr,
  'help_course_title6'.tr,
  'help_course_title7'.tr,
];

// List<TutorName> tutorNameList = Store.isEasyPay
//     ? [
//         TutorName(
//           id: "1455440562738958337",
//           tutorName: "help_course_title2".tr,
//           tutorDescribe: "help_course_text2".tr,
//           tutorPicture: Assets.images.course.course02.path,
//           tutorSort: 2,
//           route: AppRoutes.COMMON_COURSE,
//         ),
//         TutorName(
//           id: "1455440948099026945",
//           tutorName: "help_course_title3".tr,
//           tutorDescribe: "help_course_text3".tr,
//           tutorPicture: Assets.images.course.course07.path,
//           tutorSort: 3,
//           route: AppRoutes.COMMON_COURSE,
//         ),
//         TutorName(
//           id: "1455441163937910785",
//           tutorName: "help_course_title4".tr,
//           tutorDescribe: "help_course_text4".tr,
//           tutorPicture: Assets.images.course.course03.path,
//           tutorSort: 4,
//           route: AppRoutes.GAME_INTRODUCE,
//         ),
//         TutorName(
//           id: "1455441431681306626",
//           tutorName: "help_course_title5".tr,
//           tutorDescribe: "help_course_text5".tr,
//           tutorPicture: Assets.images.course.course04.path,
//           tutorSort: 5,
//           route: AppRoutes.COMMON_COURSE,
//         ),
//         TutorName(
//           id: "1455441431681306626",
//           tutorName: "help_course_title6".tr,
//           tutorDescribe: "help_course_text6".tr,
//           tutorPicture: Assets.images.course.course05.path,
//           tutorSort: 5,
//           route: AppRoutes.CONTACT_US,
//         ),
//         TutorName(
//           id: "1455441431681306626",
//           tutorName: "help_course_title7".tr,
//           tutorDescribe: "help_course_text7".tr,
//           tutorPicture: Assets.images.course.course06.path,
//           tutorSort: 5,
//           route: AppRoutes.FEEDBACK,
//         ),
//       ]
//     : [
//         TutorName(
//           id: "1455440328554188801",
//           tutorName: "help_course_title1".tr,
//           tutorDescribe: "help_course_text1".tr,
//           tutorPicture: Assets.images.course.course01.path,
//           tutorSort: 1,
//           route: AppRoutes.DEPOSIT_COURSE,
//         ),
//         TutorName(
//           id: "1455440562738958337",
//           tutorName: "help_course_title2".tr,
//           tutorDescribe: "help_course_text2".tr,
//           tutorPicture: Assets.images.course.course02.path,
//           tutorSort: 2,
//           route: AppRoutes.COMMON_COURSE,
//         ),
//         TutorName(
//           id: "1455440948099026945",
//           tutorName: "help_course_title3".tr,
//           tutorDescribe: "help_course_text3".tr,
//           tutorPicture: Assets.images.course.course07.path,
//           tutorSort: 3,
//           route: AppRoutes.COMMON_COURSE,
//         ),
//         TutorName(
//           id: "1455441163937910785",
//           tutorName: "help_course_title4".tr,
//           tutorDescribe: "help_course_text4".tr,
//           tutorPicture: Assets.images.course.course03.path,
//           tutorSort: 4,
//           route: AppRoutes.GAME_INTRODUCE,
//         ),
//         TutorName(
//           id: "1455441431681306626",
//           tutorName: "help_course_title5".tr,
//           tutorDescribe: "help_course_text5".tr,
//           tutorPicture: Assets.images.course.course04.path,
//           tutorSort: 5,
//           route: AppRoutes.COMMON_COURSE,
//         ),
//         TutorName(
//           id: "1455441431681306626",
//           tutorName: "help_course_title6".tr,
//           tutorDescribe: "help_course_text6".tr,
//           tutorPicture: Assets.images.course.course05.path,
//           tutorSort: 5,
//           route: AppRoutes.CONTACT_US,
//         ),
//         TutorName(
//           id: "1455441431681306626",
//           tutorName: "help_course_title7".tr,
//           tutorDescribe: "help_course_text7".tr,
//           tutorPicture: Assets.images.course.course06.path,
//           tutorSort: 5,
//           route: AppRoutes.FEEDBACK,
//         ),
//       ];

/// 初始化教程配置
// HelpAllPostRespModel defaultHelpAll = HelpAllPostRespModel(
//   tutorNameList: [],
//   bookMarkList: [],
//   tutorContentList: [],
// );

Map<String, String> callingCodeMap = {
  '+86': '中国大陆地区（+86）',
  '+886': '中国台湾地区（+886）',
};

List<UiCallingCode> callingCodeDefault = [];

String cnPhone = r'^(\\+?0?86\\-?)?1[345789]\\d{9}$';
String twnPhone = r'^(\\+?886\\-?|0)?9\\d{8}$';
String hkPhone = r'^(\\+?852\\-?)?[569]\\d{3}\\-?\\d{4}$';
String msPhone =
    r'^(\\+?6?01){1}(([145]{1}(\\-|\\s)?\\d{7,8})|([236789]{1}(\\s|\\-)?\\d{7}))$';
String phPhone = r'^(\\+?0?63\\-?)?\\d{10}$';
String thPhone = r'^(\\+?0?66\\-?)?\\d{10}$';
String vnPhone =
    r'^(\\+?84|0)?((1(2([0-9])|6([2-9])|88|99))|(9((?!5)[0-9])))([0-9]{7})$';
