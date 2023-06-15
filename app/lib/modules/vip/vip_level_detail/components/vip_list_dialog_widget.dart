import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_package/modules/vip/vip_level_detail/vip_limit_last_month_bean.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

///
class VipListDilaogWidget extends StatelessWidget {
  List<VipLimitLastMonthBean> limitBeans;

  VipListDilaogWidget(this.limitBeans, {super.key});

  @override
  Widget build(BuildContext context) {
    final DialogTheme dialogTheme = Theme.of(context).dialogTheme;
    return Dialog(
      child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF1D2933),
            border:
                Border.all(color: ColorName.white.withOpacity(0.1), width: 1.w),
            borderRadius: BorderRadius.circular(8.w),
          ),
          width: 327.w,
          height: 493.w,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.w),
                height: 395.w,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: ColorName.white.withOpacity(0.1), width: 1.w),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.w),
                  child: Column(
                    children: [
                      Container(
                        height: 40.w,
                        color: ColorName.white.withOpacity(0.04),
                        child: Flex(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              child:Container(
                                alignment: Alignment.center,
                                child:  Text(
                                  "level".tr,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 14,
                                    fontFamily: 'PingFangSC-Regular',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "monthly_charge_amount".tr,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: Get.locale!.languageCode=='en'?12:14,
                                    wordSpacing:-1,
                                    fontFamily: 'PingFangSC-Regular',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return getItemWidger(limitBeans[index], index);
                          },
                          itemCount: limitBeans.length,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 6.w, right: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "unit".tr+": ",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 14,
                        fontFamily: 'PingFangSC-Regular',
                      ),
                    ),
                    Text(
                      AppCurrencyUtils.getAppCurrencySymbolIsVND()
                          ? 'rmb_d'.tr
                          : AppCurrencyUtils.getAppCurrencySymbolIsTHB()
                              ? 'rmb_t'.tr
                              : 'rmb'.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'PingFangSC-Regular',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 6.w, right: 16.w, left: 16.w),
                child: OBasePrimaryButton(
                  block: true,
                  size: ButtonSize.large,
                  image: DecorationImage(
                    image: AssetImage(Assets.images.btnbg.path, package: BaseX.pkg),
                    fit: BoxFit.fill,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("agent_n_commission_manage_know".tr),
                ),
              )
            ],
          )),
    );
  }
  bool curIsVND = AppCurrencyUtils.getAppCurrencySymbolIsVND();
  Widget getItemWidger(VipLimitLastMonthBean limitBean, int index) {
    return Container(
      height: 32.w,
      color: index % 2 != 0
          ? ColorName.white.withOpacity(0.04)
          : ColorName.colorBlack4,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                limitBean.vipGradeName,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 14,
                  fontFamily: 'PingFangSC-Regular',
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                limitBean.depositLimit+"${curIsVND?'k':''}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'PingFangSC-Regular',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
