import 'package:flutter/cupertino.dart'
    hide CupertinoDatePicker, CupertinoDatePickerMode;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ob_component/src/ob_widget/picker/date_picker/date_picker.dart';
import 'package:ob_component/src/ob_widget/picker/date_range_picker/time_range.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

const Color _textColor = Color(0xffE1A100);

///
class DateRangePicker extends StatefulWidget {
  ///
  const DateRangePicker({
    Key? key,
    this.onChangeListener,
    this.minimumDate,
    this.maximumDate,
    this.controller,
    this.initialStartDateTime,
    this.initialEndDateTime,
    this.beginTxt,
    this.tillTxt,
  }) : super(key: key);

  ///
  final ValueChanged<TimeRange>? onChangeListener;

  ///
  final DateTime? minimumDate;

  ///
  final DateTime? maximumDate;

  ///
  final DateTime? initialStartDateTime;

  ///
  final DateTime? initialEndDateTime;

  ///
  final DateRangePickerController? controller;

  ///
  final String? beginTxt;

  ///
  final String? tillTxt;

  ///
  @override
  _DateRangePickerState createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  bool startTimeChanged = false;
  DateTime? minimumDate;
  DateTime? maximumDate;
  DateTime? minimumDateSec;
  DateTime? maximumDateSec;
  UniqueKey _initialStartTimeKey = UniqueKey();
  UniqueKey _initialEndDateTimeKey = UniqueKey();
  late DateTime initialStartDateTime =
      widget.initialStartDateTime ?? DateTime.now();
  late DateTime initialEndDateTime =
      widget.initialEndDateTime ?? DateTime.now();
  DateTime? minimumEndDate;
  DateTime? maximumStartDate;

