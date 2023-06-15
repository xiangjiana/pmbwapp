import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
class PickerTitle extends StatelessWidget {
  ///
  const PickerTitle({
    Key? key,
    this.confirmText,
    this.cancelText,
    this.onConfirmListener,
    this.onCancelListener,
  }) : super(key: key);

  /// 确定按钮文字
  final String? confirmText;

  /// 取消按钮文字
  final String? cancelText;

  /// 确定按钮点击事件
  final VoidCallback? onConfirmListener;

  /// 取消按钮点击事件
  final VoidCallback? onCancelListener;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white.withOpacity(0.04),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: onCancelListener,
              child: Text(
                cancelText ?? 'cancel'.tr,
                style: const TextStyle(color: Colors.white60, fontSize: 14),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: onConfirmListener,
              child: Text(
                confirmText ?? 'confirm'.tr,
                style: const TextStyle(color: Colors.white60, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
