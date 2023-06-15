class HttpX {
  static const String pkg = 'ob_com_http';

  static HttpX? _instance;

  static HttpX get instance => _instance ??= HttpX._();
  bool _isInitialized = false;

  HttpX._();

  void setup() {
    if (_isInitialized) return;

    _isInitialized = true;
  }
}
