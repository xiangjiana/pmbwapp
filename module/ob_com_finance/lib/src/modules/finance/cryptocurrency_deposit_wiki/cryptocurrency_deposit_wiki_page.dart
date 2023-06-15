import 'package:ob_com_base/ob_com_base.dart'
    hide Assets, FontFamily, ColorName;
import 'package:ob_com_base/ob_com_base.dart'
    hide Assets, FontFamily, ColorName;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:ob_com_base/ob_com_base.dart';

List<String> TAGS = [
  'cyptocurrents_wiki_immediate'.tr,
  'cyptocurrents_wiki_transfer_without_geographic_restrictions'.tr,
  'cyptocurrents_wiki_convertible_to_rmb'.tr
];
final List<VcAdvantageText> virtualCurrencyTexts = [
  VcAdvantageText(
    color: Color(0XFFFF6C24).withOpacity(0.1),
    icon: Assets.wiki.lock.path,
    title: 'cyptocurrents_wiki_highly_encrypted'.tr,
    subTitle: 'cyptocurrents_wiki_compared_with_traditional_transaction_me'.tr,
  ),
  VcAdvantageText(
    color: Color(0XFF166EEF).withOpacity(0.1),
    icon: Assets.wiki.rocket.path,
    title: 'cyptocurrents_wiki_fast_trading'.tr,
    subTitle: 'cyptocurrents_wiki_the_blockchain_technology_adopted_by_the'.tr,
  ),
  VcAdvantageText(
    color: Color(0XFF00BF55).withOpacity(0.1),
    icon: Assets.wiki.rmb.path,
    title: 'cyptocurrents_wiki_decentralized'.tr,
    subTitle: 'cyptocurrents_wiki_not_issued_by_central_banks_or_authoriti'.tr,
  ),
];

final List<UsdtAdvantageText> usdtTexts = [
  UsdtAdvantageText(feature: 'cyptocurrents_wiki_safety'.tr, describe: [
    'cyptocurrents_wiki_price_stable'.tr,
    'cyptocurrents_wiki_high_liquidity'.tr,
    'cyptocurrents_wiki_anonymous_transactions'.tr
  ]),
  UsdtAdvantageText(feature: 'cyptocurrents_wiki_convenient'.tr, describe: [
    'cyptocurrents_wiki_unregulated_by_banks'.tr,
    'cyptocurrents_wiki_trade_anytime24_hours'.tr,
    'cyptocurrents_wiki_global_transactions_without_geographical'.tr
  ]),
];

final List<PlatformText> platformTexts = [
  PlatformText(
    icon: Assets.wiki.yibifu.path,
    title: 'cyptocurrents_wiki_yibifu'.tr,
    subTitle: 'cyptocurrents_wiki_the_world_leading_digital_asset_tradin'.tr,
  ),
];

