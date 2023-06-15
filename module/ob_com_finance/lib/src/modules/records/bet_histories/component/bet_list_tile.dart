import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/bet_settled_controller.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/bet_un_settled_controller.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:models/models.dart';

@immutable
class BetListTile extends StatefulWidget {
  final Metas data;
  final bool isSettled;

  BetListTile(this.data, this.isSettled);

  @override
  _BetListTileState createState() => _BetListTileState();
}

final TextStyle amountStyleGreen = TextStyle(
    fontFamily: FontFamily.gothamMedium,
    package: BaseX.pkg2,
    fontSize: 16,
    color: Color(0xFF69E300),
    fontWeight: FontWeight.w500);

final TextStyle amountStyleRed = TextStyle(
    fontFamily: FontFamily.gothamMedium,
    package: BaseX.pkg2,
    fontSize: 16,
    color: Color(0xffFF5722),
    fontWeight: FontWeight.w500);

final TextStyle amountStyleWhite = TextStyle(
    fontFamily: FontFamily.gothamMedium,
    package: BaseX.pkg2,
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w500);

class _BetListTileState extends State<BetListTile> {
  BetUnSettledController betUnSettledController =
      Get.find<BetUnSettledController>();
  BetSettledController betSettledController = Get.find<BetSettledController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (widget.isSettled) {
            betSettledController.jumpToTypeList(widget.data);
          } else {
            betUnSettledController.jumpToTypeList(widget.data);
          }
        },
        child: Container(
          width: 375.w,
          // height: 101.w,
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 16.w),
                      child: ObImage.network(
                        widget.data.venueIconUrlApp,
                        width: 32.w,
                        height: 32.w,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12.w),
                      child: Text(
                        '${widget.data.venueName}',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFFFFFF),
                            height: 1,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: EdgeInsets.only(right: 4.w),
                      child: _getNetAmount(),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 16.w),
                      child: pkObImage(
                        Assets.images.icon.homeMoreRight.path,
                        width: 16.w,
                        height: 16.w,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 60.w, top: 0.w),
                child: Text(
                  'bet_histories_bet_amount'.tr+' ${AppCurrencyUtils.dealBalance(widget.data.betAmount.toString())}',
                  style: TextStyle(
                      fontSize: 12,
                      height: 1,
                      color: Color(0xFFFFFFFF).withOpacity(0.6)),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0x1AFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(10.w)),
                    ),
                    height: 20.w,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    margin: EdgeInsets.only(left: 60.w, top: 8.w, bottom: 15.w),
                    child: Text('${widget.data.count}'+
                    (((Get.locale?.languageCode??"")!="en")?'bet_histories_single'.tr:""),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFFFFFFF).withOpacity(0.6))),
                  )
                ],
              ),
              Container(
                color: Colors.white.withOpacity(0.06),
                height: 1.w,
                margin: EdgeInsets.only(left: 56.w, bottom: 0.w),
              )
            ],
          ),
        ));
  }

  Text _getNetAmount() {
    if (widget.isSettled) {
      if (widget.data.netAmount > 0) {
        return Text(
          '+${AppCurrencyUtils.dealBalance(widget.data.netAmount.toString())}',
          style: amountStyleGreen,
        );
      }

      if (widget.data.netAmount < 0) {
        return Text(
          '${AppCurrencyUtils.dealBalance(widget.data.netAmount.toString())}',
          style: amountStyleRed,
        );
      }
      return Text(
        '${AppCurrencyUtils.dealBalance(widget.data.netAmount.toString())}',
        style: amountStyleWhite,
      );
    }
    return Text(
      '',
      style: amountStyleWhite,
    );
  }
}
