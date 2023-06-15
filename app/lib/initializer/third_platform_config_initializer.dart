import 'dart:async';

import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/initializer/app_initializer.dart';
import 'package:vendor_auth/vendor_auth.dart';

class ThirdPlatformConfigInitializer extends AppInitializer {
  @override
  FutureOr<void> init() {
    //if (kIsWeb) {
    final code = Flavor.I.getString(MERCHANT_CODE);
    switch (code) {
      case 'VWBET':
        VendorAuth.instance.initialize(
          '1173291483351489',
          '3967005489713630043',
          'zOi1Xlf337FJCHE2LHK8',
        );
        break;
      case 'Z68BET':
        VendorAuth.instance.initialize(
          '1173291483351489',
          '3967005489713630043',
          'zOi1Xlf337FJCHE2LHK8',
        );
        break;
      case 'X1BET':
        VendorAuth.instance.initialize(
          '691216802694104',
          '3992522152404984517',
          'PrioQH8iWgG1r9TRCIJu',
        );
        break;
      default:
        // TODO 需要配置 web 版本的 zalo secret
        VendorAuth.instance.initialize(
            '1089758781678258', '430353615650646128', 'RU4NV5DKS76FS6fFV5SW');
    }
    //}
  }
}