class CryptocurrencyDepositWikiPage extends StatelessWidget {
  const CryptocurrencyDepositWikiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ObNavigationBarTitle(
            'cyptocurrents_wiki_understanding_virtual_currency'.tr),
        leading: ObBackButton(),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xff151e25),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  Assets.wiki.bg.path,
                  package: BaseX.pkg,
                ),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'cyptocurrents_wiki_what_is_virtual_currency'.tr,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12.w),
                      Text(
                        'cyptocurrents_wiki_virtual_currency_is_a_currency_that_does'
                            .tr,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(height: 12.w),
                      Row(
                        children: [
                          for (int i = 0; i < TAGS.length; i++)
                            Container(
                              margin: EdgeInsets.only(right: 12.w),
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 6.w,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(2.w),
                                border: Border.all(
                                  width: 0.5.w,
                                  color: Colors.white.withOpacity(0.2),
                                ),
                              ),
                              child: Text(
                                '${TAGS[i]}',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 198.w),
                Container(
                  margin: EdgeInsets.all(16.w),
                  padding: EdgeInsets.only(
                      top: 24.w, right: 12.w, bottom: 16.w, left: 12.w),
                  decoration: BoxDecoration(
                    color: Color(0XFF1E262D),
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: Column(
                    children: [
                      AdvancedTitle('virtual_currency_advantage'.tr),
                      SizedBox(height: 8.w),
                      for (int i = 0; i < virtualCurrencyTexts.length; i++)
                        Container(
                          padding: EdgeInsets.all(12.w),
                          margin: EdgeInsets.only(top: 8.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: virtualCurrencyTexts[i].color,
                              width: 1,
                            ), //边框
                            borderRadius: BorderRadius.circular(4.w),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                virtualCurrencyTexts[i].color.withOpacity(0.1),
                                virtualCurrencyTexts[i].color.withOpacity(0.1),
                              ],
                              stops: [0.4, 0.2],
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 48.w,
                                height: 48.w,
                                padding: EdgeInsets.only(left: 4.w),
                                child: Image.asset(
                                    virtualCurrencyTexts[i].icon,
                                package: BaseX.pkg,),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${virtualCurrencyTexts[i].title}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        height: 1.1,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 4.w),
                                    Text(
                                      '${virtualCurrencyTexts[i].subTitle}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        height: 1.1,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white.withOpacity(0.6),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.w),
                  decoration: BoxDecoration(
                    color: Color(0XFF1E262D),
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: Column(
                    children: [
                      AdvancedTitle('usdt_tether_advantage'.tr),
                      Container(
                        margin: EdgeInsets.only(top: 17.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 6.w),
                        decoration: BoxDecoration(
                          color: Color(0XFFE1A100).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4.w),
                        ),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Image.asset(
                                Assets.wiki.quote1.path,
                                width: 20.w,
                                height: 20.w,
                                package: BaseX.pkg,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Text(
                                'cyptocurrents_wiki_tether_also_known_as_usdt_is_worth_the'
                                    .tr,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Image.asset(
                                Assets.wiki.quote2.path,
                                width: 20.w,
                                height: 20.w,
                                package: BaseX.pkg,
                              ),
                            ),
                          ],
                        ),
                      ),
                      for (int i = 0; i < usdtTexts.length; i++)
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 24.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 64.w,
                                height: 28.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0XFFFF9047),
                                      Color(0XFFFF5722),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16.w),
                                    topRight: Radius.circular(16.w),
                                    bottomRight: Radius.circular(16.w),
                                  ),
                                ),
                                child: Text(
                                  '${usdtTexts[i].feature}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Wrap(
                                children: [
                                  for (int j = 0;
                                      j < usdtTexts[i].describe.length;
                                      j++)
                                    Container(
                                      padding: EdgeInsets.only(left: 16.w),
                                      margin: EdgeInsets.only(
                                          top: 12.w, right: 24.w),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          scale: 3.0,
                                          image: AssetImage(
                                            Assets.wiki.star.path,
                                            package: BaseX.pkg,
                                          ),
                                          alignment: Alignment.centerLeft,
                                          fit: BoxFit.none,
                                        ),
                                      ),
                                      child: Text(
                                        '${usdtTexts[i].describe[j]}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.w),
                  decoration: BoxDecoration(
                    color: Color(0XFF1E262D),
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: Column(
                    children: [
                      AdvancedTitle('list_of_well_known_virtual'.tr),
                      for (int i = 0; i < platformTexts.length; i++)
                        Container(
                          margin: EdgeInsets.only(top: 33.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 36.w),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    scale: 3.0,
                                    image: AssetImage(
                                      platformTexts[i].icon,
                                      package: BaseX.pkg,
                                    ),
                                    alignment: Alignment.centerLeft,
                                    fit: BoxFit.none,
                                  ),
                                ),
                                child: Text(
                                  '${platformTexts[i].title}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Get.theme.colorScheme.primary,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 9.w),
                                child: Text(
                                  '${platformTexts[i].subTitle}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                // OBBottomComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AdvancedTitle extends StatelessWidget {
  final String title;

  const AdvancedTitle(
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '$title',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}

class VcAdvantageText {
  final String icon;
  final String title;
  final String subTitle;
  final Color color;

  VcAdvantageText({
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.color,
  });
}

class UsdtAdvantageText {
  final String feature;
  final List<String> describe;

  UsdtAdvantageText({required this.feature, required this.describe});
}

class PlatformText {
  final String icon;
  final String title;
  final String subTitle;

  PlatformText({
    required this.icon,
    required this.title,
    required this.subTitle,
  });
}
