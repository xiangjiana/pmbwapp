import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:flutter/material.dart';

class LoginBodyWrapper extends StatelessWidget {
  final Widget child;

  const LoginBodyWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: child,
        ),
      ],
    );
  }
}
