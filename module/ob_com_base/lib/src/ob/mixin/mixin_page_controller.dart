import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

mixin ObPageController<T> on GetxController {
  final smartRefreshCtrl = RefreshController(initialRefresh: true);
  final Rxn<PageResponse<T>> _data = Rxn(null);

  set data(PageResponse<T>? val) => _data.value = val;

  PageResponse<T>? get data => _data.value;

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
  bool loading=false;//同时只允许一个加载请求，避免快速滑动列表导致的数据重复异常OB-8762
  onLoading() async {
    if (data != null) {
      try {
        if(loading)return;
        loading=true;
        final loadData = await getPageList(data!.pageNum + 1);
        loading=false;
        final appendList = (data?.record ?? []) + (loadData.record);
        final same = data?.record.length == appendList.length;
        data = loadData.copyWith(record: appendList);
        if (same) {
          smartRefreshCtrl.loadNoData();
        } else {
          noMoreData ? smartRefreshCtrl.loadNoData() : smartRefreshCtrl.loadComplete();
        }
        onLoadedSuccess(data);
      } catch (e) {
        loading=false;
        smartRefreshCtrl.loadFailed();
        smartRefreshCtrl.loadNoData();
        onLoadedFailed(e);
      }
    }
  }

  Future<PageResponse<T>> getPageList(int page);

  void onRefreshFailed(e) {}

  void onLoadedFailed(e) {}

  void onRefreshSuccess(PageResponse<T>? data) {}

  void onLoadedSuccess(PageResponse<T>? data) {}
}