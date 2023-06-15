import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:repository/utils/net.dart';
import 'package:sp_util/sp_util.dart';

import 'components/device_info_page.dart';
import 'crash_log_manager_page.dart';
import 'network_log_manager_page.dart';
import 'proxy_set_page.dart';

class CryptoController extends GetxController {
  RxBool flag;
  final _isCacheSettingOpen = true.obs;

  get isCacheSettingOpen => _isCacheSettingOpen.value;

  set isCacheSettingOpen(value) => _isCacheSettingOpen.value = value;

  RxString appCurrency = "CNY".obs;


  @override
  void onInit() {
    appCurrency.value =
    SpUtil.getString(Constants.appCurrency, defValue: Store.merchantCurrency)!;
    super.onInit();
  }

  ///自增
  void change(bool val) {
    flag.value = val;
    Net().setOpenCrypto = val;
    SpUtil.putBool('openCrypto', val);
    print(flag.value);
    print(Net().openCrypto);
  }

  CryptoController(this.flag);

  void toggleCacheSetting() {
    isCacheSettingOpen = !isCacheSettingOpen;
    Net().openCache = isCacheSettingOpen;
  }
}

class DebugPage extends StatelessWidget {
  const DebugPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool val = SpUtil.getBool('openCrypto') ?? false;
    Net().setOpenCrypto = val;
    final cryptoController = Get.put(CryptoController(val.obs));
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      body: Column(
        children: [
          ObTitleBar(title: "Debug页面"),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // Center(child: EvnSelectButton()),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(ProxySetPage());
                    },
                    child: Text(
                      "delegate_settings".tr,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(NetworkLogManagerPage());
                    },
                    child: Text(
                      "network_log_manage".tr,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(CrashLogManagerPage());
                    },
                    child: Text(
                      "crash_log_manage".tr,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(DeviceInfoPage());
                    },
                    child: Text(
                      "device_info".tr,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Obx(() =>
                    Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  cryptoController.flag.value == true
                                      ? '加密已开启'
                                      : '加密未开启',
                                  style: TextStyle(color: Colors.white)),
                              Switch(
                                  value: cryptoController.flag.value,
                                  onChanged: (newValue) {
                                    print(newValue);
                                    print('1');
                                    cryptoController.change(newValue);
                                  })
                            ]))),
                Obx(() =>
                    Center(
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Text(
                                cryptoController.isCacheSettingOpen
                                    ? '缓存已开启'
                                    : '缓存未开启',
                                style: TextStyle(color: Colors.white)),
                            Switch(
                              value: cryptoController.isCacheSettingOpen,
                              onChanged: (b) =>
                                  cryptoController.toggleCacheSetting(),
                            )
                          ],
                        ))),
                Obx(
                      () =>
                      Center(
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Text(Store.isUmeShow.value
                                ? '关闭应用内调试工具'
                                : '开启应用内调试工具',
                                style: TextStyle(color: Colors.white)),
                            Switch(
                              value: Store.isUmeShow.value,
                              onChanged: (b) {
                                Store.isUmeShow.value = b;
                              },
                            )
                          ],
                        ),
                      ),
                ),
                Obx(
                      () =>
                      Center(
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Text(Store.hideAgentSwitch.value == false
                                ? '已开启新代理入口'
                                : '已关闭新代理入口',
                                style: TextStyle(color: Colors.white)),
                            Switch(
                              value: Store.hideAgentSwitch.value,
                              onChanged: (b) {
                                Store.hideAgentSwitch.value = b;
                              },
                            )
                          ],
                        ),
                      ),
                ),


                Obx(() {
                  return Column(
                    children: [
                      SizedBox(height: 10),
                      Text("切换币种后重启app&H5强制刷新生效",style: TextStyle(color: Colors.red)),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          cryptoController.appCurrency.value = "CNY";
                          SpUtil.putString(Constants.appCurrency, 'CNY');
                        },
                        child:  Text("人民币${cryptoController.appCurrency.value=='CNY'?"√":""}",style: TextStyle(color: Colors.black)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          cryptoController.appCurrency.value = "VND";
                          SpUtil.putString(Constants.appCurrency, 'VND');
                        },
                        child:  Text("越南盾${cryptoController.appCurrency.value=='VND'?"√":""}",style: TextStyle(color: Colors.black)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          cryptoController.appCurrency.value = "THB";
                          SpUtil.putString(Constants.appCurrency, 'THB');
                        },
                        child:  Text("泰铢${cryptoController.appCurrency.value=='THB'?"√":""}",style: TextStyle(color: Colors.black)),
                      ),

                    ],
                  );
                })


              ],
            ),
          ),
        ],
      ),
    );
  }
}
