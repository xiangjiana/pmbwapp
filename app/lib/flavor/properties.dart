import 'package:flutter/foundation.dart';
import 'package:ob_com_base/ob_com_base.dart';

final properties = {
  'prod_msgj': {
    API_URL: 'https://bwcgw.tbvprbkr.com/bw-client-gateway',
    API_DOMAIN: 'bwcgw.tbvprbkr.com',
    CLIENT_SERVER: '/bw-client-server',
    CLIENT_GATEWAY: '/bw-client-gateway',
    MERCHANT_CURRENCY: 'CNY',
    MERCHANT_ID: {
      'CNY': "803690741746446339",
    },
    MERCHANT_NAME: {
      'zh_CN': '明商国际',
    },
    MERCHANT_SUPPORT_LANG:
    PropertiesMapMask.kGetLangConfig(OBMerchantTypes.kMSGJ),
    MERCHANT_MODULES_BAN_LIST: [
      OBModules.kThirdPartyLogin,
      OBModules.kVIPS,
      OBModules.kCustomerService,
      OBModules.kVenue,
      OBModules.kSMSVerification,
      OBModules.kDeposit,
      OBModules.kWithdrawals,
      OBModules.kPreferentialActivities,
      OBModules.kRegister,
      OBModules.kAccessRecord,
      OBModules.kAccount,
    ],
    MERCHANT_GAME_LIMIT: [],
    MERCHANT_CODE: 'MSGJ',
    AES_KEY: PropertiesMapMask.kGetAesKey('prod'),
    AES_VERSION: PropertiesMapMask.kGetAesVersion('prod'),
    CRYPTO_SWITCH: true,
    SENTRY_KEY:
    'https://9922682226514cc19c6b9882deefbda3@sentry.b506c65p.com/12',
    API_TYPE: 'prod',
    TY_KEY: 'trgmbw',
    MEMBER_CUSTOMER_URL: MEMBER_CUSTOMER_URL_VALUE,
    AGENT_CUSTOMER_URL: AGENT_CUSTOMER_URL_VALUE,
  },
  'prod_vn': PropertiesMapMask.kOBBWProd("VND"),
  'prod_th': PropertiesMapMask.kOBBWProd("THB"),
  'prod': PropertiesMapMask.kOBBWProd("CNY"),
  /*
    商户名称：包网预发中文
    商户编码：BWYFZW
    商户ID：813792832258170923
    商户币种：CNY
  */
  'pre': {
    API_URL: 'https://bw-client-gateway.pre.zhanggao223.com/bw-client-gateway',
    API_DOMAIN: 'bw-client-gateway.pre.zhanggao223.com',
    CLIENT_SERVER: '/bw-client-server',
    CLIENT_GATEWAY: '/bw-client-gateway',
    MERCHANT_CURRENCY: 'CNY',
    // 包网预发新模版人民币    869654783689089080
    // 包网预发越南盾    821106138962583590
    // 包网预发泰铢      821106029428334653
    MERCHANT_ID: {
      'CNY': "869654783689089080",
      'VND': "821106138962583590",
      'THB': "821106029428334653",
    },
    MERCHANT_NAME: {
      'zh_CN': 'OB包网',
      'en_US': 'OB Package Network',
      'th_TH': 'เครือข่ายแพ็คเก็ต OB',
      'ms_MY': 'Rangkaian paket OB',
      'vi_VN': 'Mạng gói OB',
    },
    MERCHANT_SUPPORT_LANG:
    PropertiesMapMask.kGetLangConfig(OBMerchantTypes.kOBBW),
    MERCHANT_MODULES_BAN_LIST: [],
    MERCHANT_GAME_LIMIT: [],
    MERCHANT_CODE: 'OBBW',
    AES_KEY: PropertiesMapMask.kGetAesKey('pre'),
    AES_VERSION: PropertiesMapMask.kGetAesVersion('pre'),
    CRYPTO_SWITCH: true,
    SENTRY_KEY:
    'https://b505f417636542e4935cf8d2ad0747f9@sentry.b506c65p.com/11',
    API_TYPE: 'pre',
    TY_KEY: 'tvrgx4',
    MEMBER_CUSTOMER_URL: MEMBER_CUSTOMER_URL_VALUE,
    AGENT_CUSTOMER_URL: AGENT_CUSTOMER_URL_VALUE,
  },
  'test_msgj': {
    API_URL: 'https://bw-client-gateway.test.zhanggao223.com/bw-client-gateway',
    API_DOMAIN: 'bw-client-gateway.test.zhanggao223.com',
    CLIENT_SERVER: '/bw-client-server',
    CLIENT_GATEWAY: '/bw-client-gateway',
    MERCHANT_CURRENCY: 'CNY',
    MERCHANT_ID: {
      'CNY': "789469140550905867",
      'VND': "790979696856363027",
      'THB': "790979604762030144",
    },
    MERCHANT_NAME: {
      'zh_CN': '明商国际',
    },
    MERCHANT_SUPPORT_LANG:
    PropertiesMapMask.kGetLangConfig(OBMerchantTypes.kMSGJ),
    MERCHANT_MODULES_BAN_LIST: [
      OBModules.kThirdPartyLogin,
      OBModules.kVIPS,
      OBModules.kCustomerService,
      OBModules.kVenue,
      OBModules.kSMSVerification,
      OBModules.kDeposit,
      OBModules.kWithdrawals,
      OBModules.kPreferentialActivities,
      OBModules.kRegister,
      OBModules.kAccessRecord,
      OBModules.kAccount,
    ],
    MERCHANT_GAME_LIMIT: [],
    MERCHANT_CODE: 'MSGJ',
    AES_KEY: PropertiesMapMask.kGetAesKey('test'),
    AES_VERSION: PropertiesMapMask.kGetAesVersion('test'),
    CRYPTO_SWITCH: false,
    SENTRY_KEY:
    'https://b505f417636542e4935cf8d2ad0747f9@sentry.b506c65p.com/11',
    API_TYPE: 'test',
    TY_KEY: 'tv994u',
    MEMBER_CUSTOMER_URL: MEMBER_CUSTOMER_URL_VALUE,
    AGENT_CUSTOMER_URL: AGENT_CUSTOMER_URL_VALUE,
  },
  'test': {
    API_URL: 'https://bw-client-gateway.test.zhanggao223.com/bw-client-gateway',
    API_DOMAIN: 'bw-client-gateway.test.zhanggao223.com',
    CLIENT_SERVER: '/bw-client-server',
    CLIENT_GATEWAY: '/bw-client-gateway',
    MERCHANT_CURRENCY: 'CNY',
    MERCHANT_ID: {
      'CNY': "861560726457380929",
      'VND': "861577003393577039",
      'THB': "861577163024592992",
    },
    MERCHANT_NAME: {
      'zh_CN': 'OB包网',
      'en_US': 'OB Package Network',
      'th_TH': 'เครือข่ายแพ็คเก็ต OB',
      'ms_MY': 'Rangkaian paket OB',
      'vi_VN': 'Mạng gói OB',
    },
    MERCHANT_SUPPORT_LANG:
    PropertiesMapMask.kGetLangConfig(OBMerchantTypes.kOBBW),
    MERCHANT_MODULES_BAN_LIST: [],
    MERCHANT_GAME_LIMIT: [],
    MERCHANT_CODE: 'OBBW',
    AES_KEY: PropertiesMapMask.kGetAesKey('test'),
    AES_VERSION: PropertiesMapMask.kGetAesVersion('test'),
    CRYPTO_SWITCH: false,
    SENTRY_KEY:
    'https://b505f417636542e4935cf8d2ad0747f9@sentry.b506c65p.com/11',
    API_TYPE: 'test',
    TY_KEY: 'tv994u',
    MEMBER_CUSTOMER_URL: MEMBER_CUSTOMER_URL_VALUE,
    AGENT_CUSTOMER_URL: AGENT_CUSTOMER_URL_VALUE,
  },
  'dev': {
    API_URL: 'http://172.21.169.17:8050/bw-client-gateway', // dev 网关环境
    // API_URL: 'http://172.21.169.17:8049',  // dev 直连
    API_DOMAIN: 'http://172.21.169.17:8049',
    CLIENT_SERVER: '/bw-client-server',
    CLIENT_GATEWAY: '/bw-client-gateway',
    MERCHANT_CURRENCY: 'CNY',
    MERCHANT_ID: {
      'CNY': "780916020056862725",
    },
    MERCHANT_NAME: {
      'zh_CN': 'OB包网',
      'en_US': 'OB Package Network',
      'th_TH': 'เครือข่ายแพ็คเก็ต OB',
      'ms_MY': 'Rangkaian paket OB',
      'vi_VN': 'Mạng gói OB',
    },
    MERCHANT_SUPPORT_LANG:
    PropertiesMapMask.kGetLangConfig(OBMerchantTypes.kOBBW),
    MERCHANT_MODULES_BAN_LIST: [],
    MERCHANT_GAME_LIMIT: [],
    MERCHANT_CODE: 'OBBW',
    AES_KEY: PropertiesMapMask.kGetAesKey('dev'),
    AES_VERSION: PropertiesMapMask.kGetAesVersion('dev'),
    CRYPTO_SWITCH: false,
    SENTRY_KEY:
    'https://b505f417636542e4935cf8d2ad0747f9@sentry.b506c65p.com/11',
    API_TYPE: 'dev',
    TY_KEY: 'tv994u',
    MEMBER_CUSTOMER_URL: MEMBER_CUSTOMER_URL_VALUE,
    AGENT_CUSTOMER_URL: AGENT_CUSTOMER_URL_VALUE,
  },
  'mock': {
    API_URL: 'http://172.18.234.175:40001/mock/27',
    API_DOMAIN: '172.18.234.175:40001',
    CLIENT_SERVER: '/bw-client-server',
    CLIENT_GATEWAY: '/bw-client-gateway',
    MERCHANT_CURRENCY: 'CNY',
    MERCHANT_ID: {
      'CNY': "780916020056862725",
    },
    MERCHANT_NAME: {
      'zh_CN': 'OB包网',
      'en_US': 'OB Package Network',
      'th_TH': 'เครือข่ายแพ็คเก็ต OB',
      'ms_MY': 'Rangkaian paket OB',
      'vi_VN': 'Mạng gói OB',
    },
    MERCHANT_SUPPORT_LANG:
    PropertiesMapMask.kGetLangConfig(OBMerchantTypes.kOBBW),
    MERCHANT_MODULES_BAN_LIST: [],
    MERCHANT_GAME_LIMIT: [],
    MERCHANT_CODE: 'OBBW',
    AES_KEY: PropertiesMapMask.kGetAesKey('dev'),
    AES_VERSION: PropertiesMapMask.kGetAesVersion('dev'),
    CRYPTO_SWITCH: false,
    SENTRY_KEY:
    'https://b505f417636542e4935cf8d2ad0747f9@sentry.b506c65p.com/11',
    API_TYPE: 'mock',
    TY_KEY: 'tv994u',
    MEMBER_CUSTOMER_URL: MEMBER_CUSTOMER_URL_VALUE,
    AGENT_CUSTOMER_URL: AGENT_CUSTOMER_URL_VALUE,
  },
  'vwbet_test': {
    API_URL: 'https://bw-client-gateway.test.zhanggao223.com/bw-client-gateway',
    API_DOMAIN: 'bw-client-gateway.test.zhanggao223.com',
    CLIENT_SERVER: '/bw-client-server',
    CLIENT_GATEWAY: '/bw-client-gateway',
    MERCHANT_CURRENCY: 'VND',
    MERCHANT_ID: {
      'VND': "827207346373226540",
    },
    MERCHANT_NAME: {
      'zh_CN': 'VWBET',
      'en_US': 'VWBET',
      'th_TH': 'VWBET',
      'ms_MY': 'VWBET',
      'vi_VN': 'VWBET',
    },
    MERCHANT_SUPPORT_LANG:
    PropertiesMapMask.kGetLangConfig(OBMerchantTypes.kVWBET),
    MERCHANT_MODULES_BAN_LIST: [
      OBModules.vUSDT,
    ],
    MERCHANT_GAME_LIMIT: [],
    MERCHANT_CODE: 'VWBET',
    AES_KEY: PropertiesMapMask.kGetAesKey('test'),
    AES_VERSION: PropertiesMapMask.kGetAesVersion('test'),
    CRYPTO_SWITCH: false,
    SENTRY_KEY:
    'https://b505f417636542e4935cf8d2ad0747f9@sentry.b506c65p.com/11',
    API_TYPE: 'test',
    TY_KEY: 'tv994u',
    MEMBER_CUSTOMER_URL: MEMBER_CUSTOMER_URL_VALUE,
    AGENT_CUSTOMER_URL: AGENT_CUSTOMER_URL_VALUE,
  },
  'vwbet_prod': {
    API_URL: 'https://bwcgw.tbvprbkr.com/bw-client-gateway',
    API_DOMAIN: 'bwcgw.tbvprbkr.com',
    CLIENT_SERVER: '/bw-client-server',
    CLIENT_GATEWAY: '/bw-client-gateway',
    MERCHANT_CURRENCY: 'VND',
    MERCHANT_ID: {
      'VND': "826481539411947598",
    },
    MERCHANT_NAME: {
      'zh_CN': 'VWBET',
      'en_US': 'VWBET',
      'th_TH': 'VWBET',
      'ms_MY': 'VWBET',
      'vi_VN': 'VWBET',
    },
    MERCHANT_SUPPORT_LANG:
    PropertiesMapMask.kGetLangConfig(OBMerchantTypes.kVWBET),
    MERCHANT_MODULES_BAN_LIST: [
      OBModules.vUSDT,
    ],
    MERCHANT_GAME_LIMIT: [],
    MERCHANT_CODE: 'VWBET',
    AES_KEY: PropertiesMapMask.kGetAesKey('prod'),
    AES_VERSION: PropertiesMapMask.kGetAesVersion('prod'),
    CRYPTO_SWITCH: true,
    SENTRY_KEY:
    'https://9922682226514cc19c6b9882deefbda3@sentry.b506c65p.com/12',
    API_TYPE: 'prod',
    TY_KEY: 'trgmbw',
    MEMBER_CUSTOMER_URL: MEMBER_CUSTOMER_URL_VALUE,
    AGENT_CUSTOMER_URL: AGENT_CUSTOMER_URL_VALUE,
  },
  //生产：832978815772864558， QA：833045839745871922  pre: 837291673905127472
  'x1bet_test': {
    API_URL: 'https://bw-client-gateway.test.zhanggao223.com/bw-client-gateway',
    API_DOMAIN: 'bw-client-gateway.test.zhanggao223.com',
    CLIENT_SERVER: '/bw-client-server',
    CLIENT_GATEWAY: '/bw-client-gateway',
    MERCHANT_CURRENCY: 'VND',
    MERCHANT_ID: {
      'VND': "833045839745871922",
    },
    MERCHANT_NAME: {
      'zh_CN': 'X1 BET',
      'en_US': 'X1 BET',
      'th_TH': 'X1 BET',
      'ms_MY': 'X1 BET',
      'vi_VN': 'X1 BET',
    },
    MERCHANT_SUPPORT_LANG:
    PropertiesMapMask.kGetLangConfig(OBMerchantTypes.kX1BET),
    MERCHANT_MODULES_BAN_LIST: [],
    MERCHANT_GAME_LIMIT: [],
    MERCHANT_CODE: 'X1BET',
    AES_KEY: PropertiesMapMask.kGetAesKey('test'),
    AES_VERSION: PropertiesMapMask.kGetAesVersion('test'),
    CRYPTO_SWITCH: false,
    SENTRY_KEY:
    'https://b505f417636542e4935cf8d2ad0747f9@sentry.b506c65p.com/11',
    API_TYPE: 'test',
    TY_KEY: 'tv994u',
    MEMBER_CUSTOMER_URL: MEMBER_CUSTOMER_URL_VALUE,
    AGENT_CUSTOMER_URL: AGENT_CUSTOMER_URL_VALUE,
  },
  'x1bet_pre': {
    API_URL: 'https://bw-client-gateway.pre.zhanggao223.com/bw-client-gateway',
    API_DOMAIN: 'bw-client-gateway.pre.zhanggao223.com',
    CLIENT_SERVER: '/bw-client-server',
    CLIENT_GATEWAY: '/bw-client-gateway',
    MERCHANT_CURRENCY: 'VND',
    MERCHANT_ID: {
      'VND': "837291673905127472",
    },
    MERCHANT_NAME: {
      'zh_CN': 'X1 BET',
      'en_US': 'X1 BET',
      'th_TH': 'X1 BET',
      'ms_MY': 'X1 BET',
      'vi_VN': 'X1 BET',
    },
    MERCHANT_SUPPORT_LANG:
    PropertiesMapMask.kGetLangConfig(OBMerchantTypes.kX1BET),
    MERCHANT_MODULES_BAN_LIST: [],
    MERCHANT_GAME_LIMIT: [],
    MERCHANT_CODE: 'X1BET',
    AES_KEY: PropertiesMapMask.kGetAesKey('pre'),
    AES_VERSION: PropertiesMapMask.kGetAesVersion('pre'),
    CRYPTO_SWITCH: true,
    SENTRY_KEY:
    'https://b505f417636542e4935cf8d2ad0747f9@sentry.b506c65p.com/11',
    API_TYPE: 'pre',
    TY_KEY: 'tv994u',
    MEMBER_CUSTOMER_URL: MEMBER_CUSTOMER_URL_VALUE,
    AGENT_CUSTOMER_URL: AGENT_CUSTOMER_URL_VALUE,
  },
  'x1bet_prod': {
    API_URL: 'https://bwcgw.tbvprbkr.com/bw-client-gateway',
    API_DOMAIN: 'bwcgw.tbvprbkr.com',
    CLIENT_SERVER: '/bw-client-server',
    CLIENT_GATEWAY: '/bw-client-gateway',
    MERCHANT_CURRENCY: 'VND',
    MERCHANT_ID: {
      'VND': "832978815772864558",
    },
    MERCHANT_NAME: {
      'zh_CN': 'X1 BET',
      'en_US': 'X1 BET',
      'th_TH': 'X1 BET',
      'ms_MY': 'X1 BET',
      'vi_VN': 'X1 BET',
    },
    MERCHANT_SUPPORT_LANG:
    PropertiesMapMask.kGetLangConfig(OBMerchantTypes.kX1BET),
    MERCHANT_MODULES_BAN_LIST: [],
    MERCHANT_GAME_LIMIT: [],
    MERCHANT_CODE: 'X1BET',
    AES_KEY: PropertiesMapMask.kGetAesKey('prod'),
    AES_VERSION: PropertiesMapMask.kGetAesVersion('prod'),
    CRYPTO_SWITCH: true,
    SENTRY_KEY:
    'https://9922682226514cc19c6b9882deefbda3@sentry.b506c65p.com/12',
    API_TYPE: 'prod',
    TY_KEY: 'trgmbw',
    MEMBER_CUSTOMER_URL: MEMBER_CUSTOMER_URL_VALUE,
    AGENT_CUSTOMER_URL: AGENT_CUSTOMER_URL_VALUE,
  },

  //生产：835629299675512894， QA：838732780755710000  pre: 839940962879922235
  'z68bet_test': {
    API_URL: 'https://bw-client-gateway.test.zhanggao223.com/bw-client-gateway',
    API_DOMAIN: 'bw-client-gateway.test.zhanggao223.com',
    CLIENT_SERVER: '/bw-client-server',
    CLIENT_GATEWAY: '/bw-client-gateway',
    MERCHANT_CURRENCY: 'VND',
    MERCHANT_ID: {
      'VND': "838732780755710000",
    },
    MERCHANT_NAME: {
      'zh_CN': 'Z68BET',
      'en_US': 'Z68BET',
      'th_TH': 'Z68BET',
      'ms_MY': 'Z68BET',
      'vi_VN': 'Z68BET',
    },
    MERCHANT_SUPPORT_LANG:
    PropertiesMapMask.kGetLangConfig(OBMerchantTypes.kZ68BET),
    MERCHANT_MODULES_BAN_LIST: [
      OBModules.kThirdPartyLogin,
    ],
    MERCHANT_GAME_LIMIT: [],
    MERCHANT_CODE: 'Z68BET',
    AES_KEY: PropertiesMapMask.kGetAesKey('test'),
    AES_VERSION: PropertiesMapMask.kGetAesVersion('test'),
    CRYPTO_SWITCH: false,
    SENTRY_KEY:
    'https://b505f417636542e4935cf8d2ad0747f9@sentry.b506c65p.com/11',
    API_TYPE: 'test',
    TY_KEY: 'tv994u',
    MEMBER_CUSTOMER_URL: MEMBER_CUSTOMER_URL_VALUE,
    AGENT_CUSTOMER_URL: AGENT_CUSTOMER_URL_VALUE,
  },
  'z68bet_pre': {
    API_URL: 'https://bw-client-gateway.pre.zhanggao223.com/bw-client-gateway',
    API_DOMAIN: 'bw-client-gateway.pre.zhanggao223.com',
    CLIENT_SERVER: '/bw-client-server',
    CLIENT_GATEWAY: '/bw-client-gateway',
    MERCHANT_CURRENCY: 'VND',
    MERCHANT_ID: {
      'VND': "839940962879922235",
    },
    MERCHANT_NAME: {
      'zh_CN': 'Z68BET',
      'en_US': 'Z68BET',
      'th_TH': 'Z68BET',
      'ms_MY': 'Z68BET',
      'vi_VN': 'Z68BET',
    },
    MERCHANT_SUPPORT_LANG:
    PropertiesMapMask.kGetLangConfig(OBMerchantTypes.kZ68BET),
    MERCHANT_MODULES_BAN_LIST: [
      OBModules.kThirdPartyLogin,
    ],
    MERCHANT_GAME_LIMIT: [],
    MERCHANT_CODE: 'Z68BET',
    AES_KEY: PropertiesMapMask.kGetAesKey('pre'),
    AES_VERSION: PropertiesMapMask.kGetAesVersion('pre'),
    CRYPTO_SWITCH: true,
    SENTRY_KEY:
    'https://b505f417636542e4935cf8d2ad0747f9@sentry.b506c65p.com/11',
    API_TYPE: 'pre',
    TY_KEY: 'tv994u',
    MEMBER_CUSTOMER_URL: MEMBER_CUSTOMER_URL_VALUE,
    AGENT_CUSTOMER_URL: AGENT_CUSTOMER_URL_VALUE,
  },
  'z68bet_prod': {
    API_URL: 'https://bwcgw.tbvprbkr.com/bw-client-gateway',
    API_DOMAIN: 'bwcgw.tbvprbkr.com',
    CLIENT_SERVER: '/bw-client-server',
    CLIENT_GATEWAY: '/bw-client-gateway',
    MERCHANT_CURRENCY: 'VND',
    MERCHANT_ID: {
      'VND': "835629299675512894",
    },
    MERCHANT_NAME: {
      'zh_CN': 'Z68BET',
      'en_US': 'Z68BET',
      'th_TH': 'Z68BET',
      'ms_MY': 'Z68BET',
      'vi_VN': 'Z68BET',
    },
    MERCHANT_SUPPORT_LANG:
    PropertiesMapMask.kGetLangConfig(OBMerchantTypes.kZ68BET),
    MERCHANT_MODULES_BAN_LIST: [
      OBModules.kThirdPartyLogin,
    ],
    MERCHANT_GAME_LIMIT: [],
    MERCHANT_CODE: 'Z68BET',
    AES_KEY: PropertiesMapMask.kGetAesKey('prod'),
    AES_VERSION: PropertiesMapMask.kGetAesVersion('prod'),
    CRYPTO_SWITCH: true,
    SENTRY_KEY:
    'https://9922682226514cc19c6b9882deefbda3@sentry.b506c65p.com/12',
    API_TYPE: 'prod',
    TY_KEY: 'trgmbw',
    MEMBER_CUSTOMER_URL: MEMBER_CUSTOMER_URL_VALUE,
    AGENT_CUSTOMER_URL: AGENT_CUSTOMER_URL_VALUE,
  },
  // 86 BET QA 847068975684350033  预发  847183692592963591  生产  846127199102775386
  '86bet_test': {
    API_URL: 'https://bw-client-gateway.test.zhanggao223.com/bw-client-gateway',
    API_DOMAIN: 'bw-client-gateway.test.zhanggao223.com',
    CLIENT_SERVER: '/bw-client-server',
    CLIENT_GATEWAY: '/bw-client-gateway',
    MERCHANT_CURRENCY: 'VND',
    MERCHANT_ID: {
      'VND': "847068975684350033",
    },
    MERCHANT_NAME: {
      'zh_CN': '86BET',
      'en_US': '86BET',
      'th_TH': '86BET',
      'ms_MY': '86BET',
      'vi_VN': '86BET',
    },
    MERCHANT_SUPPORT_LANG:
    PropertiesMapMask.kGetLangConfig(OBMerchantTypes.k86BET),
    MERCHANT_MODULES_BAN_LIST: [],
    MERCHANT_GAME_LIMIT: [],
    MERCHANT_CODE: '86BET',
    AES_KEY: PropertiesMapMask.kGetAesKey('test'),
    AES_VERSION: PropertiesMapMask.kGetAesVersion('test'),
    CRYPTO_SWITCH: false,
    SENTRY_KEY:
    'https://b505f417636542e4935cf8d2ad0747f9@sentry.b506c65p.com/11',
    API_TYPE: 'test',
    TY_KEY: 'tv994u',
    MEMBER_CUSTOMER_URL: MEMBER_CUSTOMER_URL_VALUE,
    AGENT_CUSTOMER_URL: AGENT_CUSTOMER_URL_VALUE,
  },
  '86bet_pre': {
    API_URL: 'https://bw-client-gateway.pre.zhanggao223.com/bw-client-gateway',
    API_DOMAIN: 'bw-client-gateway.pre.zhanggao223.com',
    CLIENT_SERVER: '/bw-client-server',
    CLIENT_GATEWAY: '/bw-client-gateway',
    MERCHANT_CURRENCY: 'VND',
    MERCHANT_ID: {
      'VND': "847183692592963591",
    },
    MERCHANT_NAME: {
      'zh_CN': '86BET',
      'en_US': '86BET',
      'th_TH': '86BET',
      'ms_MY': '86BET',
      'vi_VN': '86BET',
    },
    MERCHANT_SUPPORT_LANG:
    PropertiesMapMask.kGetLangConfig(OBMerchantTypes.k86BET),
    MERCHANT_MODULES_BAN_LIST: [],
    MERCHANT_GAME_LIMIT: [],
    MERCHANT_CODE: '86BET',
    AES_KEY: PropertiesMapMask.kGetAesKey('pre'),
    AES_VERSION: PropertiesMapMask.kGetAesVersion('pre'),
    CRYPTO_SWITCH: true,
    SENTRY_KEY:
    'https://b505f417636542e4935cf8d2ad0747f9@sentry.b506c65p.com/11',
    API_TYPE: 'pre',
    TY_KEY: 'tv994u',
    MEMBER_CUSTOMER_URL: MEMBER_CUSTOMER_URL_VALUE,
    AGENT_CUSTOMER_URL: AGENT_CUSTOMER_URL_VALUE,
  },
  '86bet_prod': {
    API_URL: 'https://bwcgw.tbvprbkr.com/bw-client-gateway',
    API_DOMAIN: 'bwcgw.tbvprbkr.com',
    CLIENT_SERVER: '/bw-client-server',
    CLIENT_GATEWAY: '/bw-client-gateway',
    MERCHANT_CURRENCY: 'VND',
    MERCHANT_ID: {
      'VND': "846127199102775386",
    },
    MERCHANT_NAME: {
      'zh_CN': '86BET',
      'en_US': '86BET',
      'th_TH': '86BET',
      'ms_MY': '86BET',
      'vi_VN': '86BET',
    },
    MERCHANT_SUPPORT_LANG:
    PropertiesMapMask.kGetLangConfig(OBMerchantTypes.k86BET),
    MERCHANT_MODULES_BAN_LIST: [
      OBModules.kThirdPartyLogin,
    ],
    MERCHANT_GAME_LIMIT: [],
    MERCHANT_CODE: '86BET',
    AES_KEY: PropertiesMapMask.kGetAesKey('prod'),
    AES_VERSION: PropertiesMapMask.kGetAesVersion('prod'),
    CRYPTO_SWITCH: true,
    SENTRY_KEY:
    'https://9922682226514cc19c6b9882deefbda3@sentry.b506c65p.com/12',
    API_TYPE: 'prod',
    TY_KEY: 'trgmbw',
    MEMBER_CUSTOMER_URL: MEMBER_CUSTOMER_URL_VALUE,
    AGENT_CUSTOMER_URL: AGENT_CUSTOMER_URL_VALUE,
  },
  'lbty_test': {
    API_URL: 'https://bw-client-gateway.test.zhanggao223.com/bw-client-gateway',
    API_DOMAIN: 'bw-client-gateway.test.zhanggao223.com',
    CLIENT_SERVER: '/bw-client-server',
    CLIENT_GATEWAY: '/bw-client-gateway',
    MERCHANT_CURRENCY: 'CNY',
    MERCHANT_ID: {
      'CNY': "856955811063885900",
    },
    MERCHANT_NAME: {
      'zh_CN': 'LB体育',
      'en_US': 'LB体育',
      'th_TH': 'LB体育',
      'ms_MY': 'LB体育',
      'vi_VN': 'LB体育',
    },
    MERCHANT_SUPPORT_LANG:
    PropertiesMapMask.kGetLangConfig(OBMerchantTypes.kLBTY),
    MERCHANT_MODULES_BAN_LIST: [
      //OBModules.vUSDT,
      OBModules.kThirdPartyLogin,
    ],
    MERCHANT_GAME_LIMIT: [],
    MERCHANT_CODE: 'LBTY',
    AES_KEY: PropertiesMapMask.kGetAesKey('test'),
    AES_VERSION: PropertiesMapMask.kGetAesVersion('test'),
    CRYPTO_SWITCH: false,
    SENTRY_KEY:
    'https://b505f417636542e4935cf8d2ad0747f9@sentry.b506c65p.com/11',
    API_TYPE: 'test',
    TY_KEY: 'tv994u',
    MEMBER_CUSTOMER_URL: MEMBER_CUSTOMER_URL_VALUE,
    AGENT_CUSTOMER_URL: AGENT_CUSTOMER_URL_VALUE,
  },
  'lbty_pre': {
    API_URL: 'https://bw-client-gateway.pre.zhanggao223.com/bw-client-gateway',
    API_DOMAIN: 'bw-client-gateway.pre.zhanggao223.com',
    CLIENT_SERVER: '/bw-client-server',
    CLIENT_GATEWAY: '/bw-client-gateway',
    MERCHANT_CURRENCY: 'CNY',
    MERCHANT_ID: {
      'CNY': "856943852848799754",
    },
    MERCHANT_NAME: {
      'zh_CN': 'LB体育',
      'en_US': 'LB体育',
      'th_TH': 'LB体育',
      'ms_MY': 'LB体育',
      'vi_VN': 'LB体育',
    },
    MERCHANT_SUPPORT_LANG:
    PropertiesMapMask.kGetLangConfig(OBMerchantTypes.kLBTY),
    MERCHANT_MODULES_BAN_LIST: [
      //OBModules.vUSDT,
      OBModules.kThirdPartyLogin,
    ],
    MERCHANT_GAME_LIMIT: [],
    MERCHANT_CODE: 'LBTY',
    AES_KEY: PropertiesMapMask.kGetAesKey('pre'),
    AES_VERSION: PropertiesMapMask.kGetAesVersion('pre'),
    CRYPTO_SWITCH: true,
    SENTRY_KEY:
    'https://b505f417636542e4935cf8d2ad0747f9@sentry.b506c65p.com/11',
    API_TYPE: 'pre',
    TY_KEY: 'tv994u',
    MEMBER_CUSTOMER_URL: MEMBER_CUSTOMER_URL_VALUE,
    AGENT_CUSTOMER_URL: AGENT_CUSTOMER_URL_VALUE,
  },
  'lbty_prod': {
    API_URL: 'https://bwcgw.tbvprbkr.com/bw-client-gateway',
    API_DOMAIN: 'bwcgw.tbvprbkr.com',
    CLIENT_SERVER: '/bw-client-server',
    CLIENT_GATEWAY: '/bw-client-gateway',
    MERCHANT_CURRENCY: 'CNY',
    MERCHANT_ID: {
      'CNY': "856623693727612933",
    },
    MERCHANT_NAME: {
      'zh_CN': 'LB体育',
      'en_US': 'LB体育',
      'th_TH': 'LB体育',
      'ms_MY': 'LB体育',
      'vi_VN': 'LB体育',
    },
    MERCHANT_SUPPORT_LANG:
    PropertiesMapMask.kGetLangConfig(OBMerchantTypes.kLBTY),
    MERCHANT_MODULES_BAN_LIST: [
      //OBModules.vUSDT,
      OBModules.kThirdPartyLogin,
    ],
    MERCHANT_GAME_LIMIT: [],
    MERCHANT_CODE: 'LBTY',
    AES_KEY: PropertiesMapMask.kGetAesKey('prod'),
    AES_VERSION: PropertiesMapMask.kGetAesVersion('prod'),
    CRYPTO_SWITCH: true,
    SENTRY_KEY:
    'https://9922682226514cc19c6b9882deefbda3@sentry.b506c65p.com/12',
    API_TYPE: 'prod',
    TY_KEY: 'trgmbw',
    MEMBER_CUSTOMER_URL: MEMBER_CUSTOMER_URL_VALUE,
    AGENT_CUSTOMER_URL: AGENT_CUSTOMER_URL_VALUE,
  },
};

