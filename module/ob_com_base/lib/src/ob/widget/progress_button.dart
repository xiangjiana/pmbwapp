import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' as ob_component;

///
typedef ProgressWidgetBuilder = Widget Function(
    BuildContext context, double progress);

///
class OBaseProgressButton extends StatelessWidget {
  ///
  const OBaseProgressButton({
    required this.progress,
    required this.builder,
    Key? key,
  }) : super(key: key);

  /// 进度
  final double progress;

  ///
  final ProgressWidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
            child: OBasePrimaryButton(
          block: true,
          image: DecorationImage(
            image: AssetImage(Assets.images.btnbg.path, package: BaseX.pkg),
            fit: BoxFit.fill,
          ),
          size: ob_component.ButtonSize.large,
          child: builder(context, progress),
        )),
        Container(
          child: LinearProgressIndicator(
            value: progress >= 1 ? 0 : progress,
            minHeight: 40,
            backgroundColor: Colors.transparent,
            valueColor: const AlwaysStoppedAnimation(Colors.white38),
          ),
        ),
      ],
    );
  }
}
