import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class SubTitle extends StatelessWidget {
  final String title;

  const SubTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 2.w,
          height: 12.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(2.w)),
            color: Color(0xffE1A100),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: ColorName.white
            ),
          ),
        ),
      ],
    );
  }
}
