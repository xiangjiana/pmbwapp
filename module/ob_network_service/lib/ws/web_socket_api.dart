//对外报漏api
import 'dart:convert';

import 'utils/format_utils.dart';
import 'utils/web_socket.dart';

class WebSocketAPI {
  static void heartRequest(
      {required int playerId, required Map<String, dynamic> body}) {
    WebSocketUtil.AesEncodeDataString(
      Map<String, dynamic>.from(
          {'commandId': 1, 'playerId': playerId, 'body': body.toString()}),
    );
  }
}
