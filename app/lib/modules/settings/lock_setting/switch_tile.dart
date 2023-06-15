import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';
import 'package:ob_package/modules/settings/setting/component/setting_tile.dart';
import 'package:ob_com_finance/src/modules/finance/transfer/component/expansion.dart';

class SwitchTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool value;
  final List<SettingTile> children;
  final ValueChanged<bool> onChanged;

  const SwitchTile(
      {Key? key,
      required this.title,
      this.subtitle,
      required this.value,
      required this.onChanged,
      this.children = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expansion(
        header: Container(
          height: 68.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    if (subtitle != null) SizedBox(height: 4.w),
                    if (subtitle != null)
                      Text(
                        'lock_setting_can_use_gesture_password'.tr,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                  ],
                ),
              ),
              ObSwitch(value: value, onChanged: onChanged),
            ],
          ),
        ),
        children: children,
        isExpand: value);
  }
}
