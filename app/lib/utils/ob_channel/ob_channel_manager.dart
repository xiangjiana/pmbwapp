import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ob_package/initializer/network_initializer.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/utils/GameUtils.dart';
import 'package:ob_package/utils/ob_channel/native_configure.dart';
import 'ob_messages.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/scheduler.dart';

typedef EventListener = Future<dynamic>? Function(String key, Map arguments);

BasicMessageChannel<Object?> _obFlutterChannel = BasicMessageChannel<Object?>(
    'game.ob.flutter.pigeon.sendEvent', StandardMessageCodec());
GameUtils gameUtils = GameUtils();

class OBChannelManager {
  OBChannelManager._privateConstructor();

  static final OBChannelManager _instance =
      OBChannelManager._privateConstructor();

  static OBChannelManager get instance {
    return _instance;
  }

  final Map<String, List<EventListener>> _listenersTable =
      <String, List<EventListener>>{};

  static void setup() {
    {
      _obFlutterChannel.setMessageHandler((Object? message) async {
        assert(message != null,
            'Argument for game.ob.flutter.pigeon.sendEvent was null. Expected CommonParams.');
        try {
          final CommonParams input = CommonParams.decode(message!);
          var key = input.key;
          Map? arguments = input.arguments;
          if (arguments == null) arguments = {};
          if (key == null) {
            return;
          }
          if (kDebugMode) {
            print('v key=====$key');
            print('flutter channel arg=====${arguments.toString()}');
          }
          switch (key) {
            case NativeEvent.eventSyncWalletAmount:
              gameUtils.asynWalletAmount();
              break;
            case "gameUtilInit":
              Store.nativeRouting = AppRoutes.GAME;
              gameUtils.onInit(arguments);
              break;
            case "onClickReload":
              gameUtils.refresh();
              break;
            case "gameUtilDestory":
              Store.nativeRouting = "";
              gameUtils.onClose();
              break;
            case NativeEvent.systeminfo:
              NetworkInitializer.userAgent = arguments;
              break;
            case NativeEvent.eventIdentifierAutoTransfer:
              gameUtils.autoTransfer(arguments, key);
              break;
            case NativeEvent.eventGetWaterInfo:
              gameUtils.getWaterInfo(arguments, key);
              break;
            case NativeEvent.eventIdentifierWalletList:
              gameUtils.getWallerList(arguments, key);
              break;
            case NativeEvent.eventIdentifierTransferAction:
              gameUtils.transferAction(arguments);
              break;
            case NativeEvent.eventDialogTransferAction:
              gameUtils.dialogTransferAction(arguments);
              break;
            case NativeEvent.eventIdentifierRecycleAll:
              gameUtils.recycleAll(arguments);
              break;
            case NativeEvent.eventIdentifierGameTypeList:
              gameUtils.onGameTypeList(arguments);
              break;
            case NativeEvent.webViewPageEvent_seturl:
              gameUtils.webViewPageEventSetUrlGameLogin(arguments);
              break;
            case NativeEvent.customerServiceUrl:
              gameUtils.toCustomerPage(arguments);
              break;
            case NativeEvent.eventIdentifierDyGameList:
              gameUtils.onDyGameList(arguments);
              break;
          }
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
        }
        return;
      });
    }
  }

  void sendEventToNative(String key, Map args) {
    if (kIsWeb) return;
    var params = CommonParams()
      ..key = key
      ..arguments = Map<String, dynamic>.from(args);
    _sendEventChannelToNative(params);
  }

  Future<void> _sendEventChannelToNative(CommonParams arg) async {
    try {
      final Object encoded = arg.encode();
      final Map<Object?, Object?>? replyMap =
          await _obFlutterChannel.send(encoded) as Map<Object?, Object?>?;
      if (replyMap == null) {
        throw PlatformException(
          code: 'channel-error',
          message: 'Unable to establish connection on channel.',
          details: null,
        );
      } else if (replyMap['error'] != null) {
        final Map<Object?, Object?> error =
            (replyMap['error'] as Map<Object?, Object?>?)!;
        throw PlatformException(
          code: (error['code'] as String?)!,
          message: error['message'] as String?,
          details: error['details'],
        );
      } else {
        // noop
      }
    } catch (e) {
      print("${e.toString()}");
    }
  }

  ///Add event listener in flutter side with a [key] and [listener]
  VoidCallback addEventListener(String key, EventListener listener) {
    assert(key != null && listener != null);

    var listeners = _listenersTable[key];
    if (listeners == null) {
      listeners = [];
      _listenersTable[key] = listeners;
    }

    listeners.add(listener);

    return () {
      listeners!.remove(listener);
    };
  }
}
