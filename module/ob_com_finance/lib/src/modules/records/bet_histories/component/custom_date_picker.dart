import 'package:flutter/material.dart' hide PageController;
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme, PrimaryButton;
import 'package:ob_com_base/ob_com_base.dart';

class CustomDatePicker extends StatelessWidget {
  CustomDatePicker(
      {Key? key,
      this.startTime,
      this.endTime,
      this.warnTips,
      required this.onCancel,
      required this.onConfirm,
      this.range})
      : super(key: key) {
    range ??= TimeRange(
      DateFormat('yyyy-MM-dd').format(
        DateTime.now().subtract(const Duration(days: 29)),
      ),
      DateFormat('yyyy-MM-dd').format(DateTime.now()),
    );
  }

  final Function onCancel;
  final Function onConfirm;

  String? startTime;
  String? endTime;
  String? warnTips;
  final now = DateTime.now();
  TimeRange? range;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onCancel();
      },
      child: Container(
        height: double.infinity,
        color: Colors.black.withOpacity(0.6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: const Color(0XFF151E25),
              padding: EdgeInsets.all(16.w),
              child: DateRangePicker(
                beginTxt: "bet_time_begin_label".tr,
                tillTxt: "bet_time_till_label".tr,
                initialStartDateTime: startTime != null
                    ? DateFormat("yyyy-MM-dd").parse(startTime!)
                    : DateFormat("yyyy-MM-dd").parse(range!.start),
                initialEndDateTime: endTime != null
                    ? DateFormat("yyyy-MM-dd").parse(endTime!)
                    : DateFormat("yyyy-MM-dd").parse(range!.end),
                minimumDate: now.subtract(const Duration(days: 29)),
                maximumDate: now,
                onChangeListener: (TimeRange timeRange) {
                  range = timeRange;
                },
              ),
            ),
            Container(
              color: const Color(0XFF151E25),
              padding: EdgeInsets.only(
                top: 8.w,
                left: 16.w,
                right: 16.w,
                bottom: 16.w,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                warnTips ?? 'bet_histories_records_of_the_last30_days'.tr,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            ),
            Container(
              height: 64.h,
              color: const Color(0XFF1E262E),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 159.w,
                    height: 40.h,
                    child: OBasePrimaryButton(
                      block: true,
                      size: ButtonSize.large,
                      image: DecorationImage(
                        image: AssetImage(Assets.images.btnbg3.path, package: BaseX.pkg),
                        fit: BoxFit.fill,
                      ),
                      child: Text(
                        'cancel'.tr,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            decoration: TextDecoration.none),
                      ),
                      onPressed: () {
                        onCancel();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 159.w,
                    height: 40.h,
                    child: DatePickerButton(
                      block: true,
                      size: ButtonSize.large,
                      child: Text(
                        'confirm'.tr,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            decoration: TextDecoration.none),
                      ),
                      onPressed: () {
                        onConfirm(range);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
