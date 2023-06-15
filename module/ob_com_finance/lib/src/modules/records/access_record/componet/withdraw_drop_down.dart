import 'package:ob_com_base/ob_com_base.dart' hide Navigator;
import 'package:get/get.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:ob_com_base/ob_com_base.dart' as com_base;
import 'package:ob_com_finance/src/modules/records/access_record/repository/dic.dart';
import 'package:ob_com_finance/src/modules/records/access_record/repository/drop_down_filter_result.dart';
import 'package:ob_com_finance/src/modules/finance/add_virtual_account/component/tag.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class WithdrawDropDown extends StatelessWidget {
  final DropDownFilterResult result;

  const WithdrawDropDown({Key? key, required this.result}) : super(key: key);

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
                  ObText(
                    'access_record_trading_status'.tr,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(height: 12.w),
                  com_base.LocaleUtils.isLocale
                      ? SizedBox(
                          width: double.infinity,
                          child: Wrap(
                            spacing: 8.w,
                            runSpacing: 6.w,
                            children: WITHDRAWAL_STATUS_FILTER_DIC.entries
                                .map(
                                  (e) => GestureDetector(
                                    onTap: () => Navigator.of(context).maybePop(
                                      DropDownFilterResult(status: e.key),
                                    ),
                                    child: Tag(
                                      height: 32.w,
                                      borderRadius: 20.w,
                                      label: e.value,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 4.w,
                                      ),
                                      selected: e.key == result.status,
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
                          children: WITHDRAWAL_STATUS_FILTER_DIC.entries
                              .map(
                                (e) => GestureDetector(
                                  onTap: () => Navigator.of(context).maybePop(
                                    DropDownFilterResult(status: e.key),
                                  ),
                                  child: Tag(
                                    width: 76.w,
                                    height: 32.w,
                                    borderRadius: 20.w,
                                    label: e.value,
                                    selected: e.key == result.status,
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
