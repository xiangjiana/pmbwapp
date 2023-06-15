import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

///
final Story textStory = Story(
  section: 'General',
  name: 'Text',
  builder: (BuildContext ctx, KnobsBuilder k) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CountDownText(
          onFinish: () {
            print("倒计时结束");
          },
          endDateTime: k.options(
              label: "结束时间",
              initial: DateTime.now().add(const Duration(seconds: 60)),
              options: <Option<DateTime>>[
                Option<DateTime>(
                    "1分钟",
                    DateTime.now().add(
                      const Duration(milliseconds: 60 * 1000),
                    )),
                Option<DateTime>(
                    "10分钟",
                    DateTime.now().add(
                      const Duration(milliseconds: 60 * 1000 * 10),
                    )),
                Option<DateTime>(
                    "20分钟",
                    DateTime.now().add(
                      const Duration(milliseconds: 60 * 1000 * 20),
                    )),
                Option<DateTime>(
                    "30分钟",
                    DateTime.now().add(
                      const Duration(minutes: 60 * 1000 * 30),
                    )),
              ]),
        ),
      ],
    );
  },
);
