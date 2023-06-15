import 'package:flutter/material.dart' hide PageController;
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart' show ColorName;

class BetFilter extends StatelessWidget {
  final List<String> gameTypeNames;
  final String selectType;

  BetFilter({
    required this.gameTypeNames,
    required this.selectType,
  });

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
              color: Color(0xff151E25),
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'bet_histories_play_options'.tr,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(height: 12.w),
                  GridView.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 12.w,
                    crossAxisSpacing: 12.w,
                    childAspectRatio: 76 / 32,
                    children: [
                      for (int i = 0; i < gameTypeNames.length; i++)
                        GestureDetector(
                          onTap: () =>
                              Navigator.of(context).maybePop(gameTypeNames[i]),
                          child: Container(
                            width: 76.w,
                            height: 32.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: gameTypeNames[i] == selectType
                                  ? ColorName.colorMain.withOpacity(0.2)
                                  : Colors.white.withOpacity(0.04),
                              borderRadius: BorderRadius.circular(16.w),
                            ),
                            child: Text(
                              gameTypeNames[i],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: gameTypeNames[i] == selectType
                                    ? ColorName.colorMain
                                    : Colors.white.withOpacity(0.6),
                                fontSize: 12,
                                height: 1,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        )
                    ],
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
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
