import 'package:flutter/material.dart';

const Duration _kExpand = Duration(milliseconds: 200);

//可伸缩的布局
class ExpansionView extends StatefulWidget {
  final double defaultHeight;
  final Widget closeView;
  final Widget openView;
  final Widget contentView;

  ///点击回调
  final ValueChanged<bool>? onShrinkShowListener;

  //默认是否打开
  final bool defaultOpen;

  //  这里都是必传的
  // defaultHeight 默认展示的布局高度
  // defaultYesOpen 默认是否展开
  // closeView 传入关闭布局widget
  // openView 传入展开布局widget
  // contentView 填充的全部布局
  ExpansionView({
    required this.defaultHeight,
    required this.defaultOpen,
    required this.closeView,
    required this.openView,
    required this.contentView,
    this.onShrinkShowListener,
  });

  @override
  State<StatefulWidget> createState() {
    return _ExpansionViewState();
  }
}

class _ExpansionViewState extends State<ExpansionView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  //整个高度
  late double _allHeight;

  GlobalKey _textKey = GlobalKey();

  //是否显示控制view
  bool _yesShowControllerView = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      RenderBox renderBoxRed =
          _textKey.currentContext?.findRenderObject() as RenderBox;
      _allHeight = renderBoxRed.size.height;

      if (_allHeight > widget.defaultHeight) {
        //显示控制view
        _yesShowControllerView = true;
        _animation = Tween(begin: widget.defaultHeight, end: _allHeight)
            .animate(_controller)
              ..addListener(() {
                setState(() {});
              });
        //默认打开
        if (widget.defaultOpen) {
          if (_animation.value == widget.defaultHeight) {
            _controller.forward();
          }
        } else {
          setState(() {});
        }
      } else {
        _yesShowControllerView = false;
      }
    });
  }

  @override
  void dispose() {
    if (_controller != null) _controller.dispose();
    if (widget.onShrinkShowListener != null) {
      //收起
      widget.onShrinkShowListener!.call(false);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        _getContent(),
        _getControllerView(),
      ],
    ));
  }

  Widget _getContent() {
    return Container(
      height: _getHeight(),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          child: widget.contentView,
          key: _textKey,
        ),
      ),
    );
  }

  double? _getHeight() {
    //height为null时，是适应子view的高度
    if (_yesShowControllerView) {
      return _animation == null ? widget.defaultHeight : _animation.value;
    }
    return null;
  }

  Widget _getControllerView() {
    if (_yesShowControllerView) {
      if (_animation.value == widget.defaultHeight) {
        return InkWell(
          onTap: () {
            if (_animation.value == widget.defaultHeight) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
            if (widget.onShrinkShowListener != null) {
              //展开
              widget.onShrinkShowListener!.call(true);
            }
            setState(() {});
          },
          child: widget.openView,
        );
      }
      return InkWell(
        onTap: () {
          if (_animation.value == widget.defaultHeight) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
          if (widget.onShrinkShowListener != null) {
            //收起
            widget.onShrinkShowListener!.call(false);
          }
          setState(() {});
        },
        child: widget.closeView,
      );
    }
    return SizedBox();
  }
}
