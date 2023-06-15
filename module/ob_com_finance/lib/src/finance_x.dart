class FinanceX {
  static const String pkg = 'ob_com_finance';

  static FinanceX? _instance;

  static FinanceX get instance => _instance ??= FinanceX._();

  bool _isInitialized = false;

  FinanceX._();

  Future<void> setup() async {
    if (_isInitialized) return;
    _isInitialized = true;
  }
}
