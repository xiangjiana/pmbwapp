import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_package/login_game/login_game.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class EnterGameButton extends StatelessWidget {
  const EnterGameButton({
    Key? key,
    required this.gameCode,
    required this.gameType,
    required this.gameId,
    this.gameName,
    required this.isMaintained,
    this.onPressed,
  }) : super(key: key);

  final String gameCode;
  final String gameType;
  final String gameId;
  final String? gameName;
  final bool isMaintained;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      child: SecondaryButton(
        onPressed: () {
          if (onPressed != null) onPressed!();
          joinGame(
            isMaintained,
            gameCode,
            gameType,
            gameId,
            gameName,
          );
        },
        child: ObText(
          isMaintained ? "search_in_maintenance".tr : "game_join".tr,
          style: TextStyle(
            fontSize: 14,
            color: Get.theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }

  static void joinGame(
    bool isGameMaintained,
    String gameCode,
    String gameType,
    String? gameId,
    String? gameName, {
    bool isGame = false,
  }) {
    if(!Store.isLogin.value){
      Get.toNamed(AppRoutes.LOGIN);
      return;
    }


    if (isGameMaintained) {
      showToast(isGame
          ? 'this_game_is_under_maintenance_please_select_another_game'.tr
          : "this_venue_is_under_maintenance_please_select_another_venue".tr);
      return;
    }
    GameLoginUtils.openH5GamPage(
      gameCode,
      gameType,
      gameId,
      title: gameName ?? '',
    );
  }
}
