import 'package:get/get.dart';
import 'package:ob_package/modules/settings/contact_us/repository/contact_us_repository.dart';
import 'package:ob_com_base/ob_com_base.dart';


class ContactUsController extends GetxController {
  final ContactRepository repository;
  final _feedbackEmail = '--'.obs;

  get feedbackEmail => _feedbackEmail.value;

  final _customerServiceEmail = '--'.obs;

  get customerServiceEmail => _customerServiceEmail.value;

  final _contactEmail = '--'.obs;

  get contactEmail => _contactEmail.value;

  ContactUsController(this.repository);

  @override
  void onReady() {
    super.onReady();
    // runCatch(() async {
    //   final res1 = await repository.getConfigRes(5);
    //   _feedbackEmail.value = res1.data.isEmpty ? '' : res1.data[0].resourcesUrl;
    //   final res2 = await repository.getConfigRes(6);
    //   _customerServiceEmail.value = res2.data.isEmpty ? '' : res2.data[0].resourcesUrl;
    //   final res3 = await repository.getConfigRes(7);
    //   _contactEmail.value = res3.data.isEmpty ? '' : res3.data[0].resourcesUrl;
    // });
  }
}
