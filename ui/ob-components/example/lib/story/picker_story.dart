import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

///
final Story pickerStory = Story(
  section: 'General',
  name: 'Picker',
  builder: (BuildContext ctx, KnobsBuilder k) {
    final DateTime now = DateTime.now();
    return Column(
      children: <Widget>[
        const SizedBox(height: 50),
        SecondaryButton(
          block: true,
          child: const Text('地址选择器'),
          onPressed: () async {
            final AddressResult? result = await showAddressPicker(context: ctx);
            if (result != null) {
              BotToast.showText(
                  text:
                  result.provinceName + result.cityName + result.townName);
            }
          },
        ),
        const SizedBox(height: 20),
        SecondaryButton(
          block: true,
          child: const Text('时间选择器'),
          onPressed: () async {
            final DateTime? result = await showObDatePicker(
                context: ctx,
              initialDateTime: now,
              minimumDate: now.subtract(const Duration(days: 90)),
              maximumDate: now.add(const Duration(days: 360)),
            );
            if (result != null) {
              BotToast.showText(
                  text: result.toString());
            }
          },
        ),
        const SizedBox(height: 20),
        SecondaryButton(
          block: true,
          child: const Text('时间范围选择器'),
          onPressed: () async {
            final TimeRange? result = await showObDateRangePicker(
                context: ctx,
              initialStartDateTime: now.subtract(const Duration(days: 30)),
              initialEndDateTime: now.add(const Duration(days: 10)),
              minimumDate: now.subtract(const Duration(days: 90)),
              maximumDate: now.add(const Duration(days: 15)),
              beforeConfirmListener: (TimeRange timeRange){
                  print(timeRange.toString());
                  return true;
              }
            );
            if (result != null) {
              BotToast.showText(
                  text: result.toString());
            }
          },
        ),
        const SizedBox(height: 20),
        SecondaryButton(
          block: true,
          child: const Text('选择器,返回index'),
          onPressed: () async {
            final int? result = await showPicker(
                context: ctx, children: <Widget>[
              const Center(
                child: Text(
                  '男',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const Center(
                child: Text(
                  '女',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ]);
            if (result != null) {
              BotToast.showText(
                  text: result.toString());
            }
          },
        ),
      ],
    );
  },
);
