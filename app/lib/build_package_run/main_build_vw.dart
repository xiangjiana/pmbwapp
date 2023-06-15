import 'dart:io';

import 'build_package_replace.dart';

void main(List<String> arguments) {
  try {
    final channel =
        const String.fromEnvironment('channel', defaultValue: 'prod');
    switch (channel) {
      case 'test':
        testBuildRunReplace();
        break;
      case 'prod':
      default:
        break;
    }

    replaceH5();
  } catch (e) {
    exitCode = 2;
  }
}

void replaceH5() {
  BuildPackageReplaceManager().updateListForMap({
    "OB包网": "VWBet",
    "icons\/": "icons_vwbet_a\/",
  }, [
    'index.html',
    'inner.html',
    'manifest.json',
  ]);

  BuildPackageReplaceManager().updateList("OBBW-", "VWBet-", [
    'tools.js',
  ]);
}

void testBuildRunReplace() {
  BuildPackageReplaceManager()
      .updateFulLPathList("com.obpn.vwbet", "com.obpn.vn.qa", [
    'android/app/build.gradle',
  ]);

  BuildPackageReplaceManager().updateFulLPathListForMap({
    "com.obpn.vwbet": "com.obpn.vn.qa",
    "obpn_vwbet": "obpn_vn_qa",
  }, [
    'ios/Runner.xcodeproj/project.pbxproj',
    'ExportOptions_x1bet.plist',
  ]);
}
