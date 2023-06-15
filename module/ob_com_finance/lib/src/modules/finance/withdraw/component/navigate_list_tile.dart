import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class NavigateListTile extends StatelessWidget {
  final Widget? leading;
  final Widget title;

  const NavigateListTile({Key? key, this.leading, required this.title})
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
            if (leading != null) leading!,
            if (leading != null)
              SizedBox(
                width: 12.w,
              ),
            Expanded(
              child: title,
            ),
            pkObImage(
              Assets.images.icon.homeMoreRight.path,
              width: 16,
            )
          ],
        ));
  }
}
