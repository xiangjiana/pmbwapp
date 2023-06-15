import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class FilterTagItem extends StatelessWidget {
  final int index;
  final String text;
  final int id;
  final Color? checkedColor;
  final Color? defaultColor;
  final bool checked;
  final ValueChanged<int>? onTap;

  FilterTagItem({
    Key? key,
    required this.text,
    this.index = -1,
    this.id = -1,
    this.checkedColor,
    this.defaultColor,
    this.checked = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (onTap != null) onTap!(id);
      },
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: checked
              ? checkedColor ?? Color(0xFFFF5722).withOpacity(0.1)
              : defaultColor ?? ColorName.white.withOpacity(0.04),
          borderRadius: BorderRadius.circular(18.w),
        ),
        child: Text(
          '$text',
          style: TextStyle(
            fontSize: 14,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w400,
            color: checked
                ? checkedColor ?? Color(0xFFFF5722)
                : defaultColor ?? ColorName.white.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}
