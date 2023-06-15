import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_finance/src/modules/finance/account/account_controller.dart';
import 'package:ob_com_finance/src/modules/finance/account/component/dic.dart';
import 'package:ob_com_finance/src/modules/finance/account/component/usdt_list_item.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:collection/collection.dart';
import 'add_account_button.dart';

class USDTTab extends GetView<AccountController> {
  const USDTTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'usdt_limit'.tr,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 12,
            ),
          ),
          Obx(() => ListView(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: controller.usdts
                    .take(3)
                    .mapIndexed((index, element) => Transform.translate(
                          offset: Offset(0, -4.0 * index),
                          child: USDTListItem(
                            usdt: element,
                            colors: USDT_GRADIENT_COLOR_DIC_T[index],
                          ),
                        ))
                    .toList(),
              )),
          Obx(
            () => Visibility(
              visible: controller.usdts.length < 3,
              child: GestureDetector(
                onTap: () => controller.navigateAddBankAccount(
                    "${AppRoutes.ACCOUNT}${AppRoutes.CRYPTOCURRENCY}", "USDT"),
                child: AddAccountButton(
                  label: 'add_virtual_account'.tr,
                  margin: EdgeInsets.only(
                    top: 24.w,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
