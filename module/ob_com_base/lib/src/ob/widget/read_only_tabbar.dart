import 'package:flutter/material.dart';

class ReadOnlyTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabBar child;
  final bool readOnly;

  const ReadOnlyTabBar({Key? key, required this.child, this.readOnly = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: child,
      ignoring: readOnly,
    );
  }

  @override
  Size get preferredSize => this.child.preferredSize;
}
