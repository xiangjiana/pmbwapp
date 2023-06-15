import 'package:get/get.dart';
class HelpEmptyController extends GetxController {

  String tutorName = '';

  @override
  void onInit() {
    super.onInit();
    Map para = Get.parameters;
    String? tutorStr = para['tutorName'];
    if (tutorStr != null) tutorName = tutorStr;

  }
}
