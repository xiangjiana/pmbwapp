import 'dart:async';

import 'overlay_extension.dart';

typedef Request = FutureOr<void> Function();
typedef OnError = void Function(dynamic e);

Future<void> runCatch(
  Request request, {
  OnError? onError,
  OnError? handleError,
}) async {
  try {
    await request();
  } catch (e) {
    handleError?.call(e);

    if (null == onError) {
      dismissAll();
      //showToast(e.toString());
    } else {
      onError.call(e);
    }
  }
}



