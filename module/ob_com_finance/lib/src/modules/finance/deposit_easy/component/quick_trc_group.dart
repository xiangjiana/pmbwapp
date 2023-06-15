import 'package:flutter/material.dart' hide PageController;
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class QuickTrcGroup extends StatelessWidget {
  final List<String> amounts;
  final String? selected;
  final ValueChanged<String>? onQuickTrcSelectListener;

  const QuickTrcGroup({
    Key? key,
    required this.amounts,
    this.onQuickTrcSelectListener,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 106 / 40,
      mainAxisSpacing: 12.w,
      crossAxisSpacing: 12.w,
      shrinkWrap: true,
      children: amounts
          .map(
            (e) => TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (selected == null) {
                    return Colors.white.withOpacity(0.04);
                  }
                  if (e == selected) {
                    return ColorName.colorMain1.withOpacity(0.2);
                  }
                  return Colors.white.withOpacity(0.04);
                }),
                shape: MaterialStateProperty.all(const StadiumBorder()),
                minimumSize: MaterialStateProperty.all(const Size(76, 40)),
              ),
              onPressed: () {
                onQuickTrcSelectListener?.call(e);
              },
              child: Text(
                e,
                style: TextStyle(
                  fontFamily: FontFamily.dINMedium,
                  package: BaseX.pkg2,
                  fontSize: 16,
                  color: e == selected
                      ? (Store.clientId == Store.clientIdDJ
                          ? Colors.white
                          : ColorName.colorMain1)
                      : Colors.white.withOpacity(0.6),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
