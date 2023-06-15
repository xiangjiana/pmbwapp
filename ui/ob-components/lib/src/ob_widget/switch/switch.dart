import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _kSwitchWidth = 40.0;
const double _kSwitchHeight = 22.0;
const double _kSwitchBorder = 1.5;

///
const Color _kSwitchBgColor = Color(0xc7e5fce3);
const Color _kSwitchBgColorOn = Color(0x33ffffff);

///
const Color _kSwitchBorderColor = Color(0x8b3bc117);
const Color _kSwitchBorderColorOn = Color(0);

///
const Color _kSwitchDotColor1 = Color(0xea155408);
const Color _kSwitchDotColor2 = Color(0xff38ae19);
const Color _kSwitchDotColorOn1 = Color(0xc7000000);
const Color _kSwitchDotColorOn2 = Color(0xFF000000);

///
const Duration _switchDuration = Duration(milliseconds: 200);

///
class ObSwitch extends StatelessWidget {
  ///
  const ObSwitch({
    this.value = false,
    this.onChanged,
  });

  ///
  final bool value;

  ///
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    bool stateChanged = value;
    const double width = _kSwitchWidth;
    const double height = _kSwitchHeight;
    const double circleHeight = height - _kSwitchBorder * 2;
    const double startPoint = _kSwitchBorder;
    const double endPoint = width - circleHeight - _kSwitchBorder;

    return GestureDetector(
      onTap: () {
        stateChanged = !stateChanged;
        onChanged?.call(stateChanged);
      },
      child: Stack(
        children: <Widget>[
          Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: stateChanged ? _kSwitchBgColorOn : _kSwitchBgColor,
                border: Border.all(
                  color: _kSwitchBorderColorOn,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(height),
              )),
          Positioned(
              top: height * 0.35,
              right: height * 0.3,
              child: Offstage(
                offstage: stateChanged,
                child: Container(
                  width: 1,
                  height: height * 0.3,
                  color: stateChanged ? _kSwitchBorderColorOn : _kSwitchBorderColor,
                ),
              )),
          AnimatedPositioned(
            width: circleHeight,
            height: circleHeight,
            top: _kSwitchBorder,
            left: !stateChanged ? endPoint : startPoint,
            duration: _switchDuration,
            child:
                LayoutBuilder(builder: (BuildContext ctx, BoxConstraints cons) {
              return Container(
                decoration: BoxDecoration(
                  gradient: stateChanged
                      ? const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                              _kSwitchDotColorOn1,
                              _kSwitchDotColorOn2,
                            ])
                      : const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                              _kSwitchDotColor1,
                              _kSwitchDotColor2,
                            ]),
                  shape: BoxShape.circle,
                ),
                width: cons.maxHeight,
                height: cons.maxHeight,
              );
            }),
          ),
        ],
      ),
    );
  }
}
