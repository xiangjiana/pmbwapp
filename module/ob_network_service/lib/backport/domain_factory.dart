import 'package:repository/utils/domainService.dart';
import 'package:tuple/tuple.dart';

class DomainFactory {
  static const cgwTag = 'api-cgw';
  static const memberTag = 'api-member';
  static const launchTag = 'api-launch';
  static const cgwDomainType = 1000;
  static const memberDomainType = 2000;
  static const launchDomainType = 3000;

  static String clientServerUri = '/client-server';
  static String clientGatewayUri = '/client-gateway';

  static const nonClientServerApi = [
    // '/login',
    '/tryMemberLogin',
    // '/verificationCodeLogin',
    '/clientAddress',
    // '/checkUser',
    // '/isVerified',
    // '/recoverPassword',
    // '/resetPassWord',
    // '/sendMobileMessages',
  ];

  static const memberApi = [
    '/register',
    '/login',
    '/tryMemberLogin',
    '/sign/verificationCodeLogin',
    '/clientAddress',
    '/iosDownAddress',
    '/sign/checkUser',
    '/sign/isVerified',
    '/sign/recoverPassword',
    '/sign/resetPassWord',
    '/sign/sendMobileMessages',
    '/config/startPage',
    '/config/clientConfigAll',
    '/common/secondValidate',
    '/common/firstRegister',
    '/game/queryMyCollectGames',
    '/game/getPlatfromGame',
    '/game/queryGameAssortList',
    '/discount/activityType',
    '/help/all',
    '/gameModule/getGameModule',
    '/game/withdraw',
  ];


  static const launchApi = [
    '/game/balanceTransfer',
    '/game/getGameTopicDetail',
    '/game/getModuleConfig',
    '/main/login',
    '/game/maintainMyCollect',
    '/game/profitAndLossToday',
    '/game/queryGameByGameName',
    '/game/queryGameLatest',
    '/game/queryGameListByAssortId',
    '/game/queryGameRank',
    '/game/queryGameTopic',
    '/game/queryPlatformGames',
    '/game/ty/enterGame',
    '/game/ty/hotMatches',
    '/game/ty/login',
    '/game/ty/matches',
    '/game/ty/matchesCsid',
    '/game/ty/videos',
    '/game/cp/getAllResultList',
    '/game/cp/getHotResultList',
    '/game/cp/login',
    '/game/by/login',
    '/game/qp/login',
    '/game/qp/queryGameList',
    '/game/dy/getGameConfigList',
    '/game/dy/getGameConfigTop10',
    '/game/dy/login',
    '/game/dj/enterGame',
    '/game/dj/getMatchType',
    '/game/dj/login',
    '/game/dj/obRecommend',
    '/game/dj/queryRecommendByGameId',
    '/game/zr/forwardGame',
    '/game/zr/login',
    '/game/zr/native',
    '/game/zr/queryAllTables',
    '/game/zr/queryGameTypes',
    '/game/zr/queryHotTables',
  ];


  static List<String> dead = [];

  static String asBaseUrl(String domain) {
    return 'https://' + domain + clientGatewayUri;
  }

  static Tuple3<int, String, String> getDomain(Uri uri) {
    if (isApiType(uri, DomainFactory.memberApi)) {
      return Tuple3(memberDomainType, memberTag, DomainService.memberSld);
    }
    if (isApiType(uri, DomainFactory.launchApi)) {
      return Tuple3(launchDomainType, launchTag, DomainService.launchSLd);
    }
    return Tuple3(cgwDomainType, cgwTag, DomainService.cgwSld);
    // return Tuple3(cgwDomainType, cgwTag, DomainService.cgwSld);
  }

  static bool isApiType(Uri uri, List<String> apis) {
    for (var ooo in apis) {
      if (uri.toString().contains(ooo)) {
        return true;
      }
    }
    return false;
  }

  static void setDomain(int domainType, String domain) {
    if (domainType == memberDomainType) {
      DomainService.memberSld = domain;
    } else if (domainType == launchDomainType) {
      DomainService.launchSLd = domain;
    } else {
      DomainService.cgwSld = domain;
    }
    // DomainService.cgwSld = domain;
  }

  ///cgw域名
  List<String> get cgw => List.unmodifiable(DomainService.cgwSpList);

  ///member域名
  List<String> get member => List.unmodifiable(DomainService.memberSpList);

  ///launch域名
  List<String> get launch => List.unmodifiable(DomainService.launchSpList);

  DomainFactory();

  List<String> getBak(int domainType) {
    List<String> list;
    if (domainType == memberDomainType) {
      list = trimDead(member);
    } else if (domainType == launchDomainType) {
      list = trimDead(launch);
    } else {
      list = trimDead(cgw);
    }

    ///如果已经轮询完域名，直接重置
    // if (list.isEmpty) {
    //   DomainFactory.dead.clear();
    //   return getBak(domainType);
    // }
    return list;
  }

  List<String> trimDead(List<String> list) {
    return list.where((o) => !dead.contains(o)).toList();
  }

  static String postUriDopedWithServer(String oriUri) {
    if (nonClientServerApi.contains(oriUri)) return oriUri;

    return clientServerUri + oriUri;
  }
}
