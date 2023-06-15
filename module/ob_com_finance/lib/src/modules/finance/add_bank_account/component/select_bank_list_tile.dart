import 'package:flutter/material.dart' hide PageController;
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/add_bank_account/add_bank_account_controller.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class SelectBankListTile extends StatelessWidget {
  final UiBank bank;
  final bool selected;
  final bool needBankIcon ;

  const SelectBankListTile(
      {Key? key, this.selected = false,this.needBankIcon=true , required this.bank})
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
          needBankIcon?  Row(
              children: [
                Avatar(
                  radius: 12.w,
                  backgroundColor: Colors.white.withOpacity(0.8),
                  child: pkObImage(
                    bank.bankIconUrl,
                    width: 16.w,
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
              ],
            ):SizedBox(),
          Expanded(
            child: Text(
              bank.bankName,
              style:
                  TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: selected ? 1 : 0,
            child: ObImage.asset(
              Assets.images.icon.comSelect.path,
              width: 20.w,
              height: 20.w,
            ),
          )
        ],
      ),
    );
  }
}
