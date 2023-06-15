import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';

import '../vip_level_detail_controller.dart';
import 'vip_list_dialog_widget.dart';

class RuleTile extends StatelessWidget {
  List<InlineSpan>? widgetSpans;

  RuleTile({
    Key? key, this.widgetSpans,
    required this.rankNo,
    required this.title,
    required this.describe,
  }) : super(key: key);

  final int rankNo;
  final String title;
  final String describe;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      margin: EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 16,
                height: 16,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '$rankNo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontFamily.dINMedium,
                      package: BaseX.pkg2,
                      height: 1,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  '$title',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white
                  ),
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 24),
            margin: EdgeInsets.only(top: 4),
            //text.rich在web报错数组溢出，这里判断下web下不用rich
            child: (widgetSpans != null && widgetSpans!.isNotEmpty)
                ? getRichText(widgetSpans!,rankNo)
                : Text(
              '$describe',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white60,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showDialog() {
    VipLevelDetailController? controller=Get.findOrNull<VipLevelDetailController>();
    OBDialogUtil.show(
      VipListDilaogWidget(controller!.limitBeans),
    );
  }
  Widget getRichText(List<InlineSpan> widgets,int rankNo) {
    //如果widgets中包含图片等需要这样处理避免web端报错
    if(rankNo==7&&kIsWeb){
      List<Widget> widgets_=[];
      TextStyle textStyle=TextStyle(
                  fontSize: 14,
                  height: 1,
                  color: Colors.white60,
                );
      String pattern="";
      if((Get.locale?.languageCode??"")=="en"||(Get.locale?.languageCode??"")=="vi"){
        pattern=" ";
      }else if((Get.locale?.languageCode??"")=="th"){
        pattern="\u200B";
      }
      widgets_.addAll(('member_reach_min_charge_requirements'.tr.breakWordOnWeb).split(pattern).map((e){
        return Text(e+pattern,style: textStyle,);
      }));
      widgets_.add(GestureDetector(
                  onTap: () {
                    showDialog();
                  },
                  child: ObImage.asset(
                    Assets.vip.comWenhao.path,
                    width: 16,
                    height: 16,
                  ),
                ));
      widgets_.addAll('level_rule_text10'.tr.breakWordOnWeb.split(pattern).map((e){
        return Text(e+pattern,style: textStyle,);
      }));
      return Wrap(children: widgets_,crossAxisAlignment: WrapCrossAlignment.end,runAlignment: WrapAlignment.end, runSpacing: 2,);
    }
    return Text.rich( TextSpan(
      children: widgets,
    ),);
  }
}
