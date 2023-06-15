import 'package:flutter/material.dart' hide PageController;
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:get/get.dart';
import 'package:ob_com_finance/src/modules/finance/add_bank_account/add_bank_account_controller.dart';
import 'package:ob_com_finance/src/modules/finance/add_bank_account/component/select_bank_list_tile.dart';

class SelectBank extends StatelessWidget {
  final List<UiBank> banks;
  final String? selectId;
  final String?title;
  final bool needBankIcon;
  const SelectBank({Key? key, this.banks = const [], this.selectId,this.title,this.needBankIcon = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 44.w,
          // padding: EdgeInsets.symmetric(horizontal: 16.w),
          color: Colors.white.withOpacity(0.04),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.w),
                    child: Text(
                      'cancel'.tr,
                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  title??'withdraw_select_debit_card'.tr,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: ListView(
          children: banks
              .map((b) => GestureDetector(
                    onTap: () => Get.back(result: b),
                    child: SelectBankListTile(
                      bank: b,
                      selected: selectId == b.id,
                      needBankIcon: needBankIcon,
                    ),
                  ))
              .toList(),
        ))
      ],
    );
  }
}
