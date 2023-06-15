import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ElectronicGamesState {
  bool systemLoadingShow = true;
  final listSmartRefreshCtrl = RefreshController(initialRefresh: false);
  ElectronicGamesState() {
    ///Initialize variables
  }
}
