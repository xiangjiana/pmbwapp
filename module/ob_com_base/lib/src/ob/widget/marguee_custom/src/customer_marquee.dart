
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'marquee_item.dart';
import 'marquee_view.dart';

class CustomerMarquee extends StatefulWidget {

  final List<MarqueeItem> itemList;
  final int interval;
  final OnIndexChanged? onIndexChanged;

  CustomerMarquee({
    Key? key,
    required this.itemList,
    this.interval = 5,
    this.onIndexChanged,
  }) : super(key: key);

  @override
  _CustomerMarqueeState createState() => _CustomerMarqueeState();
}

class _CustomerMarqueeState extends State<CustomerMarquee> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints) {
      final width = constraints.biggest.width;
      return SizedBox(
        height: 40,
        child: MarqueeView(
            child: Row(
              children: _buildChildrenWidgets(containWidth: width),
            ),
          onIndexChanged: (int index) {
            if (widget.onIndexChanged != null) {
              widget.onIndexChanged!(index);
            }
          },
        ),
      );
    });
  }

  List<Widget> _buildChildrenWidgets({required double containWidth}) {
    List<Widget> list = [];
    for (var element in widget.itemList) {
      String targetString = element.text;
      targetString = targetString.replaceAll("\n", " ");
      if (targetString.length > 2000) {
        targetString = targetString.substring(0, 2000) + "...";
      }
      Widget childWidget = Row(
        children: [
          Visibility(visible: element.icon != null, child: element.icon ?? Container()),
          Container(
            margin: EdgeInsets.only(left: element.icon != null ? 12 : 0),
            child: Text(
              targetString,
              maxLines: 1,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      );
      list.add(childWidget);
      Widget spaceWidget = SizedBox(width: 25 * widget.interval.toDouble() + containWidth, height: 1,);
      list.add(spaceWidget);
    }
    return list;
  }
}
