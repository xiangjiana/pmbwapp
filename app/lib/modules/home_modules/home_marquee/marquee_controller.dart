import 'dart:async';

import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_package/modules/home/components/controller/home_widget_auto_refresh_manager.dart';
import 'package:ob_package/modules/home/home_repository.dart';
import 'package:ob_com_base/ob_com_base.dart';
class MarqueeController extends GetxController {
  final repository = Get.find<HomeRepository>();
  final _isMarqueeShow = true.obs;
  RxList<ObConfigAnnouncement> announcementList = <ObConfigAnnouncement>[].obs;
  List<ObConfigAnnouncement> oldAnnouncementList = <ObConfigAnnouncement>[];
  List<ObConfigAnnouncement> resAnnouncementList = [];
  RxInt announcementCurrentIndex = 0.obs;
  late StreamSubscription refreshListener;
  int marqueeIndex = 0;

  bool get isMarqueeShow => _isMarqueeShow.value;

  setMarqueeShow(){
    _isMarqueeShow.value = true;
  }

  @override
  void onInit() {
    super.onInit();
    getMessageCenterSelectAnnounceList();
    refreshListener = eventBus.on<HomeModuleEvent>().listen((event) {
      if (Get.currentRoute == AppRoutes.HOME &&
          Store.currentRootPageIndex == 0 &&
          event.name == homeTopTimerRefresh) {
        getMessageCenterSelectAnnounceList();
      }
    });
  }

  void onHandleClose() {
    _isMarqueeShow.value = false;
  }

  void onChangeAnIndex(int index) {
    announcementCurrentIndex.value = index;
  }



  Future<void> getMessageCenterSelectAnnounceList() async {
    try {
      final resAnnouncementList = await repository.getMessageCenterSelectAnnounceList();
      resAnnouncementList.forEach((e) => e.announcementContent.replaceAll(RegExp(r"[\n|\r]"), ""));
      if (resAnnouncementList.isEmpty) {
        _isMarqueeShow.value = false;
      }
      int news = resAnnouncementList.uniContent.hashCode;
      int olds = announcementList.value.uniContent.hashCode;
      if (news != olds) {
        _isMarqueeShow.value = true;
        announcementList.value = resAnnouncementList;
      }
    } catch (_) {}
  }

  void addItemInList() {
    List<ObConfigAnnouncement> list = [];
    list.addAll(announcementList);
    list.addAll(resAnnouncementList);
    list = removeDuplicates(list);
    announcementList.value = list;
  }

  void removeItemInList() {
    announcementList.value = resAnnouncementList;
  }

  List<ObConfigAnnouncement> removeDuplicates(List<ObConfigAnnouncement> list) {
    var _a = new Set();
    List<ObConfigAnnouncement> _h = [];
    for (int i = 0; i < list.length; i++) {
      _a.add(list[i].id);
    }
    List _b = _a.toList();
    for (int j = 0; j < _a.length; j++) {
      for (int i = 0; i < list.length; i++) {
        if (_b[j] == list[i].id) {
          _h.add(list[i]);
          break;
        }
      }
    }
    return _h;
  }

  @override
  void onClose() {
    refreshListener.cancel();
    super.onClose();
  }
}

extension on List<ObConfigAnnouncement> {
  String get uniContent {
    return this.fold<String>(
        "",
        (previousValue, element) =>
            previousValue + element.announcementContent);
  }
}
