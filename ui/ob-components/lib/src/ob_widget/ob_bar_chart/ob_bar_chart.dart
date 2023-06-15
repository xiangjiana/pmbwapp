import 'dart:math';

import 'package:flutter/material.dart';

///是否显示文字
typedef TitleStringBuilder = String Function(double);

///是否显示横线
typedef CheckShowLine = bool Function(double);

///柱子点击事件
typedef OnBarTap = Function(int);

///
class ChartBarData {
  ///
  ChartBarData(this.value,
      {this.color = Colors.blue,
      double? marginRight,
      double? marginLeft,
      double? width})
      : width = width ?? 24,
        marginLeft = marginLeft ?? 12,
        marginRight = marginRight ?? 12;

  ///柱子颜色
  Color color;

  ///左边距
  double marginLeft;

  ///右边距
  double marginRight;

  ///柱子y轴值
  double value;

  ///柱子宽度
  double width;
}

///柱形图
class ObBarChart extends StatefulWidget {
  ///
  const ObBarChart(
      {required this.chartColumnDatas,
      required this.maxY,
      this.lineColor = Colors.grey,
      this.lineWidth = 1,
      this.checkShowLine,
      this.minY = 0,
      this.bottomTitleStringBuilder,
      this.leftTitleStringBuilder,
      this.leftTextStyle = const TextStyle(height: 1),
      this.labelText = "",
      this.labelTextStyle = const TextStyle(height: 1),
      this.onBarTap,
      double? leftTextWidth,
      double? bottomTextHeight,
      this.bottomTextStyle = const TextStyle(height: 1)})
      : leftTextWidth = leftTextWidth ?? 30,
        bottomTextHeight = bottomTextHeight ?? 30;

  ///柱子点击事件
  final OnBarTap? onBarTap;

  ///左上角标签内容
  final String labelText;

  ///标签字体样式
  final TextStyle labelTextStyle;

  ///根据y轴值判断是否显示横线
  final CheckShowLine? checkShowLine;

  ///横线宽度
  final double lineWidth;

  ///横线颜色
  final Color lineColor;

  /// y轴最大值
  final double maxY;

  ///y轴最小值
  final double minY;

  ///柱子数据
  final List<ChartBarData> chartColumnDatas;

  ///底部文字生成函数
  final TitleStringBuilder? bottomTitleStringBuilder;

  ///左侧文字生成函数
  final TitleStringBuilder? leftTitleStringBuilder;

  ///左侧文字样式
  final TextStyle? leftTextStyle;

  ///底部文字样式
  final TextStyle? bottomTextStyle;

  ///左边文字宽度
  final double leftTextWidth;

  ///底部文字高度
  final double bottomTextHeight;

  @override
  _ObBarChartState createState() => _ObBarChartState();
}

class _ObBarChartState extends State<ObBarChart> {
  GlobalKey globalKey = GlobalKey();

  double width = 0;
  double height = 0;

  @override
  void initState() {
    super.initState();
    _updateWidthAndHeight();
    barScrollController.addListener(() {
      if (barScrollController.offset != bottomTextScrollController.offset) {
        bottomTextScrollController.jumpTo(barScrollController.offset);
      }
    });
    bottomTextScrollController.addListener(() {
      if (barScrollController.offset != bottomTextScrollController.offset) {
        barScrollController.jumpTo(bottomTextScrollController.offset);
      }
    });
  }

  ScrollController barScrollController = ScrollController();
  ScrollController bottomTextScrollController = ScrollController();

  @override
  void didUpdateWidget(covariant ObBarChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateWidthAndHeight();
  }

