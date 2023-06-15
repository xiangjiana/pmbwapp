import 'package:flutter_test/flutter_test.dart';
import 'package:ob_component/ob_component.dart';

void main() {
  test('int fixed 2 decimal-point', () {
    expect(1.fixed(2), '1.00');
  });

  test('double fixed 2 decimal-point', () {
    expect(1.0.fixed(2), '1.00');
    expect(1.40.fixed(2), '1.40');
    expect(1.598.fixed(2), '1.59');
    expect(1.1.fixed(2), '1.10');
  });
}
