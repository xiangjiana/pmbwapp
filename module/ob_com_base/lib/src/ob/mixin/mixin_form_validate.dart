import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

mixin FormValidate on GetxController {
  final formKey = GlobalKey<FormState>();

  final _isValidate = false.obs;

  bool get isValidate => _isValidate.value;

  set isValidate(bool val) => _isValidate.value = val;

  void onFormChanged() {
    isValidate = formKey.currentState?.validate() ?? false;
  }
}
