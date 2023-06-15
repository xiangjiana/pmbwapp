import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ob_component/src/ob_widget/overflow_padding/overflow_padding.dart';
import 'package:ob_component/src/ob_widget/update_dialog/progress_button.dart';
import 'package:ob_component/src/ob_widget/update_dialog/progress_controller.dart';

/// 升级对话框
class UpdateDialog extends StatefulWidget {
  ///
  const UpdateDialog({
    required this.content,
    required this.version,
    required this.builder,
    Key? key,
    this.controller,
    this.onStartUpdate,
    this.onStartUpgrade,
    this.onCloseDialog,
  }) : super(key: key);

  /// 升级内容
  final Widget content;

  /// 升级版本
  final Widget version;

  /// 进度控制器
  final ProgressController? controller;

  ///
  final ProgressWidgetBuilder builder;

  /// 点击更新回调
  final VoidCallback? onStartUpdate;

  /// 点击升级回调
  final VoidCallback? onStartUpgrade;

  ///
  final VoidCallback? onCloseDialog;

  @override
  _UpdateDialogState createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<UpdateDialog> {
  late ProgressController _controller;
  late double _currentProgress;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? ProgressController(0);
    _currentProgress = _controller.value;
    _controller.addListener(() {
      setState(() {
        if (mounted) _currentProgress = _controller.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xff1D2933),
          border: Border(
            left: BorderSide(color: Colors.white10),
            right: BorderSide(color: Colors.white10),
            bottom: BorderSide(color: Colors.white10),
            top: BorderSide(color: Colors.white10),
          ),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(8),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              children: <Widget>[
                OverflowPadding(
                  padding: const EdgeInsets.only(top: -48),
                  child: Image.asset(
                    'assets/images/icon/bg_dialog_update.png',
                    fit: BoxFit.fill,
                    width: 327,
                    package: 'ob_component',
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: widget.onCloseDialog,
                        child: Image.asset(
                          'assets/images/icon/com_close_white.png',
                          fit: BoxFit.fitWidth,
                          width: 24,
                          height: 24,
                          package: 'ob_component',
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '发现新版本',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none),
                      ),
                      const SizedBox(height: 6),
                      widget.version,
                    ],
                  ),
                )
              ],
            ),
            Container(
              width: 327,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  widget.content,
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      if (_currentProgress == 0) {
                        widget.onStartUpdate?.call();
                      }
                      if (_currentProgress >= 1) {
                        widget.onStartUpgrade?.call();
                      }
                    },
                    child: ProgressButton(
                        progress: _currentProgress, builder: widget.builder),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
