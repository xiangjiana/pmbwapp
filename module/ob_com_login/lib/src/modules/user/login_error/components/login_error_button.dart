import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:ob_com_base/ob_com_base.dart';

class LoginErrorButton extends StatelessWidget {
  LoginErrorButton({
    this.onPressed,
    this.disabled = false,
  });

  final Function()? onPressed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? 0.3 : 1,
      child: Container(
        margin: EdgeInsets.only(top: 32.w),
        width: double.infinity,
        child: OBasePrimaryButton(
          size: ButtonSize.large,
          child: Text("login_error_button".tr,),
          image: DecorationImage(
            image: AssetImage(Assets.images.btnbg.path, package: BaseX.pkg),
            fit: BoxFit.fill,
          ),
          onPressed: onPressed,
          block: true,
        ),
      ),
    );
  }
}
