import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

///
final Story toastStory = Story(
    section: 'Overlay',
    name: 'Toast',
    builder: (BuildContext ctx, KnobsBuilder k) {
      return Column(
        children: <Widget>[
          SecondaryButton(
            block: true,
            child: const Text('toast loading'),
            onPressed: () {
                final CancelFunc cancel =
              ToastManager.showLoading(status: '加载中');
                  Future<void>.delayed(const Duration(seconds: 3),cancel);
             },
          ),
          const SizedBox(
            height: 8,
          ),
          SecondaryButton(
            block: true,
            child: const Text('toast loading'),
            onPressed: () {
              final CancelFunc cancel =
              ToastManager.showGataLoading(const Text('data'));
              Future<void>.delayed(const Duration(seconds: 3),cancel);
            },
          ),
          const SizedBox(
            height: 8,
          ),
          SecondaryButton(
            block: true,
            child: const Text('toast'),
            onPressed: () {
              ToastManager.showText('武汉');
            },
          ),
          const SizedBox(
            height: 8,
          ),
          SecondaryButton(
            block: true,
            child: const Text('成功'),
            onPressed: () {
              ToastManager.showSuccess(message :'成功');
            },
          ),
          const SizedBox(
            height: 8,
          ),
          SecondaryButton(
            block: true,
            child: const Text('失败'),
            onPressed: () {
              ToastManager.showError(message :'失败');
            },
          ),
        ],
      );
    });