abstract class PropertiesMapMask {
  // merchant_name        merchant_code        id
  // 模板2人民币            MB2RMB                872527006079725624
  // 模板2越南盾            MB2YND                872527364847906825
  // 模板2泰铢            MB2TZ                872527536826957891
  static Map<String, Object> kOBBWProd(String currency) {
    Map<String, String> merchantID;
    switch (currency) {
      case "THB":
        {
          merchantID = {
            'THB': "872527536826957891",
          };
        }
        break;
      case "VND":
        {
          merchantID = {
            'VND': "872527364847906825",
          };
        }
        break;
      case "CNY":
      default:
        {
          merchantID = {
            'CNY': "872527006079725624",
          };
        }
    }

    return {
      API_URL: 'https://bwcgw.tbvprbkr.com/bw-client-gateway',
      API_DOMAIN: 'bwcgw.tbvprbkr.com',
      CLIENT_SERVER: '/bw-client-server',
      CLIENT_GATEWAY: '/bw-client-gateway',
      MERCHANT_CURRENCY: currency,
      MERCHANT_ID: merchantID,
      MERCHANT_NAME: {
        'zh_CN': 'OB包网',
        'en_US': 'OB Package Network',
        'th_TH': 'เครือข่ายแพ็คเก็ต OB',
        'ms_MY': 'Rangkaian paket OB',
        'vi_VN': 'Mạng gói OB',
      },
      MERCHANT_MODULES_BAN_LIST: [],
      MERCHANT_SUPPORT_LANG:
      PropertiesMapMask.kGetLangConfig(OBMerchantTypes.kOBBW),
      MERCHANT_GAME_LIMIT: [],
      MERCHANT_CODE: 'OBBW',
      AES_KEY: PropertiesMapMask.kGetAesKey('prod'),
      AES_VERSION: PropertiesMapMask.kGetAesVersion('prod'),
      CRYPTO_SWITCH: true,
      SENTRY_KEY:
      'https://9922682226514cc19c6b9882deefbda3@sentry.b506c65p.com/12',
      API_TYPE: 'prod',
      TY_KEY: 'trgmbw',
      MEMBER_CUSTOMER_URL: MEMBER_CUSTOMER_URL_VALUE,
      AGENT_CUSTOMER_URL: AGENT_CUSTOMER_URL_VALUE,
    };
  }

