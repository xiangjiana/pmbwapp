
import 'build_package_replace.dart';

void main() {

  BuildPackageReplaceManager().updateList("OB包网", "明商国际", [
    'index.html',
    'inner.html',
    'manifest.json',
  ]);
  
  BuildPackageReplaceManager().updateList("icons\/", "icons_msgj\/", [
    'index.html',
    'inner.html',
    'manifest.json',
  ]);

  BuildPackageReplaceManager().updateList("OBBW-", "MSGJ-", [
    'tools.js',
  ]);
}