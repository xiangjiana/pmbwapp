import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class TabBarViewItem extends StatefulWidget {
  const TabBarViewItem({
    Key? key,
    required this.columns,
    required this.width,
    required this.height,
    required this.wrapTitle,
    this.firstHeight = 48,
    this.firstWidth = 80,
    this.tabIndex = 0,
  }) : super(key: key);

  final List<List> columns;
  final double width;
  final double height;
  final double firstWidth;
  final double firstHeight;
  final bool wrapTitle;
  final int tabIndex;

  @override
  _TabBarViewItemState createState() => _TabBarViewItemState();
}

class _TabBarViewItemState extends State<TabBarViewItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white.withOpacity(0.06)),
            borderRadius: BorderRadius.circular(8.w),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 10.w,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7.w),
            child: Container(
                child: Row(
              children: [
                _buildColumnItem(widget.columns[0], true),
                Expanded(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: widget.columns
                            .sublist(1)
                            .map<Widget>((e) => _buildColumnItem(
                                  e,
                                  false,
                                ))
                            .toList(),
                      )),
                )
              ],
            )),
          ),
        )
      ],
    );
  }

  Widget _buildColumnItem(List data, bool firstColumn) {
    Color textColor = firstColumn ? Color(0xFFE1A100) : Colors.white;
    Color oddColor = firstColumn ? Color(0xFF35362B) : Color(0xFF222B31);
    Color evenColor = firstColumn ? Color(0xFF292A22) : Color(0xFF151E25);
    double rowHeight(row) {
      if (row == 0) {
        return this.widget.firstHeight;
      }
      return this.widget.height;
    }

    double columnWidth(bool firstColumn) {
      if (firstColumn) {
        return this.widget.firstWidth;
      }
      return this.widget.width;
    }

    return Column(
      children: List.generate(
        data.length,
        (index) {
          bool isOdd = ((index + 1) % 2) != 0;
          Color newOddColor = oddColor;
          newOddColor = index > 0 ? oddColor.withOpacity(0.85) : oddColor;

          return Container(
            decoration: BoxDecoration(
              color: isOdd ? newOddColor : evenColor,
            ),
            width: columnWidth(firstColumn),
            height: rowHeight(index),
            alignment: Alignment.center,
            child: _buildText(data, index, textColor, firstColumn),
          );
        },
      ),
    );
  }

  Widget _buildText(List data, index, textColor, bool firstColumn) {
    var text = data[index];
    String fontFamily(row, bool firstColumn) {
      if (firstColumn) {
        return 'PingFangSC-Medium';
      }
      if (row == 0) {
        return 'PingFangSC-Regular';
      }
      return FontFamily.dINMedium;
    }

    FontWeight fontWeight(row, bool firstColumn) {
      if (firstColumn) {
        return FontWeight.w500;
      }
      if (row == 0) {
        return FontWeight.w400;
      }
      return FontWeight.w500;
    }

    Color fontColor(row, bool firstColumn) {
      if (firstColumn) {
        return textColor.withOpacity(0.6);
      }
      if (row == 0) {
        return textColor.withOpacity(0.6);
      }
      return textColor;
    }

    TextStyle textStyle = TextStyle(
      fontSize: 13,
      fontWeight: fontWeight(index, firstColumn),
      fontFamily: fontFamily(index, firstColumn),
      color: fontColor(index, firstColumn),
    );

    if (text.runtimeType.toString() == 'String' && widget.wrapTitle) {
      RegExp exp = new RegExp(r"([\u4e00-\u9fa5])");
      if (!exp.hasMatch(text) || (widget.tabIndex == 1 && index != 0)) {
        return Text(
          '$text',
          style: textStyle,
        );
      }
      if (text.length > 4) {
        if (text.length == 5) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${text.substring(0, 2)}', style: textStyle),
              Text('${text.substring(2)}', style: textStyle),
            ],
          );
        } else if (text.length == 6 || text.length == 7) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${text.substring(0, 3)}', style: textStyle),
              Text('${text.substring(3)}', style: textStyle),
            ],
          );
        } else if (text.length == 8 || text.length == 9) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${text.substring(0, 4)}', style: textStyle),
              Text('${text.substring(4)}', style: textStyle),
            ],
          );
        } else {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${text.substring(0, 5)}', style: textStyle),
              Text('${text.substring(5)}', style: textStyle),
            ],
          );
        }
      }
      return Text(
        '$text',
        style: textStyle,
      );
    }
    return Text(
      '$text',
      style: textStyle,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
