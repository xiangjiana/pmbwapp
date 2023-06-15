import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

///
final Story containerStory = Story(
  section: 'General',
  name: 'Container',
  builder: (BuildContext ctx, KnobsBuilder k) {
    return Column(
      children: <Widget>[
        GradientBackgroundContainer(
          width: k.options(
              label: "width",
              initial: null,
              options: <Option<double?>>[
                const Option<double?>("null", null),
                Option<double?>("100", 100.w),
                Option<double?>("200", 200.w),
              ]),
          height: k.options(
              label: "height",
              initial: null,
              options: <Option<double?>>[
                const Option<double?>("null", null),
                Option<double?>("100", 100.w),
                Option<double?>("200", 200.w),
              ]),
          begin: k.options(
              label: "begin",
              initial: Alignment.centerLeft,
              options: const <Option<Alignment>>[
                Option<Alignment>("centerLeft", Alignment.centerLeft),
                Option<Alignment>("bottomLeft", Alignment.bottomLeft),
                Option<Alignment>("bottomCenter", Alignment.bottomCenter),
                Option<Alignment>("bottomRight", Alignment.bottomRight),
                Option<Alignment>("centerRight", Alignment.centerRight),
                Option<Alignment>("topRight", Alignment.topRight),
                Option<Alignment>("topCenter", Alignment.topCenter),
                Option<Alignment>("topLeft", Alignment.topLeft),
              ]),
          end: k.options(
              label: "end",
              initial: Alignment.centerRight,
              options: const <Option<Alignment>>[
                Option<Alignment>("centerLeft", Alignment.centerLeft),
                Option<Alignment>("bottomLeft", Alignment.bottomLeft),
                Option<Alignment>("bottomCenter", Alignment.bottomCenter),
                Option<Alignment>("bottomRight", Alignment.bottomRight),
                Option<Alignment>("centerRight", Alignment.centerRight),
                Option<Alignment>("topRight", Alignment.topRight),
                Option<Alignment>("topCenter", Alignment.topCenter),
                Option<Alignment>("topLeft", Alignment.topLeft),
              ]),
          child: const Text("试试效果"),
          padding: k.options(
              label: "padding",
              initial: const EdgeInsets.all(10),
              options: <Option<EdgeInsets>>[
                Option<EdgeInsets>("10", EdgeInsets.all(10.w)),
                Option<EdgeInsets>("20", EdgeInsets.all(20.w)),
                Option<EdgeInsets>("30", EdgeInsets.all(30.w)),
                Option<EdgeInsets>("40", EdgeInsets.all(40.w)),
              ]),
        ),
      ],
    );
  },
);
