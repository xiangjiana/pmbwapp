import 'package:flutter/widgets.dart';

///
class LoadingAnimation extends StatelessWidget {
  ///
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/loading/anigif.gif',
      fit: BoxFit.fitWidth,
      gaplessPlayback: true,
      width: 50,
      package: 'ob_component',
    );
  }
}
