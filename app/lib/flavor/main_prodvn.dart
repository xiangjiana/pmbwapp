
import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:ob_package/flavor/properties.dart';
import 'package:ob_package/main.dart';

void main() {
  Flavor.create(
    Environment.production,
    color: Colors.green,
    properties: properties['prod_vn'],
  );
  setupApp();
}