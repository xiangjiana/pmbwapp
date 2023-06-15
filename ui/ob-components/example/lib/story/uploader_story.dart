import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

///
final Story uploaderStory = Story(
  section: 'Data Display',
  name: 'Uploader',
  builder: (BuildContext ctx, KnobsBuilder k) {
    return Uploader(
      maxCount: 2,
      customRequest: (String url, {required Function builder}) async {
        final Completer<String?> completer = Completer<String?>();
        double process = 0.0;
        final List<int> numList = <int>[1, 1, 4, 1, 1, 1];
        Future.forEach(numList, (int num) {
          return Future.delayed(Duration(seconds: num), () {
            process = process + 0.2;
            builder(process);
            if (process == 1.0) {
              completer.complete(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThVmyOrMX2q5HDdpWNcYVVX88ho-KzHO6jpxPhgAopDqy4DCOqPC18iqwor3fIBvq7Ce0&usqp=CAU');
            }
          });
        });

        return completer.future;
      },
      onChange: (List<String> list) {},
    );
  },
);
