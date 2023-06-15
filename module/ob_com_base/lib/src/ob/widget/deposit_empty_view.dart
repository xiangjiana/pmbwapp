import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart' hide PrimaryButton;
import 'package:ob_com_base/src/ob/public_resources.dart';
import 'package:ob_component/ob_component.dart';

class DepositEmptyView extends StatelessWidget {
  const DepositEmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        pkObImage(
          Assets.images.queDepositEmpty.path,
          width: 234.w,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            'no_deposit_channels_are_currently_available'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(height: 16.w),
        OBasePrimaryButton(
          onPressed: () {
            PublicResources.jumpToMemberServicePage();
          },
          image: DecorationImage(
            image: AssetImage(Assets.images.btnbg.path, package: BaseX.pkg),
            fit: BoxFit.fill,
          ),
          child: Text(
            'login_help'.tr,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
