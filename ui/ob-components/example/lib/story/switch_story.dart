import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:get/get.dart';

///
final Story switchStory = Story(
  section: 'General',
  name: 'Switch',
  builder: (BuildContext ctx, KnobsBuilder k) {
    final RxBool sel = false.obs;
    return Column(
      children: <Widget>[
        const SizedBox(height: 50),
        Obx((){
          return ObSwitch(
            value: sel.value,
            onChanged: (bool value) {
              print("onSwitchChanged--->$value");
              sel.value = value;
            },
          );
        }),
        const SizedBox(height: 50),

      ],
    );
  },
);
