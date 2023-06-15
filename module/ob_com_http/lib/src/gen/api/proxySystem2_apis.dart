import 'package:dio/dio.dart';
import 'package:repository/utils/net.dart';
import '../../adaptor/proxySystem2/proxySystem2_bankerData_post_resp_adaptor.dart';
import '../../adaptor/proxySystem2/proxySystem2_mainTransferIn_post_resp_adaptor.dart';
import '../mod/proxySystem2/proxySystem2_mainTransferIn_post_req_model.dart';
import '../../adaptor/proxySystem2/proxySystem2_orderQuery_post_resp_adaptor.dart';
import '../mod/proxySystem2/proxySystem2_orderQuery_post_req_model.dart';
import '../../adaptor/proxySystem2/proxySystem2_bankerSettingList_post_resp_adaptor.dart';
import '../mod/proxySystem2/proxySystem2_bankerSettingList_post_req_model.dart';
import '../../adaptor/proxySystem2/proxySystem2_orderSettingQuery_post_resp_adaptor.dart';
import '../../adaptor/proxySystem2/proxySystem2_mainData_post_resp_adaptor.dart';
import '../../adaptor/proxySystem2/proxySystem2_orderSettingUpdate_post_resp_adaptor.dart';
import '../mod/proxySystem2/proxySystem2_orderSettingUpdate_post_req_model.dart';
import '../../adaptor/proxySystem2/proxySystem2_memberGameRecordDetail_post_resp_adaptor.dart';
import '../mod/proxySystem2/proxySystem2_memberGameRecordDetail_post_req_model.dart';
import '../../adaptor/proxySystem2/proxySystem2_bankerSettingQuery_post_resp_adaptor.dart';
import '../../adaptor/proxySystem2/proxySystem2_mainTransferOut_post_resp_adaptor.dart';
import '../mod/proxySystem2/proxySystem2_mainTransferOut_post_req_model.dart';
import '../../adaptor/proxySystem2/proxySystem2_profitDayDetail_post_resp_adaptor.dart';
import '../mod/proxySystem2/proxySystem2_profitDayDetail_post_req_model.dart';
import '../../adaptor/proxySystem2/proxySystem2_profitDayData_post_resp_adaptor.dart';
import '../mod/proxySystem2/proxySystem2_profitDayData_post_req_model.dart';
import '../../adaptor/proxySystem2/proxySystem2_orderEatOrder_post_resp_adaptor.dart';
import '../mod/proxySystem2/proxySystem2_orderEatOrder_post_req_model.dart';
import '../../adaptor/proxySystem2/proxySystem2_profitEatDetail_post_resp_adaptor.dart';
import '../mod/proxySystem2/proxySystem2_profitEatDetail_post_req_model.dart';
import '../../adaptor/proxySystem2/proxySystem2_memberGameRecord_post_resp_adaptor.dart';
import '../mod/proxySystem2/proxySystem2_memberGameRecord_post_req_model.dart';
import '../../adaptor/proxySystem2/proxySystem2_bankerOrderQuery_post_resp_adaptor.dart';
import '../mod/proxySystem2/proxySystem2_bankerOrderQuery_post_req_model.dart';
import '../../adaptor/proxySystem2/proxySystem2_orderSettingList_post_resp_adaptor.dart';
import '../mod/proxySystem2/proxySystem2_orderSettingList_post_req_model.dart';
import '../../adaptor/proxySystem2/proxySystem2_profitMonthDetail_post_resp_adaptor.dart';
import '../mod/proxySystem2/proxySystem2_profitMonthDetail_post_req_model.dart';
import '../../adaptor/proxySystem2/proxySystem2_mainTransferOutData_post_resp_adaptor.dart';
import '../../adaptor/proxySystem2/proxySystem2_bankerHandicapSwitch_post_resp_adaptor.dart';
import '../mod/proxySystem2/proxySystem2_bankerHandicapSwitch_post_req_model.dart';
import '../../adaptor/proxySystem2/proxySystem2_bankerSettingUpdate_post_resp_adaptor.dart';
import '../mod/proxySystem2/proxySystem2_bankerSettingUpdate_post_req_model.dart';
import '../../adaptor/proxySystem2/proxySystem2_mainTransferInData_post_resp_adaptor.dart';
import '../../adaptor/proxySystem2/proxySystem2_bankerInventoryOrderList_post_resp_adaptor.dart';
import '../mod/proxySystem2/proxySystem2_bankerInventoryOrderList_post_req_model.dart';
import '../../adaptor/proxySystem2/proxySystem2_bankerPreSettlement_post_resp_adaptor.dart';
import '../mod/proxySystem2/proxySystem2_bankerPreSettlement_post_req_model.dart';
import '../../adaptor/proxySystem2/proxySystem2_orderData_post_resp_adaptor.dart';
import '../../adaptor/proxySystem2/proxySystem2_orderInventoryOrderList_post_resp_adaptor.dart';
import '../mod/proxySystem2/proxySystem2_orderInventoryOrderList_post_req_model.dart';

