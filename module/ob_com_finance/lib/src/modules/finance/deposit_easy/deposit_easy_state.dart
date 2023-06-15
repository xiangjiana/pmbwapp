import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DepositEasyState {
  final ScrollController scrollController = ScrollController();
  final RefreshController refreshController = RefreshController();
  GlobalKey globalKey = GlobalKey();
  DepositEasyState() {
    ///Initialize variables
  }
}
