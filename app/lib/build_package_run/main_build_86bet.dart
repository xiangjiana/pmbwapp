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
    "OB包网": "86BET",
    "icons\/": "icons_86bet\/",
  }, [
    'index.html',
    'inner.html',
    'manifest.json',
  ]);

  BuildPackageReplaceManager().updateList("OBBW-", "86BET-", [
    'tools.js',
  ]);
}

void testBuildRunReplace() {
  BuildPackageReplaceManager()
      .updateFulLPathList("com.obpn.bet86", "com.obpn.vn.qa", [
    'android/app/build.gradle',
  ]);

  BuildPackageReplaceManager().updateFulLPathListForMap({
    "com.obpn.86bet": "com.obpn.vn.qa",
    "obpn_86bet": "obpn_vn_qa",
  }, [
    'ios/Runner.xcodeproj/project.pbxproj',
    'ExportOptions_86bet.plist',
  ]);
}
