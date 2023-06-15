import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:ob_com_base/ob_com_base.dart' as com_base;
import 'package:ob_com_finance/src/modules/finance/add_virtual_account/component/tag.dart';
import 'package:ob_com_finance/src/modules/records/ledger_record/repository/ui_transcation.dart';
import 'package:get/get.dart';

class DropDownFilter extends StatelessWidget {
  final UiTranscation selectType;

  const DropDownFilter({Key? key, required this.selectType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).maybePop(),
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: double.infinity,
        color: Colors.black.withOpacity(0.6),
        child: Column(
          children: [
            Container(
              color: const Color(0xff151E25),
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ledger_detail_transaction_type'.tr,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(height: 12.w),
                  com_base.LocaleUtils.isLocale
                      ? SizedBox(
                          width: double.infinity,
                          child: Wrap(
                            spacing: 8.w,
                            runSpacing: 6.w,
                            children: TRANSACTION_DIC()
                                .map(
                                  (e) => GestureDetector(
                                    onTap: () =>
                                        Navigator.of(context).maybePop(e),
                                    child: Tag(
                                      height: 32.w,
                                      borderRadius: 32.w,
                                      label: e.title,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 4.w,
                                      ),
                                      selected: e.title == selectType.title,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        )
                      : GridView.count(
                          crossAxisCount: 4,
                          mainAxisSpacing: 12.w,
                          crossAxisSpacing: 12.w,
                          childAspectRatio: 76 / 32,
                          children: TRANSACTION_DIC()
                              .map(
                                (e) => GestureDetector(
                                  onTap: () =>
                                      Navigator.of(context).maybePop(e),
                                  child: Tag(
                                    width: 76.w,
                                    height: 32.w,
                                    borderRadius: 20.w,
                                    label: e.title,
                                    selected:  e.title == selectType.title,
                                    fontSize: 12,
                                  ),
                                ),
                              )
                              .toList(),
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
