import 'dart:io';

import 'build_package_replace.dart';

void main(List<String> arguments) {
  try {
    final channel = arguments.first;
    switch (channel) {
      case 'test':
      case 'pre':
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
    "OB包网": "X1 BET",
    "icons\/": "icons_x1bet\/",
  }, [
    'index.html',
    'inner.html',
    'manifest.json',
  ]);

  BuildPackageReplaceManager().updateList("OBBW-", "X1Bet-", [
    'tools.js',
  ]);
}

void testBuildRunReplace() {
  BuildPackageReplaceManager()
      .updateFulLPathList("com.obpn.x1bet", "com.obpn.vn.qa", [
    'android/app/build.gradle',
  ]);

  BuildPackageReplaceManager().updateFulLPathListForMap({
    "com.obpn.x1bet": "com.obpn.vn.qa",
    "obpn_x1bet": "obpn_vn_qa",
  }, [
    'ios/Runner.xcodeproj/project.pbxproj',
    'ExportOptions_x1bet.plist',
  ]);
}
