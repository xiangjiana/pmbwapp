import 'package:ob_com_base/ob_com_base.dart';

import 'package:get/get.dart';

class GoUtils {
  ///充值
  static goDeposit() {

    Get.toNamed(AppRoutes.DEPOSIT_EASY);

    // showLoading();
    // ConfigApis.configClientConfigAllPost(
    //   parameters: {'resourcesType': '0'},
    //   success: (ConfigClientConfigAllPostRespModel resp) {
    //     Store.isTyPayOn = ObUtils.checkPayMerchant(resp.payMerchant);
    //     Store.payMerchant = resp.payMerchant;
    //     if (Store.isTyPayOn) {
    //       UserDepositGetTyWalletUrl.post(
    //         Store.deviceId,
    //         success: (String url) {
    //           dismissAll();
    //           Store.tyPayUrl = url;
    //           try {
    //             WebUtil.openInApp(
    //               url,
    //               showTitle: false,
    //               title: '',
    //               hasLoading: false,
    //               showToolbar: false,
    //             );
    //           } catch (e) {
    //             e.toString();
    //           }
    //         },
    //         fail: (int code, String msg) {
    //           dismissAll();
    //           showToast(msg);
    //         },
    //       );
    //     } else {
    //       dismissAll();
    //       Get.toNamed(AppRoutes.DEPOSIT_EASY);
    //     }
    //   },
    //   fail: (int code, String msg) {
    //     dismissAll();
    //     showToast(msg);
    //   },
    // );
  }

  ///[bizType] OB旗舰代理必填,充值类型(6=佣金充值,7=额度充值,8=代客充值)
  static goAgentDeposit(int bizType, {double? balance}) {

    if (null == balance) {
      Get.toNamed(AppRoutes.AGENT_N_ACCOUNT_CHARGE);
    } else {
      ///佣金充值
      Get.toNamed(
        AppRoutes.AGENT_N_ACCOUNT_CHARGE,
        arguments: {"balance": balance, "chargeType": 2},
      );
    }

    // showLoading();
    // ConfigApis.configClientConfigAllPost(
    //   parameters: {'resourcesType': '0'},
    //   success: (ConfigClientConfigAllPostRespModel resp) {
    //     Store.isTyPayOn = ObUtils.checkPayMerchant(resp.payMerchant);
    //     Store.payMerchant = resp.payMerchant;
    //
    //     if (Store.isTyPayOn) {
    //       ProxyGetTyPayWalletUrl.post(
    //         Store.deviceId,
    //         bizType,
    //         success: (String url) {
    //           dismissAll();
    //           Store.agentTyPayUrl = url;
    //           try {
    //             WebUtil.openInApp(
    //               url,
    //               showTitle: false,
    //               title: '',
    //               hasLoading: false,
    //               showToolbar: false,
    //             );
    //           } catch (e) {
    //             e.toString();
    //           }
    //         },
    //         fail: (int code, String msg) {
    //           dismissAll();
    //           showToast(msg);
    //         },
    //       );
    //     } else {
    //       dismissAll();
    //       if (null == balance) {
    //         Get.toNamed(AppRoutes.AGENT_N_ACCOUNT_CHARGE);
    //       } else {
    //         ///佣金充值
    //         Get.toNamed(
    //           AppRoutes.AGENT_N_ACCOUNT_CHARGE,
    //           arguments: {"balance": balance, "chargeType": 2},
    //         );
    //       }
    //     }
    //   },
    //   fail: (int code, String msg) {
    //     dismissAll();
    //     showToast(msg);
    //   },
    // );
  }
}
