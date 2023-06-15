import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

///
final Story dateRangePickerStory = Story(
  section: 'General',
  name: 'DateRangePicker',
  builder: (BuildContext ctx, KnobsBuilder k) {
    final DateTime now = DateTime.now();
    final DateRangePickerController controller = DateRangePickerController();
    return Column(
      children: <Widget>[
        const SizedBox(height: 50),
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
                beforeConfirmListener: (TimeRange timeRange) {
                  print(timeRange.toString());
                  return true;
                });
            if (result != null) {
              BotToast.showText(text: result.toString());
            }
          },
        ),
        const SizedBox(height: 20),
        Container(
          color: const Color(0xff151E25),
          // width: 500,
          child: DateRangePicker(
            initialStartDateTime: now.subtract(const Duration(days: 30)),
            initialEndDateTime: now.add(const Duration(days: 10)),
            minimumDate: now.subtract(const Duration(days: 90)),
            maximumDate: now.add(const Duration(days: 15)),
            controller: controller,
            onChangeListener: (TimeRange timeRange) {
              print(timeRange.toString());
            },
          ),
        ),
        const SizedBox(height: 50),
        SecondaryButton(
          block: true,
          child: const Text('点击重置'),
          onPressed: () async {
            controller.reset();
          },
        ),
      ],
    );
  },
);
