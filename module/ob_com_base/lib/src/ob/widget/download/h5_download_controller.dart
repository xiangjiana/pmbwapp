import 'package:config/config.dart';
import 'package:get/get.dart';


class H5DownloadController extends GetxController {
  final configApi = Get.find<ConfigApi>();
  String url = 'https://obqj91.7cjhczal.com/';

  @override
  void onInit() {
    super.onInit();
    _getDownloadUrl();
  }

  void _getDownloadUrl() async {
    try {
      final res = await configApi.getCodeDownloadUrl();
      if (res.downUrl.startsWith("https://") ||
          res.downUrl.startsWith("http://")) {
        this.url = res.downUrl;
      } else {
        this.url = "https://" + res.downUrl;
      }
    } catch (e) {
      print(e);
    }
  }
}
