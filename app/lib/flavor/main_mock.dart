
import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:ob_package/flavor/properties.dart';
import 'package:ob_package/main.dart';

void main() {
  Flavor.create(
    Environment.dev,
    color: Colors.green,
    name: 'Mock',
    properties: properties['mock'],
  );
  setupApp();
}