import 'package:flutter/material.dart' hide PageController;
import 'package:ob_component/ob_component.dart' hide ObTheme;

class ObSwitchTile extends StatelessWidget {
  final Widget title;
  final Widget? subtitle;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const ObSwitchTile(
      {Key? key,
      required this.title,
      this.subtitle,
      required this.initialValue,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 73.w,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title,
                if (subtitle != null) SizedBox(height: 4.w),
                if (subtitle != null) subtitle!
              ],
            ),
          ),
          ObSwitch(value: initialValue, onChanged: onChanged),
        ],
      ),
    );
  }
}