  static List<Map<String, String>> kGetLangConfig(OBMerchantTypes mType) {
    switch (mType) {
      case OBMerchantTypes.kLBTY:
        return [
          {"langName": "简体中文", "langCode": "zh_CN"},
        ];
      case OBMerchantTypes.kVWBET:
      case OBMerchantTypes.kX1BET:
      case OBMerchantTypes.kZ68BET:
      case OBMerchantTypes.k86BET:
        return [
          {"langName": "Tiếng Việt", "langCode": "vi_VN"},
        ];
      case OBMerchantTypes.kOBBW:
      case OBMerchantTypes.kMSGJ:
      default:
        return [
          {"langName": "简体中文", "langCode": "zh_CN"},
          {"langName": "English", "langCode": "en_US"},
          {"langName": "Tiếng Việt", "langCode": "vi_VN"},
          {"langName": "ไทย", "langCode": "th_TH"},
        ];
    }
  }

  static String kGetAesKey(String type) {
    // 2023/4/27	包网APP	66	2	H+3gbiUJv3SOD8Bp
    // 2023/4/27	包网H5	67	2	peBBTP+C1Z1MWx2L

    // 2023/5/29	包网APP	66	3	w7F2uh86F89dEmd3
    // 2023/5/29	包网H5	67	3	qPnh0YPCHiQmttj+

    // version 1 kIsWeb ? 'uz6WJ8EnqDTAtiFw' : 'KFGUNR7H8RoWpeAM';
    switch (type) {
      case 'dev':
      case 'test':
        return kIsWeb ? 'LDlBhzvNRoFbCxGH' : 'xssKPnlI//LXBBNi';
      case 'pre':
        return kIsWeb ? 'bcCsIwA+xf6ccv3q' : 'LvbUb+aErtBGkYMG';
      case 'prod':
      default:
        return kIsWeb ? 'qPnh0YPCHiQmttj+' : 'w7F2uh86F89dEmd3';
    }
  }

  static String kGetAesVersion(String type) {
    switch (type) {
      case 'dev':
      case 'test':
      case 'pre':
        return '1';
      case 'prod':
      default:
        return '3';
    }
  }
}

const String MEMBER_CUSTOMER_URL_VALUE = 'https://hjsfd.lanlaion.com/chat/text/chat_104xkN.html?skill=2c94833884070f94018408ddaf47044c&l=zh';
const String AGENT_CUSTOMER_URL_VALUE = 'https://hjsfd.lanlaion.com/chat/text/chat_104xkN.html?skill=2c94833884070f94018408ddaf47044c&l=zh';


enum UrlEndpoint {
  cgw,
  member,
  launch,
}
