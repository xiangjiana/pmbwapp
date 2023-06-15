import 'package:flutter/material.dart' hide PageController;

class Expansion extends StatelessWidget {
  final Widget header;
  final List<Widget> children;
  final bool isExpand;

  const Expansion({
    Key? key,
    required this.header,
    required this.children,
    required this.isExpand,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header,
        ClipRect(
          child: AnimatedAlign(
            alignment: Alignment.center,
            heightFactor: isExpand ? 1 : 0,
            duration: Duration(milliseconds: 200),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
          ),
        ),
      ],
    );
  }
}
