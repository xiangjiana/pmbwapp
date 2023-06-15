import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_finance/src/modules/records/access_record/repository/ui_access_record.dart';
import 'package:ob_com_base/ob_com_base.dart';

class AccessRecordDetailController extends GetxController {
  final UiAccessRecordDetail record = Get.arguments;

  void copyEventId() async {
    if(kIsWeb){
      WebUtil.copyText2Clipboard(record.id);
    }else{
      await Clipboard.setData(ClipboardData(text: record.id));
    }
    showToast("access_record_copy_successfully".tr);
  }
}
