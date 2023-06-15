import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class CustomizeSizeWidget extends StatelessWidget implements PreferredSizeWidget{

  CustomizeSizeWidget({
    Key? key,
    required this.visible,
    required this.child,
    double? height,
  })  :
        this.height = Size.fromHeight(visible ? height ?? 40.w : 0),
        super(key: key);

  final bool visible;
  final Size height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: visible,
        child:child,
    );
  }

  @override
  Size get preferredSize => height;

}