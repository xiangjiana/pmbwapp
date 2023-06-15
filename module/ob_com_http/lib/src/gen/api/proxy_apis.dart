import 'package:ob_com_http/src/adaptor/proxy/proxt_memberListDepositRecord_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxt_queryMaxRatio_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_member_list_deposit%20record_post_req_model.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyValidatePayPasswordUnlock_post_req_model.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_queryMaxRatio_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_selectInvitationCode_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_selectInvitationCode_post_req_model.dart';
import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyMerchantGameRate_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyContractAcceptContract_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyContractAcceptContract_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyUpdatePayPassword_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyUpdatePayPassword_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_rebateListPage_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_rebateListPage_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_selectProxyWithdrawAbleInfo_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyBalance_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyBalance_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyTransfer_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyTransfer_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_lowerProxyList_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_lowerProxyList_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyMaterialImageList_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyMaterialImageList_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyValidatePayPassword_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyValidatePayPassword_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_lowerMemberDiscountRecords_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_lowerMemberDiscountRecords_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyWithdrawRecordByVirtual_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyDepositRecord_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyDepositRecord_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyValidateBank_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyValidateBank_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxySelectBalance_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxySubordinateGameRecordGameGecord_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxySubordinateGameRecordGameGecord_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyTransferInner_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyTransferInner_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyOverflowMemberAddOverflowMember_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyOverflowMemberAddOverflowMember_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyContractContractManageList_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyContractContractManageList_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyOverflowMemberValidateUser_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyOverflowMemberValidateUser_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyGetWithdrawalRestrictions_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyGetWithdrawalRestrictions_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyFundsRecordsAccountChange_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyFundsRecordsAccountChange_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyValidateVirtual_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyValidateVirtual_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_contactAddFlygram_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_contactAddFlygram_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_multiAgentProxyQueryProxyNetAmountList_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_multiAgentProxyQueryProxyNetAmountList_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_commissionPayCommission_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_commissionPayCommission_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyGetSingleDeposit_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyContractReuseContract_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyContractReuseContract_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyMessageRead_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyMessageRead_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyCreatePayPassword_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyCreatePayPassword_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyQuickAmount_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_getDictList_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyAssitDeposit_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyAssitDeposit_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyQueryTransferRecordList_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyQueryTransferRecordList_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_commissionCommissionPaymentOrder_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_commissionCommissionPaymentOrder_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_commissionCommissionHistory_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_commissionCommissionHistory_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyMessageDetails_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyMessageDetails_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyWithdrawBank_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyWithdrawBank_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_multiAgentMemberQueryMemberNetAmountDetail_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_multiAgentMemberQueryMemberNetAmountDetail_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyContractContractRule_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyContractContractRule_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyWithdrawalRecord_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyWithdrawalRecord_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_assitDepositList_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_assitDepositList_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyMessageNotifyList_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyMessageNotifyList_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_rebatePayRebate_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_rebatePayRebate_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_rebateDetailPage_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_rebateDetailPage_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_multiAgentMemberQueryMemberNetAmount_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_multiAgentMemberQueryMemberNetAmount_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyDeposit_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyDeposit_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_lowerProxyAdd_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_lowerProxyAdd_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_contactAddQQ_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_contactAddQQ_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyDayRemainders_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyDayRemainders_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyMessageUnreadAmount_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyDomainQueryProxyDomain_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyDomainQueryProxyDomain_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyContractResendContract_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyContractResendContract_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_lowerMemberAddMember_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_lowerMemberAddMember_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_rebateUnReceive_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_rebateUnReceive_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyContractAddContract_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyContractAddContract_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyContractLowestContractProportion_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyContractLowestContractProportion_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyLogin_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyGetExchange_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_lowerProxyCurProxy_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_lowerProxyCurProxy_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyContractMyContract_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyContractMyContract_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_commissionCurrMonthCommissionBudget_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_commissionCurrMonthCommissionBudget_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyDepositList_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_lowerMemberList_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_lowerMemberList_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_queryChildProxyByName_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_queryChildProxyByName_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_lowerMemberGameRecords_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_lowerMemberGameRecords_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_multiAgentProxyGetVenueFees_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_multiAgentProxyGetVenueFees_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_multiAgentProxyQueryProxyNetAmountDetailDay_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_multiAgentProxyQueryProxyNetAmountDetailDay_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyWithdrawVirtual_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyWithdrawVirtual_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyMessageDelete_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyMessageDelete_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_CommissionVipRule_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyWithdrawRecordByBank_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_multiAgentProxyQueryProxyNetAmountDetail_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_multiAgentProxyQueryProxyNetAmountDetail_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxy_contract_contract_to_be_signed_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxysubstituteDepositRecord_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxysubstituteDepositRecord_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyContractCheckProxy_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyContractCheckProxy_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_newProxyDomain_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_newProxyDomain_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyProxyInfo_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_promotionLink_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_promotionLink_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyOverflowMemberListOverflowMember_post_resp_adaptor.dart';
import 'package:ob_com_http/src/gen/mod/proxy/proxy_proxyOverflowMemberListOverflowMember_post_req_model.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_vipGradeGetVipGrade_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_proxyGetSubSingleDeposit_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/proxy/proxy_rangesMoney_post_resp_adaptor.dart';

