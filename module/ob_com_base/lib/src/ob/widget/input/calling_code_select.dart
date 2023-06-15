import 'package:flutter/material.dart';
import 'package:ob_com_base/src/ob/widget/input/calling_code_tile.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:get/get.dart';

class CallingCodeSelect extends StatelessWidget {
  final List<UiCallingCode> uiCallingCode;
  final String? selectId;
  final ValueChanged<String>? onAreaCodeChoose;

  const CallingCodeSelect({
    Key? key,
    this.uiCallingCode = const [],
    this.selectId,
    this.onAreaCodeChoose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: double.infinity,
          height: 44.w,
          // padding: EdgeInsets.symmetric(horizontal: 16.w),
          color: Colors.white.withOpacity(0.04),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
                    child: Text(
                      'cancel'.tr,
                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'choose_calling_code_label'.tr,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
        uiCallingCode.length > 5
            ? ListView(
                children: uiCallingCode
                    .map((b) => GestureDetector(
                          onTap: () {
                            onAreaCodeChoose?.call(b.id);
                          },
                          child: CallingCodeTile(
                            uiCallingCode: b,
                            selected: selectId == b.id,
                          ),
                        ))
                    .toList(),
              )
            : Padding(
                padding: EdgeInsets.only(bottom: 48.w),
                child: Column(
                  children: uiCallingCode
                      .map((b) => GestureDetector(
                            onTap: () {
                              onAreaCodeChoose?.call(b.id);
                            },
                            child: CallingCodeTile(
                              uiCallingCode: b,
                              selected: selectId == b.id,
                            ),
                          ))
                      .toList(),
                ),
              ),
      ],
    );
  }
}

class UiCallingCode {
  final String id;
  final String code;
  final String name;
  final List<int> lenLimits;

  UiCallingCode(this.id, this.code, this.name, this.lenLimits);
}
