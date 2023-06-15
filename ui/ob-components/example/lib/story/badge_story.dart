import 'package:flutter/material.dart' hide Badge;
import 'package:ob_component/ob_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

///
final Story badgeStory = Story(
  section: 'Data Display',
  name: 'Badge',
  builder: (BuildContext ctx, KnobsBuilder k) {
    return Badge(
      count: int.tryParse(k.text(label: 'count', initial: '1')),
      overflowCount:
          int.tryParse(k.text(label: 'overflowCount', initial: '99')) ?? 0,
      color: k.options(
        label: 'Color',
        initial: const Color(0xffFF5722),
        options: const <Option<Color>>[
          Option<Color>('Red', Color(0xffFF5722)),
          Option<Color>('Black', Colors.black),
          Option<Color>('Green', Colors.teal),
        ],
      ),
      dot: k.boolean(label: 'dot'),
      showZero: k.boolean(label: 'showZero'),
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  },
);
