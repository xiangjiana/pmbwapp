import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

///
final Story themeStory = Story(
  name: 'Theme',
  section: 'General',
  builder: (BuildContext ctx, KnobsBuilder k) {
    return Builder(builder: (BuildContext ctx) {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                decoration: ShapeDecoration(
                  color: ObTheme.of(ctx).colorScheme.primaryColor,
                  shape: const CircleBorder(),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: ShapeDecoration(
                  color: ObTheme.of(ctx).colorScheme.secondaryColor,
                  shape: const CircleBorder(),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: ShapeDecoration(
                  color: ObTheme.of(ctx).colorScheme.windowBackgroundColor,
                  shape: const CircleBorder(),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                      colors:
                          ObTheme.of(ctx).colorScheme.primaryGradientColor),
                  shape: const CircleBorder(),
                ),
              ),
            ],
          ),
          Container(
            width: 50,
            height: 50,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                  colors: ObTheme.of(ctx).colorScheme.secondaryGradientColor),
              shape: const CircleBorder(),
            ),
          ),
        ],
      );
    });
  },
);
