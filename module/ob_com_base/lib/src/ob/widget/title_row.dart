import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ob_com_base/ob_com_base.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({
    Key? key,
    required this.label,
    this.value = "",
    this.childValue,
  }) : super(key: key);

  final String label;
  final String value;
  final Widget? childValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            textDirection: TextDirection.ltr,
            style: const TextStyle(fontSize: 12, color: Colors.white60),
          ),
        ),
        SizedBox(width: 6.w),
        Expanded(
          child: childValue ??
              Text(
                value,
                textAlign: TextAlign.right,
                textDirection: TextDirection.ltr,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
        ),
      ],
    );
  }
}
