import 'build_package_replace.dart';

void main() {

  BuildPackageReplaceManager().updateFulLPathList("OB包网", "เครือข่ายแพ็คเก็ต OB", [
    'web/index.html',
    'web/inner.html',
    'web/manifest.json',
    'android/app/src/main/res/values/strings.xml',
    'android/app/src/main/res/values-zh-rCN/strings.xml',
    'ios/Runner.xcodeproj/project.pbxproj',
  ]);

}