import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
// import 'package:get/get.dart';

///
final Story bottomSheetStory = Story(
  section: 'General',
  name: 'ObActionSheet',
  builder: (BuildContext ctx, KnobsBuilder k) {

    return Column(
      children: <Widget>[
        const SizedBox(height: 50),
        SecondaryButton(
          block: true,
          child: const Text('ObActionSheet弹框'),
          onPressed: () {
            showCupertinoModalPopup<void>(
              context: ctx,
              builder: (BuildContext context) => ObActionSheet(
                // showCancelButton: false,
                title: const BottomActionSheetTitle(),
                onCancelButtonListener: (){
                  print("--->cancel");
                  Navigator.of(context).pop();
                },
                actions: <Widget>[
                  BottomActionSheetAction(
                    // actionItemHeight:56,
                    child: const Text("拍照1"),
                    onPressed: (){
                      print("--->action1");
                      Navigator.of(context).pop();
                    },
                  ),
                  BottomActionSheetAction(
                    // actionItemHeight:56,
                    child: const Text("从相册选取2"),
                    onPressed: (){
                      print("--->action2");
                      Navigator.of(context).pop();
                    },
                  ),
                  BottomActionSheetAction(
                    // actionItemHeight:56,
                    child: const Text("action3"),
                    onPressed: (){
                      print("--->action3");
                      Navigator.of(context).pop();
                    },
                  ),
                  BottomActionSheetAction(
                    // actionItemHeight:56,
                    child: const Text("action4"),
                    onPressed: (){
                      print("--->action4");
                      Navigator.of(context).pop();
                    },
                  ),

                ],

              ),
            );
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  },
);
