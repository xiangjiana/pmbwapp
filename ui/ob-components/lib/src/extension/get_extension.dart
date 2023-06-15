import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_component/src/ob_widget/picker/address_picker/address_result.dart';
import 'package:ob_component/src/ob_widget/picker/date_range_picker/ob_date_range_picker.dart';
import 'package:ob_component/src/ob_widget/picker/date_range_picker/time_range.dart';
import 'package:ob_component/src/ob_widget/picker/picker.dart';

///
extension ExtensionPicker on GetInterface {
  ///
  Future<AddressResult?> addressPicker({
    bool useRootNavigator = false,
  }) {
    return showAddressPicker(
      context: overlayContext!,
      useRootNavigator: useRootNavigator,
    );
  }

  ///
  Future<DateTime?> datePicker({
    bool useRootNavigator = false,
    final DateTime? initialDateTime,
    final DateTime? minimumDate,
    final DateTime? maximumDate,
  }) {
    return showObDatePicker(
      context: overlayContext!,
      useRootNavigator: useRootNavigator,
      initialDateTime: initialDateTime,
      minimumDate: minimumDate,
      maximumDate: maximumDate,
    );
  }

  ///
  Future<TimeRange?> dateRangePicker(
      {bool useRootNavigator = false,
      final DateTime? minimumDate,
      final DateTime? maximumDate,
      final DateTime? initialStartDateTime,
      final DateTime? initialEndDateTime,
      final BeforeConfirmCallback? beforeConfirmListener}) {
    return showObDateRangePicker(
        context: overlayContext!,
        useRootNavigator: useRootNavigator,
        minimumDate: minimumDate,
        maximumDate: maximumDate,
        initialStartDateTime: initialStartDateTime,
        initialEndDateTime: initialEndDateTime,
        beforeConfirmListener: beforeConfirmListener);
  }

  ///
  Future<int?> picker({
    required List<Widget> children,
    bool useRootNavigator = false,
  }) {
    return showPicker(
        context: overlayContext!,
        useRootNavigator: useRootNavigator,
        children: children);
  }
}
