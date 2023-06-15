import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';

class AuthClick extends StatelessWidget {
  final GestureTapCallback? onTap;

  const AuthClick({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final authService = Get.find<AuthService>();
        if (authService.isLogin) {
          onTap?.call();
        }
      },
    );
  }
}