class ProxySystem2Apis {
  static void proxySystem2MainTransferInPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxySystem2MainTransferInPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/system2/main/transferIn',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxySystem2MainTransferInPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2MainTransferInPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySystem2OrderQueryPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxySystem2OrderQueryPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/system2/order/orderQuery',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxySystem2OrderQueryPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2OrderQueryPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySystem2BankerSettingListPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxySystem2BankerSettingListPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/system2/banker/settingList',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxySystem2BankerSettingListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2BankerSettingListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySystem2OrderSettingQueryPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/proxy/system2/order/settingQuery',
      options: options,
      info: info,
      success: (Response r) {
        ProxySystem2OrderSettingQueryPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2OrderSettingQueryPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySystem2MainDataPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/proxy/system2/main/data',
      options: options,
      info: info,
      success: (Response r) {
        ProxySystem2MainDataPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2MainDataPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySystem2OrderSettingUpdatePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxySystem2OrderSettingUpdatePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/system2/order/settingUpdate',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxySystem2OrderSettingUpdatePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2OrderSettingUpdatePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySystem2MemberGameRecordDetailPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxySystem2MemberGameRecordDetailPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/system2/member/gameRecordDetail',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxySystem2MemberGameRecordDetailPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2MemberGameRecordDetailPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void proxySystem2BankerSettingQueryPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/proxy/system2/banker/settingQuery',
      options: options,
      info: info,
      success: (Response r) {
        ProxySystem2BankerSettingQueryPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2BankerSettingQueryPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySystem2MainTransferOutPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxySystem2MainTransferOutPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/system2/main/transferOut',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxySystem2MainTransferOutPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2MainTransferOutPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySystem2ProfitDayDetailPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxySystem2ProfitDayDetailPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/system2/profit/dayDetail',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxySystem2ProfitDayDetailPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2ProfitDayDetailPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySystem2ProfitDayDataPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxySystem2ProfitDayDataPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/system2/profit/dayData',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxySystem2ProfitDayDataPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2ProfitDayDataPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySystem2OrderEatOrderPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxySystem2OrderEatOrderPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/system2/order/eatOrder',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxySystem2OrderEatOrderPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2OrderEatOrderPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySystem2ProfitEatDetailPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxySystem2ProfitEatDetailPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/system2/profit/eatDetail',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxySystem2ProfitEatDetailPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2ProfitEatDetailPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySystem2MemberGameRecordPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxySystem2MemberGameRecordPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/system2/member/gameRecord',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxySystem2MemberGameRecordPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2MemberGameRecordPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySystem2BankerOrderQueryPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxySystem2BankerOrderQueryPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/system2/banker/orderQuery',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxySystem2BankerOrderQueryPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2BankerOrderQueryPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySystem2OrderSettingListPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxySystem2OrderSettingListPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/system2/order/settingList',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxySystem2OrderSettingListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2OrderSettingListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySystem2ProfitMonthDetailPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxySystem2ProfitMonthDetailPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/system2/profit/monthDetail',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxySystem2ProfitMonthDetailPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2ProfitMonthDetailPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }



  static void proxySystem2MainTransferOutDataPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/proxy/system2/main/transferOutData',
      options: options,
      info: info,
      success: (Response r) {
        ProxySystem2MainTransferOutDataPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2MainTransferOutDataPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySystem2BankerHandicapSwitchPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxySystem2BankerHandicapSwitchPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/system2/banker/handicapSwitch',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxySystem2BankerHandicapSwitchPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2BankerHandicapSwitchPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySystem2BankerSettingUpdatePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxySystem2BankerSettingUpdatePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/system2/banker/settingUpdate',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxySystem2BankerSettingUpdatePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2BankerSettingUpdatePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySystem2MainTransferInDataPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/proxy/system2/main/transferInData',
      options: options,
      info: info,
      success: (Response r) {
        ProxySystem2MainTransferInDataPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2MainTransferInDataPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySystem2BankerInventoryOrderListPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxySystem2BankerInventoryOrderListPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/system2/banker/inventoryOrderList',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxySystem2BankerInventoryOrderListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2BankerInventoryOrderListPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void proxySystem2BankerPreSettlementPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxySystem2BankerPreSettlementPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/system2/banker/preSettlement',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxySystem2BankerPreSettlementPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2BankerPreSettlementPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySystem2OrderDataPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/proxy/system2/order/data',
      options: options,
      info: info,
      success: (Response r) {
        ProxySystem2OrderDataPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2OrderDataPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySystem2OrderInventoryOrderListPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxySystem2OrderInventoryOrderListPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/system2/order/inventoryOrderList',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxySystem2OrderInventoryOrderListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2OrderInventoryOrderListPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void proxySystem2BankerDataPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/proxy/system2/banker/data',
      options: options,
      info: info,
      success: (Response r) {
        ProxySystem2BankerDataPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySystem2BankerDataPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }
}
