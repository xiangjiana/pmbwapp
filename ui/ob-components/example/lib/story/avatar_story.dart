import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:ob_component/ob_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

///
final Story avatarStory = Story(
  section: 'Data Display',
  name: 'Avatar',
  builder: (BuildContext ctx, KnobsBuilder k) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Avatar(
          child: const Text(
            'U',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          backgroundImage: const AssetImage('images/avatar.jpeg'),
          backgroundColor: Colors.transparent,
          backgroundImageColorFilter: const Color(0xff000000).withOpacity(0.6),
          radius: 34,
        ),
        const Badge(
          count: 4,
          child: Avatar(
            shape: BoxShape.rectangle,
            child: Text(
              'User',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            radius: 34,
            backgroundColor: Color(0xffcccccc),
          ),
        ),
        const Avatar(
          child: Text(
            'U',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xfff56a00),
            ),
          ),
          radius: 34,
          backgroundColor: Color(0xfffde3cf),
        )
      ],
    );
  },
);
