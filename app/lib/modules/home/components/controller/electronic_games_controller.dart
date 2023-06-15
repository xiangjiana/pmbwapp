import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import '../../home_repository.dart';
import '../electronic_games/electronic_games_state.dart';

class ElectronicGamesController extends GetxController {
  final ElectronicGamesState state = ElectronicGamesState();
  List<ConfigGame> listData= [];
  final repository = Get.find<HomeRepository>();
  @override
  void onReady() {
    getGameListByAssortId();
    super.onReady();
  }

  getGameListByAssortId()async{
    runCatch(() async {
      final List<ConfigGame> res =
      await repository.getGameListByAssortId();
      res.removeWhere((element) => element.status==0);
      listData =  res ;
      state.listSmartRefreshCtrl.refreshCompleted();
      state.systemLoadingShow = false;
      update();

    },onError:(e){
      showToast(e.toString());
      state.listSmartRefreshCtrl.refreshCompleted();
      state.systemLoadingShow = false;
      update();
    });

  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
