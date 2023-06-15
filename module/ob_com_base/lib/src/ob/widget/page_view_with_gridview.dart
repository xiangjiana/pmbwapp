import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';
import 'package:get/get.dart';

import 'ob_image.dart';

typedef ValuesChanged<T, E> = void Function(T value, E valueTwo);

typedef PageViewWithGridViewItemBuilder = Widget Function(BuildContext, int, int);

typedef PVScrollToEndFunction = Function(bool);

class PageViewWithGridView extends StatefulWidget {
  final int itemCount;
  final PageViewWithGridViewItemBuilder gridviewItemBuilder;
  final List<int> gridviewItemCounts;
  final ValueChanged<int>? onPageChanged;
  final SliverGridDelegate sliverGridDelegate;
  final PageController pageController;
  final PVScrollToEndFunction? didScrollToCurrentPageEnd;

  const PageViewWithGridView({
    Key? key,
    required this.itemCount,
    required this.gridviewItemBuilder,
    required this.sliverGridDelegate,
    required this.gridviewItemCounts,
    required this.pageController,
    this.onPageChanged,
    this.didScrollToCurrentPageEnd,
  }) : super(key: key);

  @override
  _PageViewWithGridViewState createState() => _PageViewWithGridViewState();
}

class _PageViewWithGridViewState extends State<PageViewWithGridView> {
  late ScrollController activeScrollController;
  late Drag? drag;

  late bool atTheTop;
  late bool atTheBottom;

  @override
  void initState() {
    super.initState();
    atTheTop = true;
    atTheBottom = false;
  }

  @override
  void dispose() {
    widget.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: widget.onPageChanged,
      itemBuilder: (context, index) {
        return MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: Container(
            padding: EdgeInsets.only(top: 24.w),
            child: GridViewInPageView(
              handleDragStart: handleDragStart,
              handleDragUpdate: handleDragUpdate,
              handleDragEnd: handleDragEnd,
              pageStorageKeyValue: '$index',
              itemCount: widget.gridviewItemCounts[index],
              itemBuilder: (context, gridIndex) {
                return widget.gridviewItemBuilder(context, index, gridIndex);
              },
              sliverGridDelegate: widget.sliverGridDelegate,
              didScrollToCurrentPageEnd: (isEnd) {
                widget.didScrollToCurrentPageEnd!(isEnd);
              },
            ),
          ),
        );
      },
      itemCount: widget.itemCount,
      controller: widget.pageController,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  void handleDragStart(DragStartDetails details, ScrollController scrollController) {
    if (scrollController.hasClients) {
      if (scrollController.position.context.storageContext != null) {
        if (scrollController.position.pixels == scrollController.position.minScrollExtent &&
            scrollController.position.pixels == scrollController.position.maxScrollExtent) {
          atTheTop = true;
          atTheBottom = true;
          if (widget.didScrollToCurrentPageEnd != null) {
            widget.didScrollToCurrentPageEnd!(true);
          }
        } else if (scrollController.position.pixels == scrollController.position.minScrollExtent) {
          atTheTop = true;
        } else if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
          atTheBottom = true;
          if (widget.didScrollToCurrentPageEnd != null) {
            widget.didScrollToCurrentPageEnd!(true);
          }
        } else {
          atTheTop = false;
          atTheBottom = false;
          if (widget.didScrollToCurrentPageEnd != null) {
            widget.didScrollToCurrentPageEnd!(false);
          }

          activeScrollController = scrollController;
          drag = activeScrollController.position.drag(details, disposeDrag);
          return;
        }
      }
    }

    activeScrollController = widget.pageController;
    drag = widget.pageController.position.drag(details, disposeDrag);
  }

  void handleDragUpdate(DragUpdateDetails details, ScrollController scrollController) {
    if (details.delta.dy > 0 && atTheTop) {
      //Arrow direction is to the bottom.
      //Swiping up.
      activeScrollController = widget.pageController;
      drag?.cancel();
      drag = widget.pageController.position.drag(
          DragStartDetails(globalPosition: details.globalPosition, localPosition: details.localPosition), disposeDrag);
    } else if (details.delta.dy < 0 && atTheBottom) {
      //Arrow direction is to the top.
      //Swiping down.

      activeScrollController = widget.pageController;
      drag?.cancel();
      drag = widget.pageController.position.drag(
          DragStartDetails(
            globalPosition: details.globalPosition,
            localPosition: details.localPosition,
          ),
          disposeDrag);
    } else {
      if (atTheTop || atTheBottom) {
        activeScrollController = scrollController;
        drag?.cancel();
        drag = scrollController.position.drag(
            DragStartDetails(
              globalPosition: details.globalPosition,
              localPosition: details.localPosition,
            ),
            disposeDrag);
      }
    }
    drag?.update(details);
  }

  void handleDragEnd(DragEndDetails details) {
    drag?.end(details);

    if (atTheTop) {
      atTheTop = false;
    }
    if (atTheBottom) {
      atTheBottom = false;
      if (widget.didScrollToCurrentPageEnd != null) {
        widget.didScrollToCurrentPageEnd!(false);
      }
    }
  }

  void handleDragCancel() {
    drag?.cancel();
  }

  void disposeDrag() {
    drag = null;
  }
}

class GridViewInPageView extends StatefulWidget {
  final ValuesChanged<DragStartDetails, ScrollController> handleDragStart;
  final ValuesChanged<DragUpdateDetails, ScrollController> handleDragUpdate;
  final ValueChanged<DragEndDetails> handleDragEnd;
  final String pageStorageKeyValue;
  final SliverGridDelegate sliverGridDelegate;
  final IndexedWidgetBuilder itemBuilder;
  final EdgeInsets? padding;
  final int itemCount;
  final PVScrollToEndFunction? didScrollToCurrentPageEnd;

  const GridViewInPageView({
    Key? key,
    required this.handleDragStart,
    required this.handleDragUpdate,
    required this.handleDragEnd,
    required this.pageStorageKeyValue,
    required this.sliverGridDelegate,
    required this.itemBuilder,
    required this.itemCount,
    this.padding,
    this.didScrollToCurrentPageEnd,
  }) : super(key: key);

  @override
  _GridViewInPageViewState createState() => _GridViewInPageViewState();
}

class _GridViewInPageViewState extends State<GridViewInPageView> with AutomaticKeepAliveClientMixin {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 250)).then((value) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(0.0);
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollEndNotification) {
            widget.didScrollToCurrentPageEnd!(notification.metrics.extentAfter == 0);
          }
          return true;
        },
        child: GestureDetector(
          onVerticalDragStart: (details) {
            widget.handleDragStart(details, scrollController);
          },
          onVerticalDragUpdate: (details) {
            widget.handleDragUpdate(details, scrollController);
          },
          onVerticalDragEnd: widget.handleDragEnd,
          child: Stack(
            children: [
              GridView.builder(
                key: PageStorageKey<String>(widget.pageStorageKeyValue),
                physics: const NeverScrollableScrollPhysics(),
                controller: scrollController,
                itemCount: widget.itemCount,
                itemBuilder: widget.itemBuilder,
                gridDelegate: widget.sliverGridDelegate,
                shrinkWrap: false,
                padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
              ),
              if (widget.itemCount == 0) noGameWidget(),
            ],
          ),
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

Widget noGameWidget() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: pkObImage(Assets.images.queTongyongKong.path),
          // color: Colors.white.withOpacity(0.04),
          width: 234.w,
          height: 234.w,
        ),
        SizedBox(height: 12.w),
        Text(
          'nothing'.tr,
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}
