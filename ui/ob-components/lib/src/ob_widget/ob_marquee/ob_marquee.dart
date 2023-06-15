import 'package:flutter/material.dart';

///滚动到位置回调
typedef OnMarqueeIndexChange = Function(int);

///点击回调
typedef OnMarqueeTextClick = Function(int);

///
enum IndexChangePosition {
  ///
  left,

  ///
  center,

  ///
  right
}

///数据
class ObMarqueeText {
  ///
  ObMarqueeText(this.content,
      {this.leftPadding = 0,
      this.rightPadding = 0,
      this.textStyle = const TextStyle(height: 1)});

  ///文字内容
  String content;

  ///左边距
  double leftPadding;

  ///右边距
  double rightPadding;

  ///文字样式
  TextStyle textStyle;
}

///跑马灯
class ObMarquee extends StatefulWidget {
  ///[texts]内容
  ///[onIndexChange] 下标改变回调
  const ObMarquee(this.texts,
      {this.duration = const Duration(seconds: 10),
      this.onIndexChange,
      this.onTextClick,
      this.indexChangePosition = IndexChangePosition.center});

  ///从什么位置判断进入下一条了
  final IndexChangePosition indexChangePosition;

  ///文字内容
  final List<ObMarqueeText> texts;

  ///下标改变回调
  final OnMarqueeIndexChange? onIndexChange;

  ///点击文本的回调
  final OnMarqueeTextClick? onTextClick;

  ///时间
  final Duration duration;

  @override
  _ObMarqueeState createState() => _ObMarqueeState();
}

class _ObMarqueeState extends State<ObMarquee> {
  ScrollController scrollController = ScrollController();

  ///当前下标
  int currentIndex = 0;

  ///记录每一条左边的偏移量
  List<double> offsets = <double>[];

  ///控件宽度
  double width = 0;
  GlobalKey globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (currentIndex != offsets.length - 1) {
        //下一个滚动到一半的位置了
        double position = 0;
        switch (widget.indexChangePosition) {
          case IndexChangePosition.left:
            position = 0;
            break;
          case IndexChangePosition.center:
            position = width / 2;
            break;
          case IndexChangePosition.right:
            position = width;
            break;
        }
        if (scrollController.offset >= offsets[currentIndex + 1] - position) {
          currentIndex = currentIndex + 1;
          if (widget.onIndexChange != null) {
            widget.onIndexChange!(currentIndex);
          }
        }
      } else if (scrollController.offset == 0) {
        //回到开头重新滚动了
        currentIndex = 0;
        if (widget.onIndexChange != null) {
          widget.onIndexChange!(currentIndex);
        }
      }

      if (scrollController.offset >=
          scrollController.position.maxScrollExtent) {
        scrollController.jumpTo(0);
        Future<void>.delayed(Duration.zero, () {
          scrollController.animateTo(scrollController.position.maxScrollExtent,
              duration: widget.duration, curve: Curves.linear);
        });
      }
    });
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: widget.duration, curve: Curves.linear);
      final RenderBox renderBox =
          globalKey.currentContext!.findRenderObject()! as RenderBox;
      width = renderBox.paintBounds.width;
    });
  }

  ///生成Text控件
  List<Widget> initTexts() {
    final List<Widget> widgets = <Widget>[];
    offsets.clear();
    double widthSum = 0;
    for (int index = 0; index < widget.texts.length; index++) {
      final ObMarqueeText marqueeText = widget.texts[index];
      final double width = marqueeText.leftPadding +
          marqueeText.rightPadding +
          getTextWidth(marqueeText.content, marqueeText.textStyle).width;
      //保存每一条最左边的offset
      offsets.add(widthSum);
      widthSum += width;
      widgets.add(
        SliverToBoxAdapter(
          child: GestureDetector(
            onTap: () {
              if (widget.onTextClick != null) {
                widget.onTextClick!(index);
              }
            },
            child: Center(
              child: Container(
                width: width,
                padding: EdgeInsets.only(
                    left: marqueeText.leftPadding,
                    right: marqueeText.rightPadding),
                child: Text(
                  marqueeText.content,
                  style: marqueeText.textStyle,
                  maxLines: 1,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: globalKey,
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        slivers: initTexts(),
      ),
    );
  }

  //计算文本宽度
  Size getTextWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  @override
  void didUpdateWidget(covariant ObMarquee oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) {
      //重新设置宽度
      final RenderBox renderBox =
          globalKey.currentContext!.findRenderObject()! as RenderBox;
      width = renderBox.paintBounds.width;

      ///判断是否已经滚到最后了
      if (scrollController.offset >=
          scrollController.position.maxScrollExtent) {
        scrollController.jumpTo(0);
      }
      Future<void>.delayed(Duration.zero, () {
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: widget.duration *
                (1 -
                    scrollController.offset /
                        scrollController.position.maxScrollExtent),
            curve: Curves.linear);
      });
    });
  }
}
