import 'package:flutter/cupertino.dart'
    hide CupertinoDatePicker, CupertinoDatePickerMode;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ob_component/src/ob_widget/picker/date_picker/date_picker.dart';
import 'package:ob_component/src/ob_widget/picker/date_range_picker/time_range.dart';
import 'package:ob_component/src/ob_widget/picker/picker_selection_overlay.dart';
import 'package:ob_component/src/ob_widget/picker/picker_title.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

/// 确认回调之前
typedef BeforeConfirmCallback = bool Function(TimeRange timeRange);

///
class ObDateRangePicker extends StatefulWidget {
  ///
  const ObDateRangePicker(
      {Key? key,
      this.onCancelListener,
      this.beforeConfirmListener,
      this.onConfirmListener,
      this.minimumDate,
      this.maximumDate,
      this.initialStartDateTime,
      this.initialEndDateTime})
      : super(key: key);

  ///
  final VoidCallback? onCancelListener;

  ///
  final BeforeConfirmCallback? beforeConfirmListener;

  ///
  final ValueChanged<TimeRange>? onConfirmListener;

  ///
  final DateTime? minimumDate;

  ///
  final DateTime? maximumDate;

  ///
  final DateTime? initialStartDateTime;

  ///
  final DateTime? initialEndDateTime;

  @override
  _ObDateRangePickerState createState() => _ObDateRangePickerState();
}

class _ObDateRangePickerState extends State<ObDateRangePicker> {
  final TextEditingController startTimeCtrl = TextEditingController();
  final TextEditingController endTimeCtrl = TextEditingController();
  final FocusNode startTimeFocusNode = FocusNode();
  final FocusNode endTimeFocusNode = FocusNode();

  DateTime? minimumDate;
  DateTime? maximumDate;
  late DateTime initialDateTime = widget.initialStartDateTime ?? DateTime.now();
  late DateTime initialEndDateTime =
      widget.initialEndDateTime ?? DateTime.now();
  DateTime? minimumEndDate;
  DateTime? maximumStartDate;

  @override
  void initState() {
    super.initState();

    minimumDate = widget.minimumDate;
    maximumDate = widget.maximumDate;

    if (widget.initialStartDateTime != null) {
      startTimeCtrl.text =
          DateFormat('yyyy-MM-dd').format(widget.initialStartDateTime!);
    }

    if (widget.initialEndDateTime != null) {
      endTimeCtrl.text =
          DateFormat('yyyy-MM-dd').format(widget.initialEndDateTime!);
    }
    startTimeFocusNode.addListener(() => setState(() {}));
    endTimeFocusNode.addListener(() => setState(() {}));
    startTimeFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    _handlerEndTimeMinimum();

    return Column(
      children: <Widget>[
        PickerTitle(
          onCancelListener: Navigator.of(context).pop,
          onConfirmListener: () {
            _handlerConfirm(TimeRange(startTimeCtrl.text, endTimeCtrl.text));
          },
        ),
        Container(
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  readOnly: true,
                  style: TextStyle(
                    fontSize: 14,
                    color: startTimeFocusNode.hasFocus
                        ? const Color(0xffE1A100)
                        : Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  controller: startTimeCtrl,
                  focusNode: startTimeFocusNode,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.6),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                    fillColor: startTimeFocusNode.hasFocus
                        ? const Color(0xffE1A100).withOpacity(0.06)
                        : Colors.white.withOpacity(0.04),
                    filled: true,
                    //focusColor: Color(0xffE1A100).withOpacity(0.06),
                    hintText: '请选择',
                  ),
                ),
              ),
              const SizedBox(width: 24),
              const Text(
                '至',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: TextField(
                  readOnly: true,
                  style: TextStyle(
                    fontSize: 14,
                    color: endTimeFocusNode.hasFocus
                        ? const Color(0xffE1A100)
                        : Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  controller: endTimeCtrl,
                  focusNode: endTimeFocusNode,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.6),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                    fillColor: endTimeFocusNode.hasFocus
                        ? const Color(0xffE1A100).withOpacity(0.06)
                        : Colors.white.withOpacity(0.04),
                    filled: true,
                    hintText: '请选择',
                  ),
                ),
              )
            ],
          ),
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
              initialDateTime: initialDateTime,
              minimumDate: minimumDate,
              maximumDate: maximumDate,
              onDateTimeChanged: (DateTime value) {
                setState(() {
                  Vibrate.feedback(FeedbackType.impact);
                  if (startTimeFocusNode.hasFocus) {
                    startTimeCtrl.text = DateFormat('yyyy-MM-dd').format(value);
                    minimumEndDate = value;
                  }
                  if (endTimeFocusNode.hasFocus) {
                    endTimeCtrl.text = DateFormat('yyyy-MM-dd').format(value);
                    maximumStartDate = value;
                  }
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  //选择开始时间以后 结束时间范围变成从开始时间到最大时间
  void _handlerEndTimeMinimum() {
    if (startTimeFocusNode.hasFocus) {
      minimumDate = widget.minimumDate;
      maximumDate = maximumStartDate ?? initialEndDateTime;
    }
    if (endTimeFocusNode.hasFocus) {
      maximumDate = widget.maximumDate;
      minimumDate = minimumEndDate ?? initialDateTime;
    }

    initialDateTime = widget.initialStartDateTime ?? DateTime.now();
    DateTime initialDateTime1 = initialDateTime;
    DateTime initialDateTime2 = initialDateTime;
    if (minimumDate != null) {
      initialDateTime1 = initialDateTime.compareTo(minimumDate!) < 0
          ? minimumDate!
          : initialDateTime;
    }
    if (maximumDate != null) {
      initialDateTime2 = initialDateTime.compareTo(maximumDate!) > 0
          ? maximumDate!
          : initialEndDateTime;
    }

    initialDateTime = initialDateTime1.compareTo(initialDateTime2) < 0
        ? initialDateTime1
        : initialDateTime2;

    if (minimumDate != null) {
      initialDateTime = initialDateTime.compareTo(minimumDate!) < 0
          ? minimumDate!
          : initialDateTime;
    }

    //格式化，去掉时分秒
    if (minimumDate != null) {
      minimumDate = DateFormat('yyyy-MM-dd').parse(minimumDate.toString());
    }
    if (maximumDate != null) {
      maximumDate = DateFormat('yyyy-MM-dd').parse(maximumDate.toString());
    }
    initialDateTime =
        DateFormat('yyyy-MM-dd').parse(initialDateTime.toString());
  }

  void _handlerConfirm(TimeRange timeRange) {
    final bool confirm = widget.beforeConfirmListener?.call(timeRange) ?? true;
    if (!confirm) return;

    ///默认
    Navigator.of(context).pop(timeRange);
  }
}
