import 'dart:async';

import 'package:flutter/foundation.dart';

typedef Request = FutureOr<void> Function();

Future<void> netRunCatch(Request request) async {
  try {
    await request();
  } catch (e) {
    debugPrint(e.toString());
  }
}
