import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:get/get.dart';

///
final Story radioStory = Story(
  section: 'General',
  name: 'Radio',
  builder: (BuildContext ctx, KnobsBuilder k) {
    final RxBool sel = false.obs;
    return Column(
      children: <Widget>[
        const SizedBox(height: 50),
        Container(
          width: 300,
          height: 300,
          // color: Colors.yellow,
          child: Obx((){
            return ObRadio(
              value: sel.value,
              onChange: (bool value) {
                print("onRadioChangeListener---->$sel");
                sel.value = value;
              },
            );
          }),
        )
      ],
    );
  },
);
