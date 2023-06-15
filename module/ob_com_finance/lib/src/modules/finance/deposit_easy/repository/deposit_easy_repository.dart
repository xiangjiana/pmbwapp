import 'dart:async';
import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:config/config.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/deposit/repository/ui_pay_type.dart';
import 'package:params/params.dart';
import 'package:repository/utils/device_type.dart';
import 'package:wallet/wallet.dart';

class DepositEasyRepository {
  static final configApi = Get.find<ConfigApi>();
  static final walletApi = Get.find<WalletApi>();

  ///banner/字典/银行卡列表
  Future<ClientConfigResp> getConfigClientConfigAll() async {
    try {
      return configApi.clientConfigAll(
        ClientConfigParam(
          resourcesType: '0',
        ),
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<SubmitPayResp> postDeposit(
    String channelId,
    String paidAmount,
    int bizType,
    String realName,
    String virtualProtocol,{
    required String bankId,
  }) async {
    try {
      return walletApi.confirmPay(ConfirmPayParam(
        channelId: channelId,
        deviceNo: InstallDeviceType.platFormInfo.deviceId ?? '',
        realName: realName,
        paidAmount: double.parse(paidAmount),
        inGameDeposit: -1,
        bankId: bankId.isNotEmpty ? int.parse(bankId) : 0,
        clientType: InstallDeviceType.deviceType ?? 1,
        bizType: bizType > 0 ? bizType : null,
        virtualProtocol: virtualProtocol,
      ));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<PaymentChannelConfig>> getApiThirdPayChannel() async {
    try {
      return walletApi.channel();
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<UiPayType>> getAllChannel(
    Map<String, String> usdtAddressMap,
    RxString selectedProtocol,
  ) async {
    List<UiPayType> list = [];
    AuthService authService = Get.find();
    try {
      final resp = await getConfigClientConfigAll();
      final resDictInfoList = resp.configDictInfoList;
      if (resp.configDictInfoList.isNotEmpty) {
        for (var element in resDictInfoList) {
          Store.dictionary[element.key] = element.value;
        }
      }

      if (authService.authState is LoggedIn) {
        String? usdtJson = Store.clientId != Store.clientIdDJ
            ? Store.dictionary['deposit.usdt.protocol.address.obqj']
            : Store.dictionary['deposit.usdt.protocol.address.obdj'];

        if (usdtJson != null) {
          Map<String, dynamic> usdtMap =
              jsonDecode(usdtJson) as Map<String, dynamic>;
          List<String> addresskeys = usdtMap.keys.toList();
          addresskeys.removeWhere((element) =>
              (element != "OMNI" && element != "ERC20" && element != "TRC20") ||
              ObjectUtil.isEmpty(usdtMap[element]));

          String pictureJson = Store.clientId != Store.clientIdDJ
              ? Store.dictionary['deposit.resource.picture.url.obqj']
              : Store.dictionary['deposit.resource.picture.url.obdj'];
          Map<String, dynamic> pictureMap =
              jsonDecode(pictureJson) as Map<String, dynamic>;
          usdtAddressMap.clear();

          for (var key in addresskeys) {
            usdtAddressMap.putIfAbsent(key, () => usdtMap[key]);
          }

          if (addresskeys.isNotEmpty) {
            list.add(UiPayType(
                id: "2160",
                iconUrl: Assets.images.icon.iconDepositUsdt.path,
                name: 'USDT',
                picture: pictureMap["USDT"]));
            if (!usdtAddressMap.containsKey(selectedProtocol.value)) {
              selectedProtocol.value = "";
            }
            if (selectedProtocol.value == "") {
              selectedProtocol.value = addresskeys[0];
            }
          }
          list.add(UiPayType(
            iconUrl: Assets.images.icon.iconDepositBaimahui.path,
            id: "2161",
            name: 'baiMaHui'.tr,
            picture: pictureMap["BMH"],
          ));
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('==============getConfigClientChannel()===' + e.toString());
      }
    }

    try {
      final resp = await getApiThirdPayChannel();
      list.addAll(resp.map((e) => UiPayType.from(e)).toList());
    } catch (e) {
      if (kDebugMode) {
        print('==============getApiThirdPayChannel()===' + e.toString());
      }
    }

    return list;
  }
}
