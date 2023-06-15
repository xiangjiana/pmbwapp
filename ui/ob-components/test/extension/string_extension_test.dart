import 'package:flutter_test/flutter_test.dart';
import 'package:ob_component/ob_component.dart';

void main() {
  test('Test isNullOrEmpty', () {
    expect(''.isNullOrEmpty, true);
    expect(null.isNullOrEmpty, true);
    expect('Hello'.isNullOrEmpty, false);
  });

  test('Test isNullOrEmpty', () {
    expect(''.isNotNullOrEmpty, false);
    expect(null.isNotNullOrEmpty, false);
    expect('Hello'.isNotNullOrEmpty, true);
  });
}
