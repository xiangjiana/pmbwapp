import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:ob_com_base/ob_com_base.dart';

import 'package:ob_component/ob_component.dart' hide ObTheme;

class QuickAmountGroup extends StatelessWidget {
  final List<String> amounts;
  final String? selected;
  final ValueChanged<String>? onQuickAmountSelectListener;

  const QuickAmountGroup(
      {Key? key,
      required this.amounts,
      this.onQuickAmountSelectListener,
      this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return GridView.count(
      crossAxisCount: 4,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 80 / 40,
      mainAxisSpacing: 12.w,
      crossAxisSpacing: 12.w,
      shrinkWrap: true,
      children: defaultAmount(),
    );*/

    return Wrap(
      direction: Axis.horizontal,
      spacing: 12.w,
      runSpacing: 12.w,
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      textDirection: TextDirection.ltr,
      children:amounts.length > 0   ? defaultAmount() : [],
    );
  }

  List<Widget> defaultAmount() {
    return amounts
        .map(
          (e) => TextButton(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (selected == null) {
                    return Colors.white.withOpacity(0.04);
                  }
                  if (double.tryParse(e) ==
                      (AppCurrencyUtils.getAppCurrencySymbolIsVND()
                          ? ((double.tryParse(selected!) ?? 0) * 1000)
                          : double.tryParse(selected!))) {
                    return ColorName.colorMain.withOpacity(0.2);
                  }
                  return Colors.white.withOpacity(0.04);
                }),
                shape: MaterialStateProperty.all(const StadiumBorder()),
                minimumSize: MaterialStateProperty.all(const Size(80, 40))),
            onPressed: () {
              onQuickAmountSelectListener
                  ?.call(NullUtils.toDouble(e).toInt().toString());
            },
            child: AutoSizeText(
              AppCurrencyUtils.fixAmount3(e, suffix: 'K'),
              style: TextStyle(
                fontFamily: FontFamily.dINMedium,
                package: BaseX.pkg2,
                fontSize: 16,
                color: e == selected
                    ? (Store.clientId == Store.clientIdDJ
                        ? Colors.white
                        : ColorName.colorMain)
                    : Colors.white.withOpacity(0.6),
              ),
              maxLines: 2,
              minFontSize: 8,
            ),
          ),
        )
        .toList();
  }
}