  void _updateWidthAndHeight() {
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) {
      if (globalKey.currentContext != null) {
        final RenderObject? renderObject =
            globalKey.currentContext!.findRenderObject();
        RenderBox renderBox;
        if (renderObject != null) {
          renderBox = renderObject as RenderBox;
          if (width != renderBox.paintBounds.width) {
            width = renderBox.paintBounds.width;
            height = renderBox.paintBounds.height;
            setState(() {});
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: globalKey,
      width: double.infinity,
      height: double.infinity,
      child: width == 0
          ? Container()
          : Stack(
              children: <Widget>[
                if (widget.checkShowLine != null) getLineWidget(),
                if (widget.leftTitleStringBuilder != null) getLeftTextWidget(),
                if (widget.leftTitleStringBuilder != null)
                  getBottomTextWidget(),
                //左侧竖线
                Container(
                  margin: EdgeInsets.only(left: widget.leftTextWidth),
                  color: widget.lineColor,
                  width: widget.lineWidth,
                  height: height - widget.bottomTextHeight,
                ),
                //左上角箭头
                Container(
                  margin: EdgeInsets.only(
                      left: widget.leftTextWidth - 5 + widget.lineWidth / 2),
                  child: Transform.rotate(
                    angle: pi / 4,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          border: Border(
                        left: BorderSide(
                            // 设置单侧边框的样式
                            color: widget.lineColor,
                            width: widget.lineWidth,
                            style: BorderStyle.solid),
                        top: BorderSide(
                            // 设置单侧边框的样式
                            color: widget.lineColor,
                            width: widget.lineWidth,
                            style: BorderStyle.solid),
                      )),
                    ),
                  ),
                ),
                //底部横线
                Positioned(
                  left: widget.leftTextWidth,
                  bottom: widget.bottomTextHeight,
                  child: Container(
                    color: widget.lineColor,
                    width: width - widget.leftTextWidth,
                    height: widget.lineWidth,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: widget.leftTextWidth,
                      bottom: widget.bottomTextHeight),
                  child: ListView.builder(
                    controller: barScrollController,
                    itemCount: widget.chartColumnDatas.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      final ChartBarData data = widget.chartColumnDatas[index];
                      final double barHeight =
                          (height - widget.bottomTextHeight) *
                              (data.value / widget.maxY);
                      return GestureDetector(
                        onTap: () {
                          if (widget.onBarTap != null) {
                            widget.onBarTap!(index);
                          }
                        },
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          width: data.width,
                          height: barHeight,
                          color: data.color,
                          margin: EdgeInsets.only(
                              top: height - widget.bottomTextHeight - barHeight,
                              left: data.marginLeft,
                              right: data.marginRight),
                        ),
                      );
                    },
                  ),
                ),
                //右下角箭头
                Positioned(
                  right: 0,
                  bottom: widget.bottomTextHeight - 5 + widget.lineWidth / 2,
                  child: Transform.rotate(
                    angle: pi - pi / 4,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          border: Border(
                        left: BorderSide(
                            // 设置单侧边框的样式
                            color: widget.lineColor,
                            width: widget.lineWidth,
                            style: BorderStyle.solid),
                        top: BorderSide(
                            // 设置单侧边框的样式
                            color: widget.lineColor,
                            width: widget.lineWidth,
                            style: BorderStyle.solid),
                      )),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                        left: widget.leftTextWidth + 10, top: 5),
                    child: Text(
                      widget.labelText,
                      style: widget.labelTextStyle,
                    )),
              ],
            ),
    );
  }

  Widget getLineWidget() {
    final List<Widget> children = <Widget>[];
    for (int index = 0; index < widget.maxY; index++) {
      final String text = widget.leftTitleStringBuilder!(index * 1.0);
      if (text != "" || index == 0) {
        children.add(Positioned(
          bottom:
              index / widget.maxY.toInt() * (height - widget.bottomTextHeight),
          child: Container(
            color: widget.lineColor,
            height: widget.lineWidth,
            width: width - (widget.leftTextWidth + widget.lineWidth),
          ),
        ));
      } else {
        children.add(Container());
      }
    }

    return Container(
      width: width - (widget.leftTextWidth + widget.lineWidth),
      height: height - widget.bottomTextHeight,
      margin: EdgeInsets.only(left: widget.leftTextWidth + widget.lineWidth),
      child: Stack(
        children: children,
      ),
    );
  }

  Widget getBottomTextWidget() {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(
        top: height - widget.bottomTextHeight,
        left: widget.leftTextWidth,
      ),
      height: widget.bottomTextHeight,
      child: ListView.builder(
        controller: bottomTextScrollController,
        itemCount: widget.chartColumnDatas.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          if (widget.bottomTitleStringBuilder == null) {
            return Container();
          }
          final ChartBarData data = widget.chartColumnDatas[index];
          return Container(
            alignment: Alignment.center,
            height: widget.bottomTextHeight,
            width: data.width + min(data.marginLeft, data.marginRight) * 2,
            margin: EdgeInsets.only(
                left: data.marginLeft - min(data.marginLeft, data.marginRight)),
            child: Text(
              widget.bottomTitleStringBuilder!(index * 1.0),
              style: const TextStyle(height: 1),
            ),
          );
        },
      ),
    );
  }

  Widget getLeftTextWidget() {
    final List<Widget> children = <Widget>[];
    for (int index = 0; index < widget.maxY; index++) {
      final String text = widget.leftTitleStringBuilder!(index * 1.0);
      if (text != "") {
        children.add(Positioned(
          bottom:
              index / widget.maxY.toInt() * (height - widget.bottomTextHeight),
          child: Container(
            color: widget.lineColor,
            height: widget.lineWidth,
            width: width - (widget.leftTextWidth + widget.lineWidth),
          ),
        ));
      }
    }

    return Container(
      width: widget.leftTextWidth + widget.lineWidth,
      height: height - widget.bottomTextHeight,
      child: Stack(
        children: List<Widget>.generate(
            widget.leftTitleStringBuilder == null ? 0 : widget.maxY.toInt(),
            (int index) {
          final double bottom =
              index / widget.maxY.toInt() * (height - widget.bottomTextHeight);
          return Positioned(
            bottom: bottom == 0
                ? bottom
                : bottom - (widget.leftTextStyle!.fontSize ?? 0) / 2,
            child: Text(
              widget.leftTitleStringBuilder!(index * 1.0),
              style: widget.leftTextStyle,
            ),
          );
        }),
      ),
    );
  }
}
