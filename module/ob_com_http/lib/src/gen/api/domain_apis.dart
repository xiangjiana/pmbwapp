import 'package:ob_com_http/src/adaptor/domain/domain_getActivitySharingDomainLink_post_resp_adaptor.dart';
import 'package:ob_com_http/src/adaptor/domain/domain_getFriendInvitationDomainLink_post_resp_adaptor.dart';
import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';

class DomainApis {
  static void domainGetActivitySharingDomainLinkPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/activity/getActivitySharingDomainLink',
      options: options,
      info: info,
      success: (Response r) {
        DomainGetActivitySharingDomainLinkPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        DomainGetActivitySharingDomainLinkPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }

  static void domainGetFriendInvitationDomainLinkPost({
    Map<String, dynamic>? info,
    Options? options,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      '/domainNameConfig/getFriendInvitationDomainLink',
      options: options,
      info: info,
      success: (Response r) {
        DomainGetFriendInvitationDomainLinkPostRespAdaptor.onSuccess(
            r.data,
            success,
            r.statusCode,
            r.headers.value('exp') == null
                ? 0
                : int.parse(r.headers.value('exp')!));
      },
      fail: (int code, String msg) {
        DomainGetFriendInvitationDomainLinkPostRespAdaptor.onFail(
            code, msg, fail);
      },
    );
  }
}
