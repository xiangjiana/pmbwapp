import 'package:flutter/material.dart';
import 'package:ob_com_base/src/get/ui_state.dart';
import 'package:get/get.dart';

abstract class MyBasePage {
  Widget stateObx({
    required Rx<UIState> uiState,
    required Widget child,
  }) {
    return Obx(() {
      var vUIState = uiState.value;
      if (vUIState is UILoading) {
        showLoading();
      } else if (vUIState is UIIdle) {
        hideLoading();
      } else if (vUIState is UIToast) {
        hideLoading();
        showToast(vUIState.msg);
      } else if (vUIState is UIAction) {
        hideLoading();
        onAction(vUIState);
      } else {
        throw Exception('Unknown UIState');
      }
      return child;
    });
  }

  void showLoading() {}

  void hideLoading() {}

  void showToast(String msg) {}

  void onAction(UIAction action) {}
}

abstract class MyBaseStatelessPage extends StatelessWidget with MyBasePage {
  final dynamic arguments;

  const MyBaseStatelessPage({Key? key, this.arguments}) : super(key: key);
}

abstract class MyBaseStatefulPage extends StatefulWidget {
  final dynamic arguments;

  const MyBaseStatefulPage({Key? key, this.arguments}) : super(key: key);
}

abstract class MyBaseState<T extends StatefulWidget> extends State<T> with WidgetsBindingObserver, MyBasePage {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  ///整个app的生命周期，跟页面无关
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        onForeground();
        break;
      case AppLifecycleState.inactive:
        onInactive();
        break;
      case AppLifecycleState.paused:
        onBackground();
        break;
      case AppLifecycleState.detached:
        onDetached();
        break;
    }
  }

  void onForeground() {}

  void onBackground() {}

  void onInactive() {}

  void onDetached() {}
}
