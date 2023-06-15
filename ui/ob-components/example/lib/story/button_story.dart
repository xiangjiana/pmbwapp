import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

///
final Story buttonStory = Story(
  section: 'General',
  name: 'Button',
  builder: (BuildContext ctx, KnobsBuilder k) {
    final CountDownController ctrl = CountDownController();
    return Column(
      children: <Widget>[
        PrimaryButton(
          child: const Text('登录'),
          disabled: k.boolean(label: 'disabled'),
          block: k.boolean(label: 'block'),
          size: k.options(
            label: 'size',
            initial: ButtonSize.middle,
            options: const <Option<ButtonSize>>[
              Option<ButtonSize>('middle', ButtonSize.middle),
              Option<ButtonSize>('large', ButtonSize.large),
              Option<ButtonSize>('small', ButtonSize.small),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SecondaryButton(
          child: const Text('登录'),
          disabled: k.boolean(label: 'disabled'),
          block: k.boolean(label: 'block'),
          size: k.options(
            label: 'size',
            initial: ButtonSize.middle,
            options: const <Option<ButtonSize>>[
              Option<ButtonSize>('middle', ButtonSize.middle),
              Option<ButtonSize>('large', ButtonSize.large),
              Option<ButtonSize>('small', ButtonSize.small),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children:  <Widget>[
            const Expanded(
              child: SecondaryButton(
                child: Text('取消'),
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: PrimaryButton(
                child: const Text('确定'),
                disabled: false,
                onPressed: (){
                  ToastManager.showText("message");
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CountDownButton(
            controller: ctrl, onTap: ctrl.startTimer, initialText: '倒计时按钮'),
        PrimaryButton(
          child: const Text('更新倒计时'),
          disabled: false,
          onPressed: (){
            ctrl.updateDuration(const Duration(seconds: 5));
            ctrl.startTimer();
          },
        ),
      ],
    );
  },
);
