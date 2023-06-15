import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/modules/home_modules/home_float/float_controller.dart';
import 'package:ob_component/ob_component.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

@immutable
class FloatBonus extends StatefulWidget {
  @override
  _FloatBonusState createState() => _FloatBonusState();
}

class _FloatBonusState extends State<FloatBonus> with TickerProviderStateMixin {
  final FloatController controller = Get.find<FloatController>();
  final double width = 88.w, height = 88.w, navBarHeight = 56;

  AnimationController? aniController;
  CurvedAnimation? curve;
  Animation<Offset>? offsetTween;
  Offset? rest;

  Offset offset = Offset(
    1.sw - 88.w,
    1.sh / 2,
  );

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (curve != null && !curve!.isCompleted && !curve!.isDismissed)
          ? offsetTween!.value.dx
          : offset.dx,
      top: (curve != null && !curve!.isCompleted && !curve!.isDismissed)
          ? offsetTween!.value.dy
          : offset.dy,
      child: kIsWeb
          ? PointerInterceptor(child: _floatingWindow())
          : _floatingWindow(),
    );
  }

  void startResetOffsetAnimation() {
    rest = resetOffset(offset);
    aniController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed ||
            status == AnimationStatus.dismissed) {
          offset = rest!;
        }
      });
    curve = CurvedAnimation(parent: aniController!, curve: Curves.fastOutSlowIn)
      ..addListener(() {
        setState(() {});
      });
    offsetTween = Tween<Offset>(begin: offset, end: rest).animate(curve!);
    aniController!.forward();
  }

  Widget _floatingWindow() {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onPanDown: (details) {},
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          offset += details.delta;
          offset = overflow(offset);
        });
      },
      onPanEnd: (DragEndDetails details) {
        startResetOffsetAnimation();
      },
      child: Material(
        color: Colors.transparent,
        child: buildFloatItem(),
      ),
    );
  }

  Widget buildFloatItem() {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          alignment: Alignment.bottomLeft,
          child: GestureDetector(
            onTap: controller.goMessagePage,
            child: Obx(() => hongLiLogo(Store.curLanguageCode.value),),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: controller.onHandleClose,
            child: Container(
              width: 40.w,
              height: 40.w,
              alignment: Alignment.center,
              color: Colors.transparent,
              child: ObImage.asset(
                Assets.images.icon.comDelete.path,
                width: 16.w,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget hongLiLogo(String curLanguageCode) {
    
    String path = Assets.images.finance.hongli.path;
    switch (curLanguageCode) {
      case "vi":
        path = Assets.images.finance.hongliVn.path;
        break;
      case "th":
        path = Assets.images.finance.hongliTh.path;
        break;
      case "en":
        path = Assets.images.finance.hongliEn.path;
        break;
    }

    return ObImage.asset(
      path,
      width: 68.w,
      height: 68.w,
    );

  }

  Offset resetOffset(Offset offset) {
    final double middleX = 1.sw / 2 - width / 2;
    if (offset.dx >= 0 && offset.dx < middleX) {
      offset = Offset(0, offset.dy);
    }
    if (offset.dx >= middleX && offset.dx <= 1.sw - width) {
      offset = Offset(1.sw - width, offset.dy);
    }
    return offset;
  }

  Offset overflow(Offset offset) {
    if (offset.dx <= 0) {
      offset = Offset(0, offset.dy);
    }
    if (offset.dx >= 1.sw - width) {
      offset = Offset(1.sw - width, offset.dy);
    }
    if (offset.dy <= 80) {
      offset = Offset(offset.dx, 80);
    }
    if (offset.dy >= 1.sh - height - navBarHeight) {
      offset = Offset(offset.dx, 1.sh - height - navBarHeight);
    }
    return offset;
  }
}