class ProxyApis {
  static void proxyProxyMerchantGameRatePost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/proxy/merchantGameRate',
      options: options,
      info: info,
      success: (Response r) {
        ProxyProxyMerchantGameRatePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyMerchantGameRatePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyContractAcceptContractPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyContractAcceptContractPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyContract/acceptContract',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyContractAcceptContractPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyContractAcceptContractPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyUpdatePayPasswordPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyUpdatePayPasswordPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/updatePayPassword',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyUpdatePayPasswordPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyUpdatePayPasswordPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyRebateListPagePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ProxyRebateListPagePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/rebate/listPage',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyRebateListPagePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyRebateListPagePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySelectProxyWithdrawAbleInfoPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/proxy/selectProxyWithdrawAbleInfo',
      options: options,
      info: info,
      success: (Response r) {
        ProxySelectProxyWithdrawAbleInfoPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySelectProxyWithdrawAbleInfoPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyBalancePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ProxyProxyBalancePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/balance',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyBalancePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyBalancePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxySelectInvitationCodePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ProxySelectInvitationCodePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/sign/selectInvitationCode',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxySelectInvitationCodePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxySelectInvitationCodePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyTransferPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ProxyProxyTransferPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/transfer',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyTransferPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyTransferPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyLowerProxyListPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ProxyLowerProxyListPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/lowerProxy/list',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyLowerProxyListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyLowerProxyListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyMaterialImageListPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyMaterialImageListPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyMaterialImage/list',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyMaterialImageListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyMaterialImageListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyValidatePayPasswordPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyValidatePayPasswordPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/validatePayPassword',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyValidatePayPasswordPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyValidatePayPasswordPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }


  static void validatePayPasswordUnlock({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyValidatePayPasswordUnlockPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/validatePayPasswordUnlock',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyValidatePayPasswordPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyValidatePayPasswordPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyLowerMemberDiscountRecordsPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyLowerMemberDiscountRecordsPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/lowerMember/discountRecords',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyLowerMemberDiscountRecordsPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyLowerMemberDiscountRecordsPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyWithdrawRecordByVirtualPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/proxy/withdrawRecordByVirtual',
      options: options,
      info: info,
      success: (Response r) {
        ProxyProxyWithdrawRecordByVirtualPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyWithdrawRecordByVirtualPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void proxyProxyDepositRecordPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyDepositRecordPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/deposit/record',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyDepositRecordPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyDepositRecordPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyValidateBankPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyValidateBankPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/validateBank',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyValidateBankPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyValidateBankPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxySelectBalancePost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/proxy/selectBalance',
      options: options,
      info: info,
      success: (Response r) {
        ProxyProxySelectBalancePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxySelectBalancePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxySubordinateGameRecordGameGecordPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxySubordinateGameRecordGameGecordPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/subordinateGameRecord/gameGecord',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxySubordinateGameRecordGameGecordPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxySubordinateGameRecordGameGecordPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void proxyProxyTransferInnerPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyTransferInnerPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/transferInner',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyTransferInnerPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyTransferInnerPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyOverflowMemberAddOverflowMemberPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyOverflowMemberAddOverflowMemberPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyOverflowMember/addOverflowMember',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyOverflowMemberAddOverflowMemberPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyOverflowMemberAddOverflowMemberPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void proxyProxyContractContractManageListPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyContractContractManageListPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyContract/contractManageList',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyContractContractManageListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyContractContractManageListPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void proxyProxyOverflowMemberValidateUserPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyOverflowMemberValidateUserPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyOverflowMember/validateUser',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyOverflowMemberValidateUserPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyOverflowMemberValidateUserPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void proxyProxyGetWithdrawalRestrictionsPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyGetWithdrawalRestrictionsPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/getWithdrawalRestrictions',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyGetWithdrawalRestrictionsPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyGetWithdrawalRestrictionsPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void proxyProxyFundsRecordsAccountChangePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyFundsRecordsAccountChangePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyFundsRecords/accountChange',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyFundsRecordsAccountChangePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyFundsRecordsAccountChangePostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void proxyProxyValidateVirtualPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyValidateVirtualPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/validateVirtual',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyValidateVirtualPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyValidateVirtualPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyContactAddFlygramPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyContactAddFlygramPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/contact/addFlygram',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyContactAddFlygramPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyContactAddFlygramPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyMultiAgentProxyQueryProxyNetAmountListPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyMultiAgentProxyQueryProxyNetAmountListPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/multiAgent/proxy/queryProxyNetAmountList',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyMultiAgentProxyQueryProxyNetAmountListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyMultiAgentProxyQueryProxyNetAmountListPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void proxyCommissionPayCommissionPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyCommissionPayCommissionPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/commission/payCommission',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyCommissionPayCommissionPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyCommissionPayCommissionPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyGetSingleDepositPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/proxy/getSingleDeposit',
      options: options,
      info: info,
      success: (Response r) {
        ProxyProxyGetSingleDepositPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyGetSingleDepositPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyContractReuseContractPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyContractReuseContractPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyContract/reuseContract',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyContractReuseContractPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyContractReuseContractPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyMessageReadPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ProxyProxyMessageReadPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyMessage/read',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyMessageReadPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyMessageReadPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyCreatePayPasswordPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyCreatePayPasswordPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/createPayPassword',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyCreatePayPasswordPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyCreatePayPasswordPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyQuickAmountPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/proxy/quick/amount',
      options: options,
      info: info,
      success: (Response r) {
        ProxyProxyQuickAmountPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyQuickAmountPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyGetDictListPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/wallet/proxy/getDictList',
      options: options,
      info: info,
      success: (Response r) {
        ProxyGetDictListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyGetDictListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyAssitDepositPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyAssitDepositPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/assitDeposit',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyAssitDepositPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyAssitDepositPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyQueryTransferRecordListPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyQueryTransferRecordListPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/queryTransferRecordList',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyQueryTransferRecordListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyQueryTransferRecordListPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void proxyCommissionCommissionPaymentOrderPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyCommissionCommissionPaymentOrderPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/commission/commissionPaymentOrder',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyCommissionCommissionPaymentOrderPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyCommissionCommissionPaymentOrderPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void proxyCommissionCommissionHistoryPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyCommissionCommissionHistoryPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/commission/commissionHistory',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyCommissionCommissionHistoryPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyCommissionCommissionHistoryPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyMessageDetailsPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyMessageDetailsPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyMessage/details',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyMessageDetailsPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyMessageDetailsPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyWithdrawBankPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyWithdrawBankPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/withdrawBank',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyWithdrawBankPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyWithdrawBankPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyMultiAgentMemberQueryMemberNetAmountDetailPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters
            is ProxyMultiAgentMemberQueryMemberNetAmountDetailPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/multiAgent/member/queryMemberNetAmountDetail',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyMultiAgentMemberQueryMemberNetAmountDetailPostRespAdaptor
            .onSuccess(
                r.data,
                success,
                r.statusCode,
                r.headers.value('exp') == null
                    ? 0
                    : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyMultiAgentMemberQueryMemberNetAmountDetailPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void proxyProxyContractContractRulePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyContractContractRulePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyContract/contractRule',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyContractContractRulePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyContractContractRulePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyWithdrawalRecordPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyWithdrawalRecordPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/withdrawal/record',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyWithdrawalRecordPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyWithdrawalRecordPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyAssitDepositListPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ProxyAssitDepositListPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/assitDepositList',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyAssitDepositListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyAssitDepositListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyMessageNotifyListPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyMessageNotifyListPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyMessage/notifyList',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyMessageNotifyListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyMessageNotifyListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyRebatePayRebatePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ProxyRebatePayRebatePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/rebate/payRebate',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyRebatePayRebatePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyRebatePayRebatePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyRebateDetailPagePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ProxyRebateDetailPagePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/rebate/detailPage',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyRebateDetailPagePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyRebateDetailPagePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyMultiAgentMemberQueryMemberNetAmountPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyMultiAgentMemberQueryMemberNetAmountPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/multiAgent/member/queryMemberNetAmount',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyMultiAgentMemberQueryMemberNetAmountPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyMultiAgentMemberQueryMemberNetAmountPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void proxyProxyDepositPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ProxyProxyDepositPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/deposit',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyDepositPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyDepositPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyLowerProxyAddPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ProxyLowerProxyAddPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/lowerProxy/add',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyLowerProxyAddPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyLowerProxyAddPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyContactAddQQPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ProxyContactAddQQPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/contact/addQQ',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyContactAddQQPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyContactAddQQPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyDayRemaindersPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyDayRemaindersPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/proxyDayRemainders',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyDayRemaindersPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyDayRemaindersPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyMessageUnreadAmountPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/proxyMessage/unreadAmount',
      options: options,
      info: info,
      success: (Response r) {
        ProxyProxyMessageUnreadAmountPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyMessageUnreadAmountPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyDomainQueryProxyDomainPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyDomainQueryProxyDomainPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyDomain/queryProxyDomain',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyDomainQueryProxyDomainPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyDomainQueryProxyDomainPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyContractResendContractPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyContractResendContractPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyContract/resendContract',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyContractResendContractPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyContractResendContractPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyLowerMemberAddMemberPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyLowerMemberAddMemberPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/lowerMember/addMember',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyLowerMemberAddMemberPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyLowerMemberAddMemberPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyRebateUnReceivePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ProxyRebateUnReceivePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/rebate/unReceive',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyRebateUnReceivePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyRebateUnReceivePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyContractAddContractPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyContractAddContractPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyContract/addContract',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyContractAddContractPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyContractAddContractPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyContractLowestContractProportionPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyContractLowestContractProportionPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyContract/lowestContractProportion',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyContractLowestContractProportionPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyContractLowestContractProportionPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void proxyProxyLoginPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/proxy/login',
      options: options,
      info: info,
      success: (Response r) {
        ProxyProxyLoginPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyLoginPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyGetExchangePost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/proxy/getExchange',
      options: options,
      info: info,
      success: (Response r) {
        ProxyProxyGetExchangePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyGetExchangePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyLowerProxyCurProxyPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyLowerProxyCurProxyPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/lowerProxy/curProxy',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyLowerProxyCurProxyPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyLowerProxyCurProxyPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyContractMyContractPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyContractMyContractPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyContract/myContract',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyContractMyContractPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyContractMyContractPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyCommissionCurrMonthCommissionBudgetPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyCommissionCurrMonthCommissionBudgetPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/commission/currMonthCommissionBudget',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyCommissionCurrMonthCommissionBudgetPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyCommissionCurrMonthCommissionBudgetPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void proxyProxyDepositListPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/proxy/deposit/list',
      options: options,
      info: info,
      success: (Response r) {
        ProxyProxyDepositListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyDepositListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyLowerMemberListPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ProxyLowerMemberListPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/lowerMember/list',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyLowerMemberListPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyLowerMemberListPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyQueryChildProxyByNamePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyQueryChildProxyByNamePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/queryChildProxyByName',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyQueryChildProxyByNamePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyQueryChildProxyByNamePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyLowerMemberGameRecordsPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyLowerMemberGameRecordsPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/lowerMember/gameRecords',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyLowerMemberGameRecordsPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyLowerMemberGameRecordsPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyMultiAgentProxyGetVenueFeesPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyMultiAgentProxyGetVenueFeesPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/multiAgent/proxy/getVenueFees',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyMultiAgentProxyGetVenueFeesPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyMultiAgentProxyGetVenueFeesPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyMultiAgentProxyQueryProxyNetAmountDetailDayPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters
            is ProxyMultiAgentProxyQueryProxyNetAmountDetailDayPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/multiAgent/proxy/queryProxyNetAmountDetailDay',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyMultiAgentProxyQueryProxyNetAmountDetailDayPostRespAdaptor
            .onSuccess(
                r.data,
                success,
                r.statusCode,
                r.headers.value('exp') == null
                    ? 0
                    : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyMultiAgentProxyQueryProxyNetAmountDetailDayPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void proxyProxyWithdrawVirtualPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyWithdrawVirtualPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/withdrawVirtual',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyWithdrawVirtualPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyWithdrawVirtualPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyMessageDeletePost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyMessageDeletePostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyMessage/delete',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyMessageDeletePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyMessageDeletePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyCommissionVipRulePost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/commission/vipRule',
      options: options,
      info: info,
      success: (Response r) {
        ProxyCommissionVipRulePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyCommissionVipRulePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyWithdrawRecordByBankPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/proxy/withdrawRecordByBank',
      options: options,
      info: info,
      success: (Response r) {
        ProxyProxyWithdrawRecordByBankPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyWithdrawRecordByBankPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyMultiAgentProxyQueryProxyNetAmountDetailPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters
            is ProxyMultiAgentProxyQueryProxyNetAmountDetailPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/multiAgent/proxy/queryProxyNetAmountDetail',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyMultiAgentProxyQueryProxyNetAmountDetailPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyMultiAgentProxyQueryProxyNetAmountDetailPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void proxyProxyContractContractToBeSignedPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/proxyContract/contractToBeSigned',
      options: options,
      info: info,
      success: (Response r) {
        ProxyProxyContractContractToBeSignedPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyContractContractToBeSignedPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void proxyProxysubstituteDepositRecordPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxysubstituteDepositRecordPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxy/substituteDeposit/record',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxysubstituteDepositRecordPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxysubstituteDepositRecordPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void proxyProxyContractCheckProxyPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyContractCheckProxyPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyContract/checkProxy',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyContractCheckProxyPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyContractCheckProxyPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyNewProxyDomainPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ProxyNewProxyDomainPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyDomain/newProxyDomain',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyNewProxyDomainPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyNewProxyDomainPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyProxyInfoPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/proxy/proxyInfo',
      options: options,
      info: info,
      success: (Response r) {
        ProxyProxyProxyInfoPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyProxyInfoPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyPromotionLinkPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ProxyPromotionLinkPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyMaterialImage/promotionLink',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyPromotionLinkPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyPromotionLinkPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyOverflowMemberListOverflowMemberPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyProxyOverflowMemberListOverflowMemberPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyOverflowMember/listOverflowMember',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyProxyOverflowMemberListOverflowMemberPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyOverflowMemberListOverflowMemberPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void proxyVipGradeGetVipGradePost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/vipGrade/getVipGrade',
      options: options,
      info: info,
      success: (Response r) {
        ProxyVipGradeGetVipGradePostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyVipGradeGetVipGradePostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyGetSubSingleDepositPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/proxy/getSubSingleDeposit',
      options: options,
      info: info,
      success: (Response r) {
        ProxyProxyGetSubSingleDepositPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyGetSubSingleDepositPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyRangesMoneyPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/proxy/ranges/money',
      options: options,
      info: info,
      success: (Response r) {
        ProxyRangesMoneyPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyRangesMoneyPostRespAdaptor.onFail(code, msg, fail);
      },
    );
  }

  static void proxyProxyContractQueryMaxRatioPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null && parameters is ProxyQueryMaxRatioPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/proxyContract/queryMaxRatio',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyQueryMaxRatioPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyProxyContractLowestContractProportionPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }
  static void memeberListDepositRecordPost({
    parameters,
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    if (parameters != null &&
        parameters is ProxyMemberListDepositRecordPostReqModel) {
      parameters = parameters.toJson();
    }

    Net().post(
      '/depositAndWithdrawal/deposit/memberRecord',
      options: options,
      params: parameters,
      info: info,
      success: (Response r) {
        ProxyMemberListDepositRecordPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        ProxyMemberListDepositRecordPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }
}
