import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GataLoading extends StatelessWidget {
  const GataLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Lottie.asset(
          Assets.lottie.loading,
          package: BaseX.pkg,
          width: 72.w,
          height: 72.w,
          repeat: true,
        ),
      ],
    );
  }
}
