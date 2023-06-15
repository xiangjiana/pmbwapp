import 'dart:io';

class BuildPackageReplaceManager {

  void updateList(String key , String rKey ,List<String> list) {
    list.forEach((element) {
      updateSKey({key: rKey}, 'web/$element');
    });
  }

  void updateListForMap(Map<String,String> map ,List<String> list) {
    list.forEach((element) {
      map.forEach((key, value) {
        updateSKey(map, 'web/$element');
      });
    });
  }

  void updateFulLPathList(String key , String rKey ,List<String> fullPathList) {
    fullPathList.forEach((element) {
      updateSKey({key: rKey}, element);
    });
  }

  void updateFulLPathListForMap(Map<String,String> map ,List<String> fullPathList) {
    fullPathList.forEach((element) {
      map.forEach((key, value) {
        updateSKey(map, element);
      });
    });
  }

  void updateSKey(Map<String,String>rMap, String path) {

    String _testContent = '';

    File iFile = File(path);

    for (String line in iFile.readAsLinesSync()) {
      rMap.forEach((key, value) {
        if (line.contains(key)) {
          line = line.replaceAll(key, value);
        }
      });
      _testContent = "$_testContent\n$line";
    }
    _testContent = _testContent.replaceFirst(RegExp(r'\n'), '');
    iFile.writeAsString(_testContent);
  }

}