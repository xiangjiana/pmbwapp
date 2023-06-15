import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ob_com_base/gen/colors.gen.dart';
import 'package:ob_component/ob_component.dart';

class ObCustomSwiperPagination extends StatelessWidget {
  const ObCustomSwiperPagination({
    Key? key,
    required this.count,
    required this.config,
    this.alignment = Alignment.bottomCenter,
    this.mainAxisAlignment,
    this.marginLeft,
    this.marginBottom,
    this.newstyle=false,//是否采用新的样式  启动图的轮播样式有调整
  }) : super(key: key);
  final int count;
  final SwiperPluginConfig config;
  final Alignment? alignment;
  final MainAxisAlignment? mainAxisAlignment;
  final double? marginLeft;
  final double? marginBottom;
  final bool newstyle;//是否采用新的样式  启动图的轮播样式有调整

  @override
  Widget build(BuildContext context) {
    Size activeSize=Size(20.w, 6.w);
    Size unActiveSize=Size(4.w, 4.w);
    if(newstyle){
      activeSize=Size(10.w, 3.w);
      unActiveSize=Size(10.w, 3.w);
    }

    return Align(
      alignment: alignment!,
      child: Row(
        mainAxisAlignment: mainAxisAlignment??MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [



          for (int i = 0; i < count; i++)
            i == config.activeIndex? Container(
              width: activeSize.width,
              height: activeSize.height,
              margin: EdgeInsets.only(left:i==0?marginLeft??4.w:4.w, bottom: marginBottom??16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.w),
                color: Color(0xff239C42),
              ),
            ):Container(
             width: unActiveSize.width,
             height: unActiveSize.height,
             margin: EdgeInsets.only(left:i==0?marginLeft??4.w:4.w, bottom: marginBottom??16.w),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(100),
               color: ColorName.white.withAlpha(75) ,
             ),
           )


        ],
      ),
    );
  }
}
