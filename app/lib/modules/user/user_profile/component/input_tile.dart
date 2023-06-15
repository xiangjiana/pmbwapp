import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';

class InputTile extends StatelessWidget {
  final String label;
  final String hint;
  final bool enabled;
  final bool readOnly;
  final TextEditingController? controller;
  final VoidCallback? onPress;
  final VoidCallback? onEditingComplete;

  const InputTile({
    Key? key,
    required this.label,
    this.hint = '',
    this.enabled = false,
    this.readOnly = false,
    this.controller,
    this.onPress,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 56.w,
        width: double.infinity,
        child: Row(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 56.w),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.6),
                  height: 1.1,
                ),
              ),
            ),
            SizedBox(width: 40.w),
            Expanded(
              child: TextField(
                readOnly: readOnly,
                enabled: enabled,
                controller: controller,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
                onEditingComplete: onEditingComplete,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isCollapsed: true,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  hintText: hint,
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.3),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
