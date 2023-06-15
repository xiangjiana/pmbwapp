import 'package:encrypt_interceptor/encrypt_interceptor.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final appEncrypter = AppEncrypter('OdTobUzRSX75agqa',false);

    setUp(() {
      // Additional setup goes here.
    });

    test('解密字符串', () {
      expect(
          {"number": 5, "bigType": 2},
          appEncrypter.deCryptResponse(
              r'gf4Dg5on7bRFCMUNhFgKvk/fQa3Thp9DkhV5aARdpW7ndzq9CuMI2KUOgYG6qId2'));
    });
  });
}
