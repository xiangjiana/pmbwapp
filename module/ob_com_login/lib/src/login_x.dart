import 'package:flavor/flavor.dart';

import 'login_callback.dart';

class LoginX {
  static const String pkg = 'ob_com_login';

  ///模块回调
  LoginCallback? loginCallback;

  Flavor? flavor;

  static LoginX? _instance;

  static LoginX get instance => _instance ??= LoginX._();

  LoginX._();
}
