import 'package:ob_com_http/src/gen/mod/game/game_gameGetPlatfromGame_post_req_model.dart';
import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/game/game_queryRecommendByGameId_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_queryRecommendByGameId_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_zrNative_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_zrNative_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_djEnterGame_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_djEnterGame_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_dyLogin_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_dyLogin_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_queryGameLatest_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/game/game_enterGame_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_enterGame_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_djLogin_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_djLogin_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_gamewithdraw_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/game/game_obRecommend_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/game/game_login_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_login_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_queryGameRank_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/game/game_zrLogin_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_zrLogin_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_queryGameTypes_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/game/game_gameGetPlatfromGame_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/game/game_getGameTopicDetail_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_getGameTopicDetail_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_hotMatches_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_hotMatches_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_queryGameListByAssortId_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_queryGameListByAssortId_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_getAllResultList_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/game/game_qpLogin_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_qpLogin_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_queryHotTables_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_queryHotTables_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_maintainMyCollect_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_maintainMyCollect_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_queryPlatformGames_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_queryPlatformGames_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_queryAllTables_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_queryAllTables_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_forwardGame_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_forwardGame_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_getGameConfigList_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/game/game_queryLiveRooms_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_queryLiveRooms_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_getMatchType_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/game/game_queryGameList_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_queryGameList_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_balancetransfer_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_balancetransfer_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_queryGameAssortList_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/game/game_queryMyCollectGames_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/game/game_cpLogin_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_cpLogin_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_byLogin_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_byLogin_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_queryGameTopic_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/game/game_videos_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/game/game_getGameConfigTop10_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/game/game_queryGameByGameName_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_queryGameByGameName_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_matches_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/game/game_profitAndLossToday_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_profitAndLossToday_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_getModuleConfig_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/game/game_getHotResultList_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/game/game_tyLogin_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_tyLogin_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/game/game_multiAgentProxyQueryMemberNetAmountDetailDay_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/game/game_multiAgentProxyQueryMemberNetAmountDetailDay_post_req_model.dart';

import '../../adaptor/game/game_gameCenterWalletAllToVenue_post_resp_adaptor.dart';
import '../../adaptor/game/game_queryGameListNewByVenueCode_post_resp_adaptor.dart';
import '../mod/game/game_gameCenterWalletAllToVenue_post_req_model.dart';
import '../mod/game/game_queryGameListNewByVneueCode_post_req_model.dart';

