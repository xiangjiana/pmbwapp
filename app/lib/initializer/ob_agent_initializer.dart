import 'dart:async';

// import 'package:agent_ob_ui/agent_n/public/agent_n_ui.dart';
// import 'package:agent_ob_ui/utils/agent_store.dart';
import 'package:flavor/flavor.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_base/src/ob/utils/properties2.dart';

import 'app_initializer.dart';

class OBAgentInitializer extends AppInitializer {

  void syncAgentAppFlavor() {
    // TODO: Agent
    // var flavorStr = Flavor.I.getString(API_TYPE);
    // if (flavorStr != null) {
    //   if (flavorStr == 'qa') flavorStr = 'test';
    //   AgentStore.appFlavor = flavorStr;
    //
    //   switch (AgentStore.appFlavor) {
    //     case 'dev':
    //     case 'test':
    //     case 'pre':
    //       AgentStore.isProduction = false;
    //       break;
    //     case 'uat':
    //     case 'prod':
    //       AgentStore.isProduction = true;
    //       break;
    //   }
    // }
    //
    // // 1004 上线版本屏蔽新代理入口
    // Store.hideAgentSwitch.value = AgentStore.isProduction;
  }

  @override
  FutureOr<void> init() {
    syncAgentAppFlavor();
    // TODO: Agent
    ///初始化代理模块
    // AgentNUi.get().setup();
  }
}