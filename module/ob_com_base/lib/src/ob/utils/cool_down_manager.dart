class CoolDownManager {
  CoolDownManager._privateConstructor();

  static final CoolDownManager _instance =
      CoolDownManager._privateConstructor();

  static CoolDownManager get instance {
    return _instance;
  }

  static Map<String, int> timeMap = {};

  static bool handler({required String key, required int duration}) {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    if (currentTime - (timeMap[key] ?? 0) > duration) {
      timeMap[key] = DateTime.now().millisecondsSinceEpoch;
      return true;
    }
    return false;
  }
}
