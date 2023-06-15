
import 'package:flavor/flavor.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_base/src/ob/utils/properties2.dart';

enum OBModules {
  // 三方登录模块入口
  kThirdPartyLogin,

  // VIP模块入口
  kVIPS,

  // 客服入口
  kCustomerService,

  // 场馆模块入口
  kVenue,

  // 忘记密码、手机号码、短信验证模块入口
  kSMSVerification,

  // 存款模块入口
  kDeposit,

  // 取款模块、收款账户管理入口
  kWithdrawals,

  // 优惠活动入口
  kPreferentialActivities,

  //存款记录
  kAccessRecord,

  //收款帐号管理
  kAccount,

  //账号注册
  kRegister,
  // VWBet国际 虚拟币入口
  vUSDT,
}

enum OBMerchantTypes {

  // OB包网
  kOBBW,

  // 明商国际
  kMSGJ,

  // VWBet国际
  kVWBET,

  // X1BET
  kX1BET,

  // Z68BET
  kZ68BET,

  // 86BET
  k86BET,

  // LB体育
  kLBTY,
}

class AppMerchantUtils {

  static bool loadCurMerchantBy(OBModules mod){
    var l = Flavor.I.getObject(MERCHANT_MODULES_BAN_LIST);
    if (l != null && (l is List)) {
      return !l.contains(mod);
    }
    return true;
  }

  static OBMerchantTypes curMerchantTypes(){
    var l = Flavor.I.getString(MERCHANT_CODE);
    if (l != null) {
      switch (l) {
        case 'OBBW':
          return OBMerchantTypes.kOBBW;
        case 'MSGJ':
          return OBMerchantTypes.kMSGJ;
        case 'VWBET':
          return OBMerchantTypes.kVWBET;
        case 'X1BET':
          return OBMerchantTypes.kX1BET;
        case 'Z68BET':
          return OBMerchantTypes.kZ68BET;
        case '86BET':
          return OBMerchantTypes.k86BET;
      }
    }
    return OBMerchantTypes.kOBBW;
  }

  static String curLogoPath() {

    OBMerchantTypes t = curMerchantTypes();

    String path = Assets.images.error.comLogo.path;
    switch (t) {
      case OBMerchantTypes.kOBBW:
        {
          path = Assets.images.error.comLogo.path;
        }
        break;
      case OBMerchantTypes.kMSGJ:
        {
          path = Assets.images.error.comLogoMsgj.path;
        }
        break;
      case OBMerchantTypes.kVWBET:
        {
          path = Assets.images.error.comLogoVwbet.path;
        }
        break;
      case OBMerchantTypes.kX1BET:
        {
          path = Assets.images.error.comLogoX1bet.path;
        }
        break;
      case OBMerchantTypes.kZ68BET:
        {
          path = Assets.images.error.comLogoZ68bet.path;
        }
        break;
      case OBMerchantTypes.k86BET:
        {
          path = Assets.images.error.comLogo86bet.path;
        }
        break;
    }
    return path;
  }
  //根据币种返回对应语言
  static String currencyLang() {
    var langCCode = 'vi';
    var countryCode = 'VN';
    var localLan = Flavor.I.getString(MERCHANT_CURRENCY)!;
    if (localLan == 'CNY') {
      langCCode = 'zh';
      countryCode = 'CN';
    } else if (localLan == 'THB') {
      langCCode = 'th';
      countryCode = 'TH';
    } else if (localLan == 'VND') {
      langCCode = 'vi';
      countryCode = 'VN';
    }
    return "${langCCode}_$countryCode";
  }

}