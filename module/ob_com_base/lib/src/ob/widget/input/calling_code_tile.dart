import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_base/src/ob/widget/input/calling_code_select.dart';
import 'package:ob_com_base/src/ob/widget/ob_image.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class CallingCodeTile extends StatelessWidget {
  final UiCallingCode uiCallingCode;
  final bool selected;

  const CallingCodeTile(
      {Key? key, this.selected = false, required this.uiCallingCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      height: 48.w,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.06),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              uiCallingCode.name,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: selected ? 1 : 0,
            child: ObImage.asset(
              Assets.images.icon.comSelect.path,
              width: 20.w,
              height: 20.w,
            ),
          )
        ],
      ),
    );
  }
}
