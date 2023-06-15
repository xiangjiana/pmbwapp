import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

///
final Story statisticStory = Story(
  section: 'Data Display',
  name: 'Statistic',
  builder: (BuildContext ctx, KnobsBuilder k) {
    return Column(
      children: const <Widget>[
        Statistic(
          title: Text(
            'Active',
            style: TextStyle(fontSize: 14, color: Colors.white54),
          ),
          value: '112893',
          valueStyle: TextStyle(fontSize: 24, color: Colors.white70),
        ),
        Statistic(
          title: Text(
            'Active',
            style: TextStyle(fontSize: 14, color: Colors.white54),
          ),
          value: '112893',
          precision: 2,
          valueStyle: TextStyle(fontSize: 24, color: Colors.white70),
        ),
        Statistic(
          title: Text(
            'Active',
            style: TextStyle(fontSize: 14, color: Colors.white54),
          ),
          value: '11.28',
          valueStyle: TextStyle(
            color: Color(0xff3f8600),
            fontSize: 24,
          ),
          prefix: Text(
            '+',
            style: TextStyle(
              color: Color(0xff3f8600),
              fontSize: 24,
            ),
          ),
        ),
      ],
    );
  },
);
