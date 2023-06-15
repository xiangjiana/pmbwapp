import 'package:collection/collection.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:get/get.dart';
import 'package:ob_com_finance/src/modules/finance/account/component/add_account_button.dart';
import 'package:ob_com_finance/src/modules/finance/account/component/bank_card_list_tile.dart';

import '../account_controller.dart';
import 'dic.dart';

class BankCardTab extends GetView<AccountController> {
  const BankCardTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'bank_card_limit'.tr,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 12,
                ),
              ),
              Visibility(
                visible: controller.bankCards.isNotEmpty,
                child: SizedBox(
                  height: 16.w,
                ),
              ),
              ...controller.bankCards
                  .take(3)
                  .mapIndexed((index, element) => Transform.translate(
                        offset: Offset(0, -4.0 * index),
                        child: BankCardListTile(
                          bank: element,
                          colors: BANK_CARD_GRADIENT_COLOR_DIC[index],
                        ),
                      ))
                  .toList(),
              Obx(
                () => Visibility(
                  visible: controller.bankCards.length < 3,
                  child: GestureDetector(
                    onTap: () => controller.navigateAddBankAccount(
                        "${AppRoutes.ACCOUNT}${AppRoutes.BANK}",
                        "bank_card".tr),
                    child: AddAccountButton(
                      label: 'add_bank_card'.tr,
                      margin: EdgeInsets.only(
                        top: 24.w,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
