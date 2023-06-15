import 'package:flutter/material.dart' hide PageController;
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class SelectListTile extends StatelessWidget {
  final Widget? leading;
  final double? height;
  final Widget title;
  final bool selected;

  const SelectListTile({
    Key? key,
    this.selected = false,
    this.height,
    this.leading,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      height: height ?? 48.w,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.06),
          ),
        ),
      ),
      child: Row(
        children: [
          if (leading != null) leading!,
          if (leading != null)
            SizedBox(
              width: 12.w,
            ),
          Expanded(
            child: title,
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
