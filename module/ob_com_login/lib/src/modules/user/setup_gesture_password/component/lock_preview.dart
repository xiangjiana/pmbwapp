import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:ob_com_base/ob_com_base.dart';

class LockPreview extends StatelessWidget {
  const LockPreview({
    Key? key,
    required this.selectPoints,
  }) : super(key: key);

  final List<int> selectPoints;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 9,
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 250),
          width: 12.w,
          height: 12.w,
          decoration: ShapeDecoration(
            shape: CircleBorder(),
            color: selectPoints.contains(index)
                ? ColorName.colorMain
                : Colors.white.withOpacity(0.4),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12.w,
        crossAxisSpacing: 12.w,
      ),
    );
  }
}
