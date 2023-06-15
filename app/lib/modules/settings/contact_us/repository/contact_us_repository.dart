import 'dart:async';

import 'package:config/config.dart';
import 'package:get/get.dart';
import 'package:ob_com_http/src/gen/api/config_apis.dart';
import 'package:ob_com_http/src/gen/mod/config/config_publicResources_post_resp_model.dart';

class ContactRepository {
  final configApi = Get.find<ConfigApi>();

  // Future<ConfigPublicResourcesPostRespModel> getConfigRes(int resourcesType) {
  //   final completer = Completer<ConfigPublicResourcesPostRespModel>();
  //   ConfigApis.configPublicResourcesPost(
  //     parameters: {'resourcesType': resourcesType},
  //     success: (ConfigPublicResourcesPostRespModel res) =>
  //         completer.complete(res),
  //     fail: (code, msg) => completer.completeError(msg),
  //   );
  //   return completer.future;
  // }
}
