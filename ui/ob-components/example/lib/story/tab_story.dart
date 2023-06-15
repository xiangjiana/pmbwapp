import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

///
final Story tabStory = Story(
  section: 'General',
  name: 'TabBar',
  builder: (BuildContext ctx, KnobsBuilder k) {
    return Column(
      children: <Widget>[
        DefaultTabController(
          length: 3,
          child: PreferredSize(
            preferredSize: Size.fromHeight(44),
            child: ObTabBar(
              labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              unselectedLabelStyle:
              TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              tabs: <Widget>[
                SizedBox(
                  height: 44.w,
                  child: const Center(child: Text('今日')),
                ),
                SizedBox(
                  height: 44.w,
                  child: const Center(child: Text('昨日')),
                ),
                SizedBox(
                  height: 44.w,
                  child: const Center(child: Text('近七日')),
                ),
              ],
            ),
          ),
        )
      ],
    );
  },
);
