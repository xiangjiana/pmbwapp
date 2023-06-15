import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///可以上下左右滑动的表格
class AgentTable extends StatefulWidget {
  ///
  const AgentTable({
    required this.itemBuilder,
    required this.itemCount,
    required this.tableWidth,
    required this.leftTitles,
    this.refreshController,
    this.enablePullDown = false,
    this.enablePullUp = false,
    this.onRefresh,
    this.onLoading,
    this.titles,
  });

  ///顶部的表头
  final List<Widget>? titles;

  ///左边的表头
  final List<Widget> leftTitles;

  ///表格的宽度
  final double tableWidth;

  ///表格数据数量
  final int itemCount;

  ///是否能上拉加载
  final bool enablePullUp;

  ///是否能下拉刷新
  final bool enablePullDown;

  ///下拉刷新函数
  final void Function()? onRefresh;

  ///上拉加载函数
  final void Function()? onLoading;

  ///刷新控制器
  final RefreshController? refreshController;

  ///列表每一行生成函数
  final Widget Function(BuildContext context, int index) itemBuilder;

  @override
  _AgentTableState createState() => _AgentTableState();
}

class _AgentTableState extends State<AgentTable> {
  ScrollController titleScrollController = ScrollController();
  ScrollController bodyScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    titleScrollController.addListener(() {
      if (bodyScrollController.hasClients &&
          titleScrollController.offset != bodyScrollController.offset) {
        bodyScrollController.jumpTo(titleScrollController.offset);
      }
    });
    bodyScrollController.addListener(() {
      if (titleScrollController.hasClients &&
          titleScrollController.offset != bodyScrollController.offset) {
        titleScrollController.jumpTo(bodyScrollController.offset);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.tableWidth,
      child: Column(
        children: <Widget>[
          if (widget.titles != null)
            Row(
              children: <Widget>[
                widget.titles![0],
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: titleScrollController,
                    child: Row(
                      children: widget.titles!.sublist(1),
                    ),
                  ),
                ),
              ],
            ),
          Expanded(
            child: SmartRefresher(
              controller: widget.refreshController ?? RefreshController(),
              header: const ObRefreshHeader(),
              footer: const ObRefreshFooter(
                loadStyle: LoadStyle.ShowWhenLoading,
              ),
              onRefresh: widget.onRefresh,
              onLoading: widget.onLoading,
              enablePullUp: widget.enablePullUp,
              enablePullDown: widget.enablePullDown,
              child: SingleChildScrollView(
                child: Row(
                  children: <Widget>[
                    Column(
                      children: widget.leftTitles,
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      controller: bodyScrollController,
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: List<Widget>.generate(widget.itemCount,
                            (int index) {
                          return widget.itemBuilder(context, index);
                        }),
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
