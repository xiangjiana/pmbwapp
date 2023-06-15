
import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:ob_package/flavor/properties.dart';
import 'package:ob_package/main.dart';

void main() {
  final channel = const String.fromEnvironment('channel',defaultValue: 'test');
  switch (channel) {
    case 'prod':
      Flavor.create(
        Environment.production,
        color: Colors.green,
        properties: properties['prod_msgj'],
      );
      break;
    case 'test':
    default:
      Flavor.create(
        Environment.beta,
        color: Colors.green,
        name: '测试',
        properties: properties['test_msgj'],
      );
      break;
  }
  setupApp();
}
