import 'package:flutter/cupertino.dart'
    hide CupertinoDatePicker, CupertinoDatePickerMode;
import 'package:flutter/material.dart';
import 'package:ob_component/src/ob_widget/picker/date_picker/date_picker.dart';
import 'package:ob_component/src/ob_widget/picker/picker_selection_overlay.dart';
import 'package:ob_component/src/ob_widget/picker/picker_title.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

///
class ObDatePicker extends StatefulWidget {
  ///
  const ObDatePicker({
    Key? key,
    this.onCancelListener,
    this.onConfirmListener,
    this.initialDateTime,
    this.minimumDate,
    this.maximumDate,
  }) : super(key: key);

  ///
  final VoidCallback? onCancelListener;

  ///
  final ValueChanged<DateTime>? onConfirmListener;

  ///
  final DateTime? initialDateTime;

  ///
  final DateTime? minimumDate;

  ///
  final DateTime? maximumDate;

  @override
  _ObDatePickerState createState() => _ObDatePickerState();
}

class _ObDatePickerState extends State<ObDatePicker> {
  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PickerTitle(
          onCancelListener: Navigator.of(context).pop,
          onConfirmListener: () => Navigator.of(context).pop(time),
        ),
        Expanded(
          child: CupertinoTheme(
            data: const CupertinoThemeData(
              textTheme: CupertinoTextThemeData(
                dateTimePickerTextStyle:
                    TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            child: CupertinoDatePicker(
              selectionOverlay: const PickerSelectionOverlay(),
              mode: CupertinoDatePickerMode.date,
              itemExtent: 40,
              initialDateTime: widget.initialDateTime,
              minimumDate: widget.minimumDate,
              maximumDate: widget.maximumDate,
              onDateTimeChanged: (DateTime value) {
                setState(() {
                  time = value;
                  Vibrate.feedback(FeedbackType.impact);
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
