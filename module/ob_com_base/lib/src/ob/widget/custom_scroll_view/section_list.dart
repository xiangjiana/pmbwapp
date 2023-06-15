import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ob_component/ob_component.dart'
    show ObRefreshHeader, ObRefreshFooter;
import 'custom_scroll_view_config.dart';

class SectionList extends StatefulWidget {
  ///每个section有几个item
  final List<int> itemCounts;
  final SectionHeaderBuilder sectionHeaderBuilder;
  final SectionListItemBuilder itemBuilder;
  final SectionListSeparatorBuilder separatorBuilder;
  final ValueChanged? onTopChanged;
  final ValueChanged? onEndChanged;
  final SectionListOffsetChanged? onOffsetChanged;
  final double initialScrollOffset;
  final bool needSafeArea;
  final enablePullUp;
  final Function? onRefresh;
  final Function? onLoading;
  final RefreshController refreshController;

  SectionList(
      {required this.itemCounts,
      required this.sectionHeaderBuilder,
      required this.itemBuilder,
      required this.separatorBuilder,
      required this.refreshController,
      this.onTopChanged,
      this.onEndChanged,
      this.enablePullUp = false,
      this.onOffsetChanged,
      this.initialScrollOffset = 0,
      this.needSafeArea = false,
      Key? key, this.onRefresh, this.onLoading})
      : assert(itemCounts != null, "itemCounts must not be null"),
        assert(sectionHeaderBuilder != null,
            "sectionHeaderBuilder must not be null"),
        assert(itemBuilder != null, "itemBuilder must not be null"),
        super(key: key);

  @override
  SectionListState createState() => SectionListState();
}

class SectionListState extends State<SectionList> {
  bool _top = true;
  bool _end = false;
  late ScrollController _controller;

  ///index ： sectionIndex
  ///index和sectionIndex的对应关系
  Map<int, int> _headerIndexMap = {};

  jumpTo(double offset) {
    _controller.jumpTo(offset);
  }

  animateTo(
    double offset, {
    required Duration duration,
    required Curve curve,
  }) {
    _controller.animateTo(offset, duration: duration, curve: curve);
  }

  @override
  void initState() {
    super.initState();
    _controller =
        ScrollController(initialScrollOffset: widget.initialScrollOffset);
    if (widget.initialScrollOffset > 0) {
      _top = false;
    }
    _controller.addListener(() {
      double offset = _controller.offset;
      if (widget.onTopChanged != null) {
        bool top = offset <= _controller.position.minScrollExtent;
        if (_top != top) {
          _top = top;
          widget.onTopChanged!(_top);
        }
      }
      if (widget.onEndChanged != null) {
        bool end = offset >= _controller.position.maxScrollExtent;
        if (_end != end) {
          _end = end;
          widget.onEndChanged!(_end);
        }
      }
      if (widget.onOffsetChanged != null) {
        widget.onOffsetChanged!(offset, _controller.position.maxScrollExtent);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    _headerIndexMap.clear();
    return SmartRefresher(
      header: ObRefreshHeader(),
      footer: ObRefreshFooter(),
      controller: widget.refreshController,
      enablePullUp: widget.enablePullUp,
      onRefresh: (){
        if(widget.onRefresh!=null){
          widget.onRefresh!();
        }
      },
      onLoading: (){
        if(widget.onLoading!=null){
          widget.onLoading!();
        }
      },
      child: CustomScrollView(
        controller: _controller,
        physics: AlwaysScrollableScrollPhysics(),
        slivers: _buildSlivers(),
      ),
    );
  }

  List<Widget> _buildSlivers() {
    if (widget.needSafeArea) {
      return [SliverSafeArea(sliver: _buildSliverList())];
    } else {
      return [_buildSliverList()];
    }
  }

  _buildSliverList() {
    return SliverList(
        delegate: SliverChildBuilderDelegate((ctx, index) {
      if (_isHeaderIndex(index)) {
        int section = _headerIndexMap[index]!;
        return widget.sectionHeaderBuilder(ctx, section);
      } else {
        int headerIndex = _headerIndex(index);
        int section = _headerIndexMap[headerIndex]!;
        int sectionIndex = index - headerIndex;
        if (_isItemIndex(sectionIndex)) {
//              print(index);
          int fixIndex = (sectionIndex - 1) ~/ 2;
          return widget.itemBuilder(ctx, SectionIndexPath(section, fixIndex));
        } else {
          int fixIndex = (sectionIndex - 1) ~/ 2;
          bool isLast = fixIndex == widget.itemCounts[section] - 1;
          return widget.separatorBuilder(
              ctx, SectionIndexPath(section, fixIndex), isLast);
        }
      }
    }, childCount: _itemCounts()));
  }

  _itemCounts() {
    int ret = 0;
    int sectionIndex = 0;
    _headerIndexMap[0] = sectionIndex;
    widget.itemCounts.forEach((element) {
      //一个item，一个separator
      ret += element * 2;
      //一个header
      ret++;
      sectionIndex++;
      _headerIndexMap[ret] = sectionIndex;
    });
    return ret;
  }

  bool _isHeaderIndex(int index) {
    return _headerIndexMap[index] != null;
  }

  bool _isItemIndex(int sectionIndex) {
    return sectionIndex % 2 != 0;
  }

  //header 的index
  int _headerIndex(int index) {
    int ret = 0;
    while (index > 0) {
      if (_headerIndexMap[index] != null) {
        ret = index;
        break;
      }
      index--;
    }
    return ret;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
