
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game/game.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ob_com_base/gen/assets.gen.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:params/params.dart';

typedef CollectStatusCallback = void Function(int collectStatus);

class CollectWidget extends StatelessWidget {
  int collectStatus = 0;///0 未收藏 1 收藏
  int index = 0;
  int collectId = 0;
  int gameId = 0;
  CollectStatusCallback callback;


   CollectWidget({Key? key,required this.collectStatus,required this.index,required  this.gameId,required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18.w,
      height: 18.w,
      margin: EdgeInsets.only(
        right: 6.5.w
      ),
      child: GestureDetector(
        onTap: () async {
          if(!Store.isLogin.value){
            Get.toNamed(AppRoutes.LOGIN);
          }else{
            try{
              await Get.find<GameApi>().collectVenueGame(CollectVenueGameParam(collectFlag: collectStatus==0?1:0, collectId: collectId, gameId: gameId
              ));
              collectStatus = collectStatus==0?1:0;
              callback(collectStatus);
            }catch (e){
            }
          }
        },
        child:  AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: pkObImage(
            key:  ValueKey("$index$collectStatus"),
            collectStatus==0
                ? Assets.images.collectionIcon.path
                : Assets.images.collectionedIcon.path,
            width: 24.w,
            height: 24.w,
          ),
        ),
      ),
    );
  }
}
