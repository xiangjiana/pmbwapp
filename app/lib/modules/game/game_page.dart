import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_package/modules/game/game_controller.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:webview_flutter/webview_flutter.dart';

class GamePage extends GetView<GameController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameController>(
      assignId: true,
      builder: (logic) {
        return ObTheme(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Get.theme.backgroundColor,
            appBar: AppBar(
              backgroundColor: Get.theme.backgroundColor,
              centerTitle: false,
              title: Obx(() => _buildAppBarTitle(controller.title.value)),
              leading: _buildAppBarLeading(),
            ),
            body: _buildBodyWebView(),
          ),
        );
      },
    );
  }

  _buildBodyWebView() {
    return Column(
      children: [
        Expanded(
          child: _buildWebView(),
        ),
      ],
    );
  }

  _buildGoBackDialog() {
    // 让iOS WebView无法交互， 解决widget穿透问题
    return ObDialog.alert(
      title: 'alert'.tr,
      content: 'confirm_exit_game'.tr,
      onConfirmListener: () {
        Get.back(result: true);
      },
      onCancelListener: () {
        Get.back(result: false);
      },
    );
  }

  _buildAppBarTitle(String title) {
    return Text(
      title,
      style: TextStyle(color: Colors.white, fontSize: 18),
    );
  }

  _buildAppBarLeading() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        Get.back();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
  }

  _buildWebView() {
    return WebView(
      initialUrl: controller.url,
      javascriptMode: JavascriptMode.unrestricted,
      initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
    );
  }
}

class SlidingAppBar extends StatelessWidget {
  SlidingAppBar({
    Key? key,
    required Offset being,
    required Offset end,
    required this.controller,
    required this.child,
  }) : super(key: key) {
    //高度动画
    offset = Tween<Offset>(
      begin: being,
      end: end,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          1,
          curve: Curves.ease,
        ),
      ),
    );
  }

  late final Widget child;
  late final AnimationController controller;
  late final Animation<Offset> offset;

  Widget _buildAnimation(BuildContext context, child) {
    return SlideTransition(
      position: offset,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildAnimation(context, child);
  }
}

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({
    Key? key,
    required double being,
    required double end,
    required this.controller,
  }) : super(key: key) {
    //高度动画
    height = Tween<double>(
      begin: being,
      end: end,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          1,
          curve: Curves.ease,
        ),
      ),
    );
  }

  late final AnimationController controller;
  late final Animation<double> height;

  Widget _buildAnimation(BuildContext context, child) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: height.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
