import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:models/models.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:ob_com_base/ob_com_base.dart';
import 'package:get/get.dart';

const TextStyle amountStyleGreen = TextStyle(
  // fontFamily: 'Gotham-Medium',
  fontSize: 12,
  color: Color(0xFF69E300),
  fontWeight: FontWeight.w500,
);

final TextStyle amountStyleRed = TextStyle(
  // fontFamily: 'Gotham-Medium',
  fontSize: 12,
  color: Color(0xffFF5722),
  fontWeight: FontWeight.w500,
);

final TextStyle leftTextStyle = TextStyle(
  color: Colors.white.withOpacity(0.6),
  fontSize: 12,
  // fontFamily: "PingFangSC-Regular",
  fontWeight: FontWeight.w500,
);

class BetItem extends StatelessWidget {
  final String obBetStatus; // 0-未结算 1-已结算
  final GameRecords item;
  final String gameCode;

  const BetItem(this.item, this.obBetStatus, this.gameCode, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF).withOpacity(0.04),
        borderRadius: BorderRadius.all(Radius.circular(8.w)),
      ),
      margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 4.w, bottom: 4.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 16.w),
            child: Row(
              children: [
                Text(
                  '${item.gameTypeName}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "PingFangSC-Regular",
                  ),
                ),
                const Spacer(),
                // Expanded(
                //   child: Text(_getOptionName(),
                //       overflow: TextOverflow.ellipsis,
                //       style: TextStyle(
                //         color: Colors.white.withOpacity(0.6),
                //         fontSize: 14,
                //         fontFamily: "PingFangSC-Regular",
                //       )),
                // ),
                Text(
                  _getStatusText(item.obBetStatus),
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Color(0xFFE1A100),
                    fontSize: 12,
                    fontFamily: "PingFangSC-Regular",
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 13.w,
          ),
          // if (item.details.isEmpty)
          //
          // else
          //   Container(
          //     decoration: BoxDecoration(
          //       color: Color(0x0AFFFFFF),
          //       borderRadius: BorderRadius.circular(4),
          //     ),
          //     margin: EdgeInsets.only(top: 12.w, bottom: 12.w),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: getGameRecords(),
          //     ),
          //   ),

          Container(
            padding: EdgeInsets.all(8.w),
            margin: EdgeInsets.only(bottom: 16.w),
            decoration: BoxDecoration(
              color: const Color(0x0AFFFFFF),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'bet_histories_betting_content'.tr,
                  style: leftTextStyle,
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: Text(
                    item.betContent,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      // fontFamily: "PingFangSC-Regular",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () async {
              if (kIsWeb) {
                WebUtil.copyText2Clipboard(item.id);
              } else {
                Clipboard.setData(ClipboardData(text: item.id));
              }
              showToast("copy_successfully".tr);
            },
            child: Row(
              children: [
                Text(
                  'bet_histories_ticket_number'.tr,
                  style: leftTextStyle,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    item.id,
                    style: leftTextStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ), 
                  // FittedBox(
                  //   fit: BoxFit.fill,
                  //   child: Text(
                  //     item.id,
                  //     style: leftTextStyle,
                  //     overflow: TextOverflow.ellipsis,
                  //     maxLines: 1,
                  //     softWrap: false,
                  //   ),
                  // ),
                ),
                SizedBox(width: 5.w),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 2.w,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'copy'.tr,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'bet_time'.tr,
                style: leftTextStyle,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  item.createAtString,
                  style: leftTextStyle,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('total_bets_amount'.tr, style: leftTextStyle),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  AppCurrencyUtils.dealBalance(item.betAmount.toString()),
                  style: const TextStyle(
                    color: Colors.white,
                    // fontFamily: "PingFangSC-Regular",
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          if (obBetStatus == '1') SizedBox(height: 4.h),
          if (obBetStatus == '1')
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "bets_effective".tr,
                  style: leftTextStyle,
                ),
                SizedBox(width: 8.w),
                Text(
                  AppCurrencyUtils.dealBalance(item.validBetAmount.toString()),
                  style: leftTextStyle,
                ),
                const Spacer(),
                if (obBetStatus == '1')
                  SizedBox(
                    height: 18.w,
                    child: Text.rich(
                      TextSpan(
                        //text: item.netAmount < 0 ? 'lose'.tr : 'win'.tr,
                        text: item.netAmount < 0
                            ? 'bet_histories_win_or_lose'.tr
                            : 'bet_histories_win_or_lose'.tr,
                        style: TextStyle(
                          color: const Color(0xFFFFFFFF).withOpacity(0.6),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text:
                                ' ${item.netAmount < 0 ? '' : '+'}${AppCurrencyUtils.dealBalance(item.netAmount.toString())}',
                            style: item.netAmount < 0
                                ? amountStyleRed
                                : amountStyleGreen,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          SizedBox(
            height: 12.w,
          ),
        ],
      ),
    );
  }

  /*String _getOptionName() {
    if (gameCode == 'cp')
      return 'the_first'.tr + '${item.optionName}' + 'period'.tr;
    return ' ${item.optionName}';
  }*/

  String _getStatusText(String status) {
    switch (status) {
      case '1':
        return 'belted'.tr;
      case '0':
        return 'un_bet'.tr;
      case '已取消':
        return 'belted'.tr;
      case '2':
        return 'rebates_canceled'.tr;
      default:
        return status;
    }
  }

  Widget _buildNormalItem(String label, String key, String value) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        8.w,
        key == 'matchName' ? 8.w : 4.w,
        8.w,
        key == 'matchResult' ? 8.w : 4.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: leftTextStyle,
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOddItem(String label, String value) {
    Widget _buildRightText(String value) {
      List<String> splitTexts = value.split(' ');
      if (splitTexts.length > 1) {
        String rightText = splitTexts.last;
        String leftText = splitTexts.join('').replaceAll(rightText, '');
        return Expanded(
          child: Text.rich(
            TextSpan(
              text: '$leftText',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              children: [
                TextSpan(
                  text: ' $rightText',
                  style: TextStyle(
                    color: ColorName.colorMain,
                    fontSize: 14,
                    fontFamily: "DIN-Medium",
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
          ),
        );
      }
      return Expanded(
        child: Text(
          value,
          textAlign: TextAlign.right,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: leftTextStyle,
          ),
          _buildRightText(value),
        ],
      ),
    );
  }

  List<Widget> getGameRecords() {
    List<Widget> widgets = <Widget>[];
    // for (int i = 0; i < item.details.length; i++) {
    //   GameRecordDetails m = item.details[i];
    //   if (gameCode == 'ty' || gameCode == 'dj') {
    //     widgets.add(
    //       Column(
    //         children: [
    //           if (item.details.length > 1)
    //             _buildNormalItem(
    //               'bet_histories_match_name'.tr,
    //               'matchName',
    //               '${m.sportName.isNullOrEmpty ? '' : m.sportName} ${m.matchName.isNullOrEmpty ? '' : m.matchName}',
    //             ),
    //           _buildOddItem(
    //             'bet_histories_handicap_odds'.tr,
    //             m.playOptionName.isNullOrEmpty ? '' : m.playOptionName,
    //           ),
    //           _buildNormalItem(
    //             'bet_histories_clan'.tr,
    //             'matchInfo',
    //             m.matchInfo.isNullOrEmpty ? '' : m.matchInfo,
    //           ),
    //           _buildNormalItem(
    //             'bet_histories_how_to_play'.tr,
    //             'playName',
    //             m.playName.isNullOrEmpty ? '' : m.playName,
    //           ),
    //           if (m.matchResult.isNotNullOrEmpty)
    //             _buildNormalItem(
    //               'bet_histories_result'.tr,
    //               'matchResult',
    //               m.matchResult.isEmpty ? '' : m.matchResult,
    //             ),
    //           if (item.details.length > 1 && i < item.details.length - 1)
    //             Divider(
    //                 height: 8.w, thickness: 3.w, color: ColorName.colorBlack4),
    //         ],
    //       ),
    //     );
    //   } else if (gameCode == 'cp') {
    //     widgets.add(
    //       Column(
    //         children: [
    //           _buildNormalItem(
    //             'bet_histories_betting_play'.tr,
    //             'playName',
    //             m.playName.isNullOrEmpty ? '' : m.playName,
    //           ),
    //           _buildOddItem(
    //             'bet_histories_betting_content'.tr,
    //             m.playOptionName.isNullOrEmpty ? '' : m.playOptionName,
    //           ),
    //           _buildNormalItem(
    //             'bet_histories_winning_numbers'.tr,
    //             'matchResult',
    //             m.matchResult.isNullOrEmpty ? '' : m.matchResult,
    //           ),
    //         ],
    //       ),
    //     );
    //   } else if (gameCode == 'zr') {
    //     widgets.add(
    //       Column(
    //         children: [
    //           _buildNormalItem(
    //             'bet_histories_betting_play'.tr,
    //             'playName',
    //             m.playName.isNullOrEmpty ? '' : m.playName,
    //           ),
    //           _buildNormalItem(
    //             'bet_histories_game_result'.tr,
    //             'matchResult',
    //             m.matchResult.isNullOrEmpty ? '' : m.matchResult,
    //           ),
    //         ],
    //       ),
    //     );
    //   }
    // }
    return widgets;
  }
}
