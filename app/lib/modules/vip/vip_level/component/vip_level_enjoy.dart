import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class VipLevelEnjoy extends StatelessWidget {
  ///VIP等级 ///每日提款次数  ///每日提款额度 ///生日礼金
  final In listIn;

  VipLevelEnjoy({required this.listIn});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFF151E25),
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                listIn.vipGradeName + ' ' + "vip_level_enjoy".tr,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 8.w,
            ),
            Wrap(
              runSpacing: 5,
              spacing: 4,
              children: [
                _buildClauseWidget(
                  vipDailyIcon01(),
                  listIn.dayWithdrawalNum > 0,
                  Assets.vip.vipZunxiang.path,
                  "${numberFormat(listIn.dayWithdrawalNum, point: 0)}",
                  "vip_level_day_withdrawal_num".tr,
                ),
                _buildClauseWidget(
                  vipDailyIcon02(),
                  listIn.dayWithdrawalQuota > 0,
                  Assets.vip.vipZunxiang.path,
                  "${AppCurrencyUtils.dealBalance(listIn.dayWithdrawalQuota.toString())}",
                  "vip_level_upgrade_quota".tr,
                ),
                _buildClauseWidget(
                  vipGiftIcon01(),
                  listIn.upgradeBonus > 0,
                  Assets.vip.vipZunxiang.path,
                  "${AppCurrencyUtils.dealBalance(listIn.upgradeBonus.toString())}",
                  "vip_level_day_withdrawal_bonus".tr,
                ),
                _buildClauseWidget(
                  vipGiftIcon02(),
                  listIn.birthdayBonus > 0,
                  Assets.vip.vipZunxiang.path,
                  "${AppCurrencyUtils.dealBalance(listIn.birthdayBonus.toString())}",
                  "vip_level_birthday_bonus".tr,
                ),
                _buildClauseWidget(
                  vipMonthIcon01(),
                  listIn.aboveMonthRedEnvelope > 0,
                  Assets.vip.vipZunxiang.path,
                  "${AppCurrencyUtils.dealBalance(listIn.aboveMonthRedEnvelope.toString())}",
                  "vip_level_aboveMonthRedEnvelope".tr,
                ),
                _buildClauseWidget(
                  vipMonthIcon02(),
                  listIn.belowMonthRedEnvelope > 0,
                  Assets.vip.vipZunxiang.path,
                  "${AppCurrencyUtils.dealBalance(listIn.belowMonthRedEnvelope.toString())}",
                  "vip_level_belowMonthRedEnvelope".tr,
                ),
              ],
            ),
          ],
        ));
  }

  Widget _buildClauseWidget(Widget locate, bool exhibit, String backdrop,
      String writing, String txt) {
    Widget txtChild = Text.rich(
      TextSpan(
        text: "${exhibit ? writing : "-"}\n",
        children: [
          TextSpan(
            text: txt,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 10
            ),
          ),
        ],
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 4,
      style: TextStyle(
        fontFamily: "DIN-Medium",
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
    if (kIsWeb) {
      txtChild = SizedBox(
          width: 130.w,
          height: 60.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
              height: 30.w,
              alignment: Alignment.centerLeft,
              child: Text(
                "${exhibit ? writing : "-"}",
                style: TextStyle(
                    fontFamily: "DIN-Medium",
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,),
              ),
            ),
            Text(txt,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 10,
                    height: 1)),
          ]));
    }
    
    return Visibility(
      visible: exhibit,
      child: Container(
        width: 167.w,
        height: 72.w,
        padding: EdgeInsets.only(
          left: 16.w,
          top: 6.w,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              backdrop,
              package: BaseX.pkg,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            txtChild,
            locate,
          ],
        ),
      ),
    );
  }

  Widget vipDailyIcon01() {
    return Positioned(
      right: 8.97.w,
      top: 0.w,
      child: Container(
        width: 29.06.w,
        height: 29.06.w,
        decoration: BoxDecoration(
          color: Color(0xFFFFBB6F).withOpacity(0.15),
          borderRadius: BorderRadius.circular(29.06.w),
        ),
        child: ObImage.asset(
          Assets.vip.icon.vipZunxiangCishu.path,
        ),
      ),
    );
  }

  Widget vipDailyIcon02() {
    return Positioned(
      right: 8.97.w,
      top: 0.w,
      child: Container(
        width: 29.06.w,
        height: 29.06.w,
        decoration: BoxDecoration(
          color: Color(0xFFFFBB6F).withOpacity(0.15),
          borderRadius: BorderRadius.circular(29.06.w),
        ),
        child: ObImage.asset(
          Assets.vip.icon.vipZunxiangEdu.path,
        ),
      ),
    );
  }

  Widget vipGiftIcon01() {
    return Positioned(
      right: 8.97.w,
      top: 0.w,
      child: Container(
        width: 29.06.w,
        height: 29.06.w,
        decoration: BoxDecoration(
          color: Color(0xFFFFBB6F).withOpacity(0.15),
          borderRadius: BorderRadius.circular(29.06.w),
        ),
        child: ObImage.asset(
          Assets.vip.icon.vipZunxiangShengji.path,
        ),
      ),
    );
  }

  Widget vipGiftIcon02() {
    return Positioned(
      right: 8.97.w,
      top: 0.w,
      child: Container(
        width: 29.06.w,
        height: 29.06.w,
        decoration: BoxDecoration(
          color: Color(0xFFFFBB6F).withOpacity(0.15),
          borderRadius: BorderRadius.circular(29.06.w),
        ),
        child: ObImage.asset(
          Assets.vip.icon.vipZunxiangShengri.path,
        ),
      ),
    );
  }

  Widget vipMonthIcon01() {
    return Positioned(
      right: 8.97.w,
      top: 0.w,
      child: Container(
        width: 29.06.w,
        height: 29.06.w,
        decoration: BoxDecoration(
          color: Color(0xFFFFBB6F).withOpacity(0.15),
          borderRadius: BorderRadius.circular(29.06.w),
        ),
        child: ObImage.asset(
          Assets.vip.icon.vipZunxiangHongbao01.path,
        ),
      ),
    );
  }

  Widget vipMonthIcon02() {
    return Positioned(
      right: 8.97.w,
      top: 0.w,
      child: Container(
        width: 29.06.w,
        height: 29.06.w,
        decoration: BoxDecoration(
          color: Color(0xFFFFBB6F).withOpacity(0.15),
          borderRadius: BorderRadius.circular(29.06.w),
        ),
        child: ObImage.asset(
          Assets.vip.icon.vipZunxiangHongbao02.path,
        ),
      ),
    );
  }
}
