import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

///
final Story appbarStory = Story(
  section: 'General',
  name: 'AppBar',
  builder: (BuildContext ctx, KnobsBuilder k) {
    return AppBar(
      leading: const BackButton(),
      title: const Text('Appbar'),
    );
  },
);
