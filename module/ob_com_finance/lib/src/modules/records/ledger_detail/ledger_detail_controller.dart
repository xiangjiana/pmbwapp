import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';

class LedgerDetailController extends GetxController {
  final MemberAccountRecording record = Get.arguments;

  //是否是从存款结果页面过来的 此页面是复用的 需要一定的适配
  bool isFromDepositResultPage() {
    return record.eventId.contains('fromdeposit');
  }

  String pureEventId() {
    return record.eventId.replaceFirst("fromdeposit", '');
  }

  void copyEventId() async {
    if(kIsWeb){
      WebUtil.copyText2Clipboard(pureEventId());
    }else{
      await Clipboard.setData(ClipboardData(text: pureEventId()));
    }
    showToast("copy_successfully".tr);
  }
}