  late String startDate;
  late String endDate;
  late DateRangePickerController controller =
      widget.controller ?? DateRangePickerController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        _initialStartTimeKey = UniqueKey();
        _initialEndDateTimeKey = UniqueKey();
        minimumDate = widget.minimumDate;
        maximumDate = widget.maximumDate;
        minimumDateSec = widget.minimumDate;
        maximumDateSec = widget.maximumDate;
        startDate = DateFormat('yyyy-MM-dd').format(initialStartDateTime);
        endDate = DateFormat('yyyy-MM-dd').format(initialEndDateTime);
        minimumEndDate = null;
        maximumStartDate = null;
      });
    });

    controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    _handlerEndTimeMinimum();

    return Container(
      height: 193,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: 56,
            decoration: BoxDecoration(
                color: const Color(0x0fE1A100),
                borderRadius: BorderRadius.circular(56)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 4),
                  child: Text(
                    widget.beginTxt ?? "起",
                    style: const TextStyle(color: _textColor, fontSize: 14.0),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: CustomPaint(
                      painter: _DateRangeLine(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 24),
                  child: Text(
                    widget.tillTxt ?? "止",
                    style: const TextStyle(color: _textColor, fontSize: 14.0),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 12),
                      child: CupertinoTheme(
                        data: const CupertinoThemeData(
                          textTheme: CupertinoTextThemeData(
                            dateTimePickerTextStyle:
                                TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        child: CupertinoDatePicker(
                          key: _initialStartTimeKey,
                          selectionOverlay: Container(),
                          mode: CupertinoDatePickerMode.date,
                          itemExtent: 28,
                          //原来40
                          datePickerPadSize: 10,
                          magnification: 1.03,
                          isPickerColumnOnlyCenter: true,
                          initialDateTime:
                              _handleDateFormat(initialStartDateTime),
                          minimumDate: _handleDateFormat(minimumDate),
                          maximumDate: _handleDateFormat(maximumDate),
                          onDateTimeChanged: (DateTime value) {
                            setState(() {
                              Vibrate.feedback(FeedbackType.impact);
                              startTimeChanged = false;
                              minimumEndDate = value;
                              startDate =
                                  DateFormat('yyyy-MM-dd').format(value);
                              widget.onChangeListener
                                  ?.call(TimeRange(startDate, endDate));
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.white.withOpacity(0.06),
                    thickness: 1.2,
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 12),
                      child: CupertinoTheme(
                        data: const CupertinoThemeData(
                          textTheme: CupertinoTextThemeData(
                            dateTimePickerTextStyle:
                                TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        child: CupertinoDatePicker(
                          key: _initialEndDateTimeKey,
                          selectionOverlay: Container(),
                          mode: CupertinoDatePickerMode.date,
                          itemExtent: 28,
                          //原来40
                          datePickerPadSize: 10,
                          magnification: 1.03,
                          isPickerColumnOnlyCenter: true,
                          initialDateTime:
                              _handleDateFormat(initialEndDateTime),
                          minimumDate: _handleDateFormat(minimumDateSec),
                          maximumDate: _handleDateFormat(maximumDateSec),
                          onDateTimeChanged: (DateTime value) {
                            setState(() {
                              Vibrate.feedback(FeedbackType.impact);
                              startTimeChanged = true;
                              maximumStartDate = value;
                              endDate = DateFormat('yyyy-MM-dd').format(value);
                              widget.onChangeListener
                                  ?.call(TimeRange(startDate, endDate));
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //选择开始时间以后 结束时间范围变成从开始时间到最大时间
  //选择结束时间以后 开始时间范围变成从最小时间到结束时间
  void _handlerEndTimeMinimum() {
    if (!startTimeChanged) {
      minimumDate = widget.minimumDate;
      maximumDate = maximumStartDate ?? initialEndDateTime;
    }
    if (startTimeChanged) {
      maximumDate = widget.maximumDate;
      minimumDate = minimumEndDate ?? initialStartDateTime;
    }

    initialStartDateTime = widget.initialStartDateTime ?? DateTime.now();
    DateTime initialDateTime1 = initialStartDateTime;
    DateTime initialDateTime2 = initialStartDateTime;
    if (minimumDate != null) {
      initialDateTime1 = initialStartDateTime.compareTo(minimumDate!) < 0
          ? minimumDate!
          : initialStartDateTime;
    }
    if (maximumDate != null) {
      initialDateTime2 = initialStartDateTime.compareTo(maximumDate!) > 0
          ? maximumDate!
          : initialEndDateTime;
    }

    initialStartDateTime = initialDateTime1.compareTo(initialDateTime2) < 0
        ? initialDateTime1
        : initialDateTime2;

    if (minimumDate != null) {
      initialStartDateTime = initialStartDateTime.compareTo(minimumDate!) < 0
          ? minimumDate!
          : initialStartDateTime;

      initialEndDateTime = initialEndDateTime.compareTo(minimumDate!) < 0
          ? minimumDate!
          : initialEndDateTime;
    }

    minimumDateSec = minimumDate;
    minimumDate = widget.minimumDate;
    maximumDateSec = widget.maximumDate;
  }

  //格式化，去掉时分秒
  DateTime? _handleDateFormat(DateTime? dateTime) {
    if (dateTime != null) {
      return DateFormat('yyyy-MM-dd').parse(dateTime.toString());
    } else {
      return dateTime;
    }
  }
}

class _DateRangeLine extends CustomPainter {
  void drawLine(Canvas canvas, Size size) {
    final double sw = size.width;
    final double sh = size.height;

    const double shortLineHeight = 5.0;
    const double shortLineHeightSpace = 5.0;
    const double space = shortLineHeight + shortLineHeightSpace;
    double startY = 0;

    Offset p1 = Offset(sw * 0.5, startY);
    Offset p2 = Offset(sw * 0.5, startY + shortLineHeightSpace);

    final Paint paint = Paint()
      ..color = _textColor
      ..isAntiAlias = false
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    while (startY < sh) {
      p1 = Offset(sw * 0.5, startY);
      p2 = Offset(sw * 0.5, startY + shortLineHeightSpace);

      canvas.drawLine(p1, p2, paint);
      startY += space;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    drawLine(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class DateRangePickerController extends ChangeNotifier {
  // 重置日期
  void reset() {
    notifyListeners();
  }
}
