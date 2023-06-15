import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

///
final Story backTopStory = Story(
  section: 'Data Display',
  name: 'BackTop',
  builder: (BuildContext ctx, KnobsBuilder k) {
    final ScrollController ctrl = ScrollController();
    return BackTop(
      child: ListView.builder(
        controller: ctrl,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text('$index'),
        ),
      ),
    );
  },
);
