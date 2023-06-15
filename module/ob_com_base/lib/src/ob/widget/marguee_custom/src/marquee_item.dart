
import 'package:flutter/cupertino.dart';

class MarqueeItem {
  final String text;
  Widget? icon;

  MarqueeItem({
    Key? key,
    required this.text,
    this.icon
  });
}