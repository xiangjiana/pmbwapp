import 'package:flutter/material.dart';

class SkeletonCreator extends StatelessWidget {
  final Future future;
  final Widget origin;
  final Widget skeleton;

  const SkeletonCreator({
    Key? key,
    required this.future,
    required this.origin,
    required this.skeleton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return SizedBox.shrink();
        }
        if (snapshot.hasData) {
          return origin;
        }
        return skeleton;
      },
    );
  }
}
