function codeGen() {
  fvm use 3.7.9
  fvm flutter pub get
  fvm flutter packages pub run build_runner build --delete-conflicting-outputs
}

function deleteCacheFile() {
  find . -name "pubspec.lock" | xargs rm -Rf
  find . -name "web.zip" | xargs rm -Rf
  find . -name "main.dart.js" | xargs rm -Rf
  find . -name "*.dart.js" | xargs rm -Rf
}

function buildAPK() {
  fvm flutter build apk --release --flavor "$1" --no-sound-null-safety -t lib/flavor/main_"$1".dart
}

function buildIpa() {
  set -xe
  cd ios || exit
  pod install
  pod update
  cd ..
  security unlock-keychain -p 1234
  fvm flutter build ipa --release --flavor "$1" --export-options-plist=ExportOptions_"$1".plist --no-sound-null-safety -t lib/flavor/main_"$1".dart
}

function buildH5() {
  set -xe
  fvm flutter build web --web-renderer html --no-sound-null-safety -t lib/flavor/main_"$1".dart --dart2js-optimization O1
  cp -r ./build/app/intermediates/flutter/"$1"Release/flutter_assets/fonts ./web/assets
  cd build/web || exit
  uuid=$(uuidgen)
  sed -i ".bak" "s/main.dart.js/$uuid.main.dart.js/g" inner.html
  split -n 4 -d -a 1 main.dart.js main.package && ls | grep main.package | xargs -n1 -I {} mv {} {}.dart.js
  cd ../../
}

function deployH5() {
  path1='/home/deploy/www/86bet-pre-h5'
  now=$(date +%Y%m%d-%H%M%S)
  echo $now
  ssh root@172.21.185.201 "mkdir -p $path1/workspace/$now"
  scp -r build/web root@172.21.185.201:$path1/workspace/$now
  ssh root@172.21.185.201 "chmod -R 755 $path1/workspace/$now;ln -snf $path1/workspace/$now/web $path1/current"
}

function upgradeBuildNumber() {
  fvm dart lib/utils/update_version.dart
  git add pubspec.yaml
  git commit -m "chore: 自动更新版本号"
  git push origin HEAD:"$1"
}

cd app || exit
deleteCacheFile
codeGen
buildAPK "$1"
buildIpa "$1"
buildH5 "$1"
#deployH5
upgradeBuildNumber "$2"
