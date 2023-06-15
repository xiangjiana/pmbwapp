import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_base/src/ob/utils/cool_down_manager.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:ob_component/src/ob_widget/overflow_padding/overflow_padding.dart';
import 'package:ob_component/src/ob_widget/update_dialog/progress_controller.dart';
import 'package:get/get.dart';

import 'progress_button.dart';

/// 升级对话框
class UpdateDialog extends StatefulWidget {
  ///
  const UpdateDialog({
    Key? key,
    required this.content,
    required this.version,
    required this.progressBuilder,
    required this.controller,
    required this.onDownload,
    required this.onInstall,
    required this.onClose,
    required this.isDismissible,
  }) : super(key: key);

  /// 升级内容
  final Widget content;

  /// 升级版本
  final Widget version;

  /// 进度控制器
  final ProgressController controller;

  ///
  final ProgressWidgetBuilder progressBuilder;

  /// 点击更新回调
  final VoidCallback onDownload;

  /// 点击升级回调
  final VoidCallback onInstall;

  ///
  final VoidCallback onClose;

  final bool isDismissible;

  @override
  UpdateDialogState createState() => UpdateDialogState();
}

class UpdateDialogState extends State<UpdateDialog> {
  bool isProgressButtonVisible = false;
  bool needTipPleaseTryAgain = false;
  late GestureTapCallback onTap;

  setNeedTipPleaseTryAgain(
      bool needTipPleaseTryAgain, GestureTapCallback onTap) {
    this.needTipPleaseTryAgain = needTipPleaseTryAgain;
    this.onTap = onTap;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 327.w,
        decoration: BoxDecoration(
          color: ObTheming.obDialogBgColor,
          border: const Border(
            left: BorderSide(color: Colors.white10),
            right: BorderSide(color: Colors.white10),
            bottom: BorderSide(color: Colors.white10),
            top: BorderSide(color: Colors.white10),
          ),
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(8),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildHeader(),
            widget.content,
            SizedBox(height: 16.w),
            if (widget.isDismissible)
              _buildForceUpgradeButton()
            else
              _buildRecommendUpgradeButton(),
            SizedBox(height: 16.w),
          ],
        ),
      ),
    );
  }

  Stack _buildHeader() {
    return Stack(
      children: <Widget>[
        OverflowPadding(
          padding: const EdgeInsets.only(top: -82),
          child: Image.asset(
            'assets/images/icon/bg_dialog_update.png',
            fit: BoxFit.fill,
            width: 327,
            package: 'ob_component',
          ),
        ),
        Positioned(
          top: 16.w,
          right: 16.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(height: 18.w),
              Text(
                'new_version_found'.tr,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: 6.w),
              widget.version,
              SizedBox(height: 12.w),
            ],
          ),
        )
      ],
    );
  }

  //强制
  Widget _buildForceUpgradeButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GestureDetector(
        onTap: () {
          if (needTipPleaseTryAgain) {
            needTipPleaseTryAgain = false;
            onTap();
          } else {
            _onUpgrade();
          }
        },
        child: OBaseProgressButton(
          progress: widget.controller.value,
          builder: needTipPleaseTryAgain
              ? (BuildContext context, double progress) {
                  return Text("click_retry".tr);
                }
              : widget.progressBuilder,
        ),
      ),
    );
  }

  //推荐升级
  Widget _buildRecommendUpgradeButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Visibility(
            visible: !isProgressButtonVisible,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: OBasePrimaryButton(
                    size: ButtonSize.large,
                    image: DecorationImage(
                      image: AssetImage(Assets.images.btnbg3.path,
                          package: BaseX.pkg),
                      fit: BoxFit.fill,
                    ),
                    onPressed: widget.onClose,
                    child: Text('skip'.tr),
                  ),
                ),
                SizedBox(width: 25.w),
                Expanded(
                  child: OBasePrimaryButton(
                      size: ButtonSize.large,
                      onPressed: _onUpgrade,
                      image: DecorationImage(
                        image: AssetImage(
                          Assets.images.btnbg.path,
                          package: BaseX.pkg,
                        ),
                        fit: BoxFit.fill,
                      ),
                      //更新 立即更新，文案区别，电竞用立即更新文案，别的用更新
                      child: Text(
                        Store.clientId == Store.clientIdDJ
                            ? 'renew_right_now'.tr
                            : 'renew'.tr,
                      )),
                ),
              ],
            ),
          ),
          Visibility(
            visible: isProgressButtonVisible,
            child: GestureDetector(
              onTap: () {
                if (needTipPleaseTryAgain) {
                  needTipPleaseTryAgain = false;
                  onTap();
                  return;
                }
                if (widget.controller.value >= 1) {
                  widget.onInstall();
                }
              },
              child: OBaseProgressButton(
                progress: widget.controller.value,
                builder: needTipPleaseTryAgain
                    ? (BuildContext context, double progress) {
                        return Text("click_retry".tr);
                      }
                    : widget.progressBuilder,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onUpgrade() {
    if (CoolDownManager.handler(key: 'UpgradeApp', duration: 3000)) {
      //如果progress 为0 调用下载更新, 为1调起跳转安装
      if (widget.controller.value == 0) {
        widget.onDownload();
      }
      if (widget.controller.value >= 1) {
        widget.onInstall();
      }
      if (!Platform.isIOS) {
        setState(() {
          isProgressButtonVisible = true;
        });
      }
    }
  }
}
