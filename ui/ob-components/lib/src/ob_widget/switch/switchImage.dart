import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _kSwitchImageWidth = 40.0;
const double _kSwitchImageHeight = 40.0;

///
class ObSwitchImage extends StatelessWidget {
  ///
  const ObSwitchImage({
    required this.imageOn,
    required this.imageOff,
    this.value = false,
    this.onChanged,
  });

  ///
  final bool value;

  ///
  final ValueChanged<bool>? onChanged;

  ///
  final Widget imageOn;

  ///
  final Widget imageOff;

  @override
  Widget build(BuildContext context) {
    bool stateChanged = value;
    const double width = _kSwitchImageWidth;
    const double height = _kSwitchImageHeight;

    return GestureDetector(
      onTap: () {
        stateChanged = !stateChanged;
        onChanged?.call(stateChanged);
      },
      child: SizedBox(
        width: width,
        height: height,
        child: stateChanged ? imageOn : imageOff,
      ),
    );
  }
}