class GameApis {
  static void gameQueryRecommendByGameIdPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is GameQueryRecommendByGameIdPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/dj/queryRecommendByGameId',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameQueryRecommendByGameIdPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameQueryRecommendByGameIdPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameZrNativePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GameZrNativePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/meibo/native',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameZrNativePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameZrNativePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameDjEnterGamePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GameDjEnterGamePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/dj/enterGame',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameDjEnterGamePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameDjEnterGamePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameDyLoginPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GameDyLoginPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/dy/login',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameDyLoginPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameDyLoginPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameQueryGameLatestPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/game/queryGameLatest',
      options: options,
      info: info,
      success: (Response r) {
        GameQueryGameLatestPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameQueryGameLatestPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameEnterGamePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GameEnterGamePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/ty/enterGame',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameEnterGamePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameEnterGamePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameDjLoginPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GameDjLoginPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/dj/login',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameDjLoginPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameDjLoginPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameGamewithdrawPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/capital/withdraw',
      options: options,
      info: info,
      success: (Response r) {
        GameGamewithdrawPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameGamewithdrawPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameObRecommendPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/game/dj/obRecommend',
      options: options,
      info: info,
      success: (Response r) {
        GameObRecommendPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameObRecommendPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameLoginPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GameLoginPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/main/login',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameLoginPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameLoginPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameQueryGameRankPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/game/queryGameRank',
      options: options,
      info: info,
      success: (Response r) {
        GameQueryGameRankPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameQueryGameRankPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameZrLoginPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GameZrLoginPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/zr/login',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameZrLoginPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameZrLoginPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameQueryGameTypesPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/game/zr/queryGameTypes',
      options: options,
      info: info,
      success: (Response r) {
        GameQueryGameTypesPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameQueryGameTypesPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameGameGetPlatfromGamePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {

    if (parameters != null &&
        parameters is GameGameGetPlatfromGamePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/getPlatfromGame',
      options: options,
      info: info,
      params: parameters,
      success: (Response r) {
        GameGameGetPlatfromGamePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameGameGetPlatfromGamePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameGetGameTopicDetailPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is GameGetGameTopicDetailPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/getGameTopicDetail',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameGetGameTopicDetailPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameGetGameTopicDetailPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameHotMatchesPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GameHotMatchesPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/ty/hotMatches',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameHotMatchesPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameHotMatchesPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }


  /**
   * 获取游戏分类
   */
  static void gameQueryMerchantDyPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is GameQueryGameListByAssortIdPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/main/venueDy',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameQueryGameListByAssortIdPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameQueryGameListByAssortIdPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  /**
   * 获取游戏电游新接口 加了场馆code参数  获取指定场馆下游戏
   */
  static void gameQueryMerchantDyNewPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is GameQueryGameListNewByVenueCodePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/main/venueDyNew',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameQueryGameListNewByVenueCodePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameQueryGameListNewByVenueCodePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
  
  static void gameQueryGameListByAssortIdPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is GameQueryGameListByAssortIdPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/queryGameListByAssortId',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameQueryGameListByAssortIdPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameQueryGameListByAssortIdPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameGetAllResultListPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/game/cp/getAllResultList',
      options: options,
      info: info,
      success: (Response r) {
        GameGetAllResultListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameGetAllResultListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameQpLoginPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GameQpLoginPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/qp/login',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameQpLoginPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameQpLoginPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameQueryHotTablesPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GameQueryHotTablesPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/zr/queryHotTables',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameQueryHotTablesPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameQueryHotTablesPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameMaintainMyCollectPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GameMaintainMyCollectPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/maintainMyCollect',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameMaintainMyCollectPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameMaintainMyCollectPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameQueryPlatformGamesPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is GameQueryPlatformGamesPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/queryPlatformGames',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameQueryPlatformGamesPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameQueryPlatformGamesPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameQueryAllTablesPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GameQueryAllTablesPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/zr/queryAllTables',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameQueryAllTablesPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameQueryAllTablesPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameForwardGamePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GameForwardGamePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/zr/forwardGame',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameForwardGamePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameForwardGamePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameGetGameConfigListPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/game/dy/getGameConfigList',
      options: options,
      info: info,
      success: (Response r) {
        GameGetGameConfigListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameGetGameConfigListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameQueryLiveRoomsPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GameQueryLiveRoomsPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/zr/queryLiveRooms',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameQueryLiveRoomsPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameQueryLiveRoomsPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameGetMatchTypePost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/game/dj/getMatchType',
      options: options,
      info: info,
      success: (Response r) {
        GameGetMatchTypePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameGetMatchTypePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameQueryGameListPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GameQueryGameListPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/qp/queryGameList',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameQueryGameListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameQueryGameListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameBalancetransferPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GameBalancetransferPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/capital/balanceTransfer',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameBalancetransferPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameBalancetransferPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameQueryGameAssortListPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/game/queryGameAssortList',
      options: options,
      info: info,
      success: (Response r) {
        GameQueryGameAssortListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameQueryGameAssortListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameQueryMyCollectGamesPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/game/queryMyCollectGames',
      options: options,
      info: info,
      success: (Response r) {
        GameQueryMyCollectGamesPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameQueryMyCollectGamesPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameCpLoginPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GameCpLoginPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/cp/login',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameCpLoginPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameCpLoginPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameByLoginPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GameByLoginPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/by/login',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameByLoginPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameByLoginPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameQueryGameTopicPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/game/queryGameTopic',
      options: options,
      info: info,
      success: (Response r) {
        GameQueryGameTopicPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameQueryGameTopicPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameVideosPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/game/ty/videos',
      options: options,
      info: info,
      success: (Response r) {
        GameVideosPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameVideosPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameGetGameConfigTop10Post({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/game/dy/getGameConfigTop10',
      options: options,
      info: info,
      success: (Response r) {
        GameGetGameConfigTop10PostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameGetGameConfigTop10PostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameQueryGameByGameNamePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is GameQueryGameByGameNamePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/queryGameByGameName',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameQueryGameByGameNamePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameQueryGameByGameNamePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameMatchesPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/game/ty/matches',
      options: options,
      info: info,
      success: (Response r) {
        GameMatchesPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameMatchesPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameProfitAndLossTodayPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is GameProfitAndLossTodayPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/profitAndLossToday',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameProfitAndLossTodayPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameProfitAndLossTodayPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameGetModuleConfigPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/game/getModuleConfig',
      options: options,
      info: info,
      success: (Response r) {
        GameGetModuleConfigPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameGetModuleConfigPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameGetHotResultListPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/game/cp/getHotResultList',
      options: options,
      info: info,
      success: (Response r) {
        GameGetHotResultListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameGetHotResultListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameTyLoginPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is GameTyLoginPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/ty/login',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameTyLoginPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameTyLoginPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void gameMultiAgentProxyQueryMemberNetAmountDetailDayPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters
            is GameMultiAgentProxyQueryMemberNetAmountDetailDayPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/multiAgent/proxy/queryMemberNetAmountDetailDay',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameMultiAgentProxyQueryMemberNetAmountDetailDayPostRespAdaptor
            .onSuccess(
                r.data,
                success,
                r.statusCode,
                r.headers.value('exp') == null
                    ? 0
                    : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameMultiAgentProxyQueryMemberNetAmountDetailDayPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void gameGameCenterWalletAllToVenuePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is GameGameCenterWalletAllToVenuePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/game/centerWalletAllToVenue',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        GameGameCenterWalletAllToVenuePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        GameGameCenterWalletAllToVenuePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
