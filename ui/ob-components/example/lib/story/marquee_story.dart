import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

///
final Story marqueeStory = Story(
  section: 'General',
  name: 'Marquee',
  builder: (BuildContext ctx, KnobsBuilder k) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 300,
          height: 20,
          child: ObMarquee(
            <ObMarqueeText>[
              ObMarqueeText("一一一一一一一一一一一一", leftPadding: 300, rightPadding: 30),
              ObMarqueeText("二二二二二二二二二二", rightPadding: 30),
              ObMarqueeText("三三三三三三三三三三三三三三", rightPadding: 30),
              ObMarqueeText(
                "四四四四四四四四四四",
                rightPadding: 300,
              ),
            ],
            duration: const Duration(seconds: 30),
            onIndexChange: (int index) {
              print("当前显示 $index");
            },
            onTextClick: (int index) {
              print("点击了 $index");
            },
          ),
        )
      ],
    );
  },
);
