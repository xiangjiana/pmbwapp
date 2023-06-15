import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

///
final Story dialogStory = Story(
    section: 'General',
    name: 'Dialog',
    builder: (BuildContext ctx, KnobsBuilder k) {
      return Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: ctx,
                builder: (BuildContext ctx) => ObDialog.alert(
                  title: '提示',
                  content: '由于此平台的活动正在进行中，您若要转入金额，还需完成1518.54元的流水，您确定要继续转入吗？',
                  confirmText: '确定',
                  cancelText: '取消',
                  onConfirmListener: () => Navigator.of(ctx).pop(),
                  onCancelListener: () => Navigator.of(ctx).pop(),
                ),
              );
            },
            child: const Text('双按钮 alert'),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: ctx,
                builder: (BuildContext ctx) => ObDialog.alert(
                  title: '提示',
                  content: '由于此平台的活动正在进行中，您若要转入金额，还需完成1518.54元的流水，您确定要继续转入吗？',
                  confirmText: '我知道了',
                  onConfirmListener: () => Navigator.of(ctx).pop(),
                ),
              );
            },
            child: const Text('单按钮 alert'),
          ),

          SizedBox(
            height: 8.w,
          ),

          ElevatedButton(
            onPressed: () {
              showDialog(
                context: ctx,
                builder: (BuildContext ctx) => ObDialog.alertSlot(
                  title: '提示',
                  content: Padding(
                    padding: EdgeInsets.only(top: 16.w, bottom: 24.w),
                    child: const Text('由于此平台的活动正在进行中，'
                        '您若要转入金额，还需完成1518.54元的流水，您确定要继续转入吗？'),
                  ),
                  confirmText: '确定',
                  cancelText: '取消',
                  onConfirmListener: () => Navigator.of(ctx).pop(),
                  onCancelListener: () => Navigator.of(ctx).pop(),
                ),
              );
            },
            child: const Text('双按钮 alertSlot'),
          ),

          SizedBox(
            height: 8.w,
          ),

          ElevatedButton(
            onPressed: () {
              showDialog(
                context: ctx,
                builder: (BuildContext ctx) => ObDialog.alertSlot(
                  title: '提示',
                  content: Padding(
                    padding: EdgeInsets.only(top: 16.w, bottom: 24.w),
                    child: const Text('由于此平台的活动正在进行中，'
                        '您若要转入金额，还需完成1518.54元的流水，您确定要继续转入吗？'),
                  ),
                  confirmText: '我知道了',
                  onConfirmListener: () => Navigator.of(ctx).pop(),
                ),
              );
            },
            child: const Text('单按钮,alertSlot'),
          ),

        ],
      );
    });
