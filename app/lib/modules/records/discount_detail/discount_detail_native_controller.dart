import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/mixin/mixin_web_signal_handler.dart';

import 'package:ob_package/modules/records/discount_detail/discount_details_mixin.dart';
import 'package:ob_package/modules/records/discount_detail/repository/repository.dart';
import 'package:ob_package/utils/tool_kit.dart';

class DiscountDetailNativeController extends GetxController
    with WebSignalHandler, DiscountDetailsMixin {
  final DiscountDetailRepository repository;

  DiscountDetailNativeController(this.repository);

  final _isLoading = GetPlatform.isWeb ? false.obs : true.obs;

  set isLoading(bool value) => _isLoading.value = value;

  bool get isLoading => _isLoading.value;

  String get vipLevel => authService.vipLevel;

  @override
  void jumpToPage(String page) {
    super.jumpToPage(page);

    if (page == WebUtil.sharingLink) {
      showPoster(); // 分享
    }
  }

  String generateUrl() {
    return ToolKit.instance.addSignatureForActivityUrl(
      link: discount?.pageRouteAddr ?? '',
      type: DiscountEnum.discount,
      id: discount?.id,
    );
  }
}
