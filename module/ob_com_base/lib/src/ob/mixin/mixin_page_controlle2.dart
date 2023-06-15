import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

mixin MelosPageController<T extends PageResponse> on GetxController {
  final smartRefreshCtrl = RefreshController(initialRefresh: true);
  final Rxn<T> _data = Rxn(null);

  set data(T? val) => _data.value = val;

  T? get data => _data.value;

  bool get noMoreData => data?.totalRecord == data?.record.length;

  onRefresh() async {
    try {
      final refreshData = await getPageList(1);
      data = refreshData;
      smartRefreshCtrl.refreshCompleted(resetFooterState: true);
      onRefreshSuccess(data);
    } catch (e) {
      smartRefreshCtrl.refreshFailed();
      onRefreshFailed(e);
    }
  }

  onLoading() async {
    if (data != null) {
      try {
        final loadData = await getPageList(data!.pageNum.toInt() + 1);
        final appendList = (data?.record ?? []) + (loadData.record);
        final same = data?.record.length == appendList.length;
        data = loadData.copyWith(record: appendList) as T;
        if (same) {
          smartRefreshCtrl.loadNoData();
        } else {
          noMoreData ? smartRefreshCtrl.loadNoData() : smartRefreshCtrl.loadComplete();
        }
        onLoadedSuccess(data);
      } catch (e) {
        smartRefreshCtrl.loadFailed();
        smartRefreshCtrl.loadNoData();
        onLoadedFailed(e);
      }
    }
  }

  Future<T> getPageList(int page);

  void onRefreshFailed(e) {}

  void onLoadedFailed(e) {}

  void onRefreshSuccess(T? data) {}

  void onLoadedSuccess(T? data) {}
}
