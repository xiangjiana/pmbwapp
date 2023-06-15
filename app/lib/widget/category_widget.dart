import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart' hide Assets;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ob_com_base/ob_com_base.dart';

class CategoryPageView extends StatefulWidget {
  CollectionConfig? collectionConfig;

  OtherCategoryConfig otherCategoryConfig;
  Function(int index)? onPageChanged;
  bool canSwiper;

  CategoryPageView(
      {this.collectionConfig,
      required this.otherCategoryConfig,
      required this.pageController,
      this.canSwiper = true,
      this.onPageChanged});

  PageController pageController;

  @override
  _CategoryPageViewState createState() => _CategoryPageViewState();
}

class _CategoryPageViewState extends State<CategoryPageView> {
  ScrollController? activeScrollController;
  Drag? drag;

  bool atTheTop = true;
  bool atTheBottom = false;
  ScrollController categoryScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        onPageChanged: (index) {
          if (index == 1 && activeScrollController == widget.pageController) {
            activeScrollController = categoryScrollController;
          }
          widget.onPageChanged?.call(index);
        },
        scrollDirection: Axis.vertical,
        controller: widget.pageController,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) {
          if (widget.collectionConfig != null && index == 0) {
            return GridViewInPageView(
              sliverGridDelegate: widget.collectionConfig!.sliverGridDelegate,
              itemBuilder: widget.collectionConfig!.itemBuilder,
              itemCount: widget.collectionConfig!.itemCount,
              handleDragStart: handleDragStart,
              handleDragUpdate: handleDragUpdate,
              handleDragEnd: handleDragEnd,
              pageStorageKeyValue: "0",
              padding: widget.collectionConfig!.gridPadding,
              didScrollToCurrentPageEnd: (isEnd) {},
            );
          } else {
            return CategoryWidget(
              scrollController: categoryScrollController,
              handleDragStart: handleDragStart,
              handleDragUpdate: handleDragUpdate,
              handleDragEnd: handleDragEnd,
              onCategoryChange: widget.otherCategoryConfig.onCategoryChange,
              onScrollCategoryChange: widget.otherCategoryConfig.onScrollCategoryChange,
              titleBuilder: widget.otherCategoryConfig.titleBuilder,
              itemBuilder: widget.otherCategoryConfig.itemBuilder,
              categoryCount: widget.otherCategoryConfig.categoryCount,
              itemCounts: widget.otherCategoryConfig.itemCounts,
              minHeights: widget.otherCategoryConfig.minHeights,
              itemHeights: widget.otherCategoryConfig.itemHeights,
              titleHeights: widget.otherCategoryConfig.titleHeights,
              sliverGridDelegates: widget.otherCategoryConfig.sliverGridDelegates,
              categoryWidgetController: widget.otherCategoryConfig.categoryWidgetController,
              gridPaddings: widget.otherCategoryConfig.gridPaddings,
              initIndex: widget.otherCategoryConfig.initIndex,
              animateTo: widget.otherCategoryConfig.animateTo,
              defaultDelegate: widget.otherCategoryConfig.defaultDelegate,
            );
          }
        });
  }

  void handleDragStart(DragStartDetails details, ScrollController scrollController) {
    if (scrollController.hasClients) {
      if (scrollController.position.context.storageContext != null) {
        if (scrollController.position.pixels == scrollController.position.minScrollExtent &&
            scrollController.position.pixels == scrollController.position.maxScrollExtent) {
          atTheTop = true;
          atTheBottom = true;
        } else if (scrollController.position.pixels == scrollController.position.minScrollExtent) {
          atTheTop = true;
        } else if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
          atTheBottom = true;
        } else {
          atTheTop = false;
          atTheBottom = false;
          activeScrollController = scrollController;
          drag = activeScrollController?.position.drag(details, disposeDrag);
          return;
        }
      }
    }
    if (widget.canSwiper) {
      activeScrollController = widget.pageController;
    } else {
      activeScrollController = scrollController;
    }

    drag = activeScrollController?.position.drag(details, disposeDrag);
  }

  void handleDragUpdate(DragUpdateDetails details, ScrollController scrollController) {
    if (details.delta.dy > 0 && atTheTop && widget.canSwiper) {
      //Arrow direction is to the bottom.
      //Swiping up.
      activeScrollController = widget.pageController;
      drag?.cancel();
      drag = widget.pageController.position.drag(
          DragStartDetails(globalPosition: details.globalPosition, localPosition: details.localPosition), disposeDrag);
    } else if (details.delta.dy < 0 && atTheBottom && widget.canSwiper) {
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
        if (activeScrollController != scrollController) {
          if (atTheTop) {
            atTheTop = false;
          }
          if (atTheBottom) {
            atTheBottom = false;
          }
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
    }
    drag?.update(details);
  }

  void handleDragEnd(DragEndDetails details) {
    if (drag != null) {
      drag!.end(details);
    }

    if (atTheTop) {
      atTheTop = false;
    }
    if (atTheBottom) {
      atTheBottom = false;
    }
  }

  void handleDragCancel() {
    print("handleDragCancel ${activeScrollController?.debugLabel ?? activeScrollController.runtimeType.toString()}");
    drag?.cancel();
  }

  void disposeDrag() {
    drag = null;
  }
}

class CollectionConfig {
  int itemCount;
  EdgeInsets? gridPadding;

  SliverGridDelegateWithFixedCrossAxisCount sliverGridDelegate;
  Widget Function(BuildContext context, int itemIndex) itemBuilder;

  CollectionConfig({
    required this.itemCount,
    this.gridPadding,
    required this.sliverGridDelegate,
    required this.itemBuilder,
  });
}

class OtherCategoryConfig {
  ///标题构造方法
  Function(BuildContext context, int pageIndex) titleBuilder;

  ///gridview item构造方法
  Function(BuildContext context, int pageIndex, int itemIndex) itemBuilder;

  ///分类数量
  int categoryCount;

  int initIndex;

  ///各子分类item高度
  List<double> itemHeights;

  ///各分类 子项数量
  List<int> itemCounts;

  ///各分类子项最低高度
  List<double> minHeights;

  ///各标题高度
  List<double> titleHeights;

  ///切换分类时候的回调
  Function(int index)? onCategoryChange;

  ///滑动分类时候的回调
  Function(List<int> list)? onScrollCategoryChange;

  ///gridview padding
  List<EdgeInsets> gridPaddings;

  List<SliverGridDelegateWithFixedCrossAxisCount> sliverGridDelegates;

  SliverGridDelegateWithFixedCrossAxisCount defaultDelegate;

  bool animateTo;

  ///
  CategoryWidgetController categoryWidgetController;

  OtherCategoryConfig(
      {required this.titleBuilder,
      required this.itemBuilder,
      required this.categoryCount,
      required this.itemHeights,
      required this.itemCounts,
      required this.minHeights,
      required this.titleHeights,
      this.onCategoryChange,
      this.onScrollCategoryChange,
      required this.gridPaddings,
      this.initIndex = 0,
      required this.sliverGridDelegates,
      required this.categoryWidgetController,
      required this.defaultDelegate,
      this.animateTo = false});
}

class CategoryWidget extends StatefulWidget {
  ///标题构造方法
  Function(BuildContext context, int pageIndex) titleBuilder;

  ///gridview item构造方法
  Function(BuildContext context, int pageIndex, int itemIndex) itemBuilder;

  int initIndex;

  ///分类数量
  int categoryCount;

  ///各子分类item高度
  List<double> itemHeights;

  ///各分类 子项数量
  List<int> itemCounts;

  ///各分类子项最低高度
  List<double> minHeights;

  ///各标题高度
  List<double> titleHeights;

  ///切换分类时候的回调
  Function(int index)? onCategoryChange;

  ///滑动分类时候的回调
  Function(List<int> list)? onScrollCategoryChange;

  ///gridview padding
  List<EdgeInsets> gridPaddings;

  List<SliverGridDelegateWithFixedCrossAxisCount> sliverGridDelegates;

  SliverGridDelegateWithFixedCrossAxisCount defaultDelegate;

  bool animateTo;

  ScrollController scrollController;

  CategoryWidgetController categoryWidgetController;

  final ValuesChanged<DragStartDetails, ScrollController> handleDragStart;
  final ValuesChanged<DragUpdateDetails, ScrollController> handleDragUpdate;
  final ValueChanged<DragEndDetails> handleDragEnd;

  CategoryWidget({
    required this.scrollController,
    required this.titleBuilder,
    required this.itemBuilder,
    required this.categoryCount,
    required this.itemCounts,
    required this.minHeights,
    required this.itemHeights,
    required this.titleHeights,
    required this.sliverGridDelegates,
    required this.categoryWidgetController,
    required this.gridPaddings,
    required this.handleDragStart,
    required this.handleDragUpdate,
    required this.handleDragEnd,
    required this.initIndex,
    this.animateTo = false,
    this.onCategoryChange,
    this.onScrollCategoryChange,
    required this.defaultDelegate,
  });

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    widget.categoryWidgetController.categoryWidgetState = this;
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      RenderBox renderBox = globalKey.currentContext!.findRenderObject() as RenderBox;
      height = renderBox.paintBounds.height;
      if (widget.categoryWidgetController.initJump) {
        widget.categoryWidgetController.initJump = false;
        widget.initIndex = widget.categoryWidgetController.initIndex;
      }
      jumpTo(widget.initIndex);
    });
  }

  void jumpTo(int index) {
    if (widget.scrollController.hasClients && categoryAreas.isNotEmpty) {
      var offset = categoryAreas[index].begin;
      // print("=======================offset = $offset= index $index=======  categoryAreas[index].begin= ${categoryAreas[index].begin} ======");
      if (widget.animateTo) {
        widget.scrollController.animateTo(offset, duration: Duration(milliseconds: 100), curve: Curves.linear);
      } else {
        widget.scrollController.jumpTo(offset);
      }
    }
  }

  int getCurrentIndex() {
    return currentIndex;
  }

  double height = 0.0;
  int currentIndex = 0;
  GlobalKey globalKey = GlobalKey();

  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: PageStorageKey<String>("1"),
      child: NotificationListener(
        key: globalKey,
        onNotification: (Notification notification) {
          //监听滚动停止
          // print("scrollController.offset ${scrollController.offset}");

          double areaEnd = widget.scrollController.offset + 1.sh;
          List<int> needUpdateList = [];
          for (int i = 0; i < categoryAreas.length; i++) {
            CategoryArea itemArea = categoryAreas[i];
            if (widget.scrollController.offset >= itemArea.begin && widget.scrollController.offset < itemArea.end) {
              //如果下一分类显示超出屏幕高度的15% 跳转到下一分类
              //[ItemArea{begin: 0.0, end: 603.2290909090909}, ItemArea{begin: 603.2290909090909, end: 1248.349090909091}, ItemArea{begin: 1248.349090909091, end: 2286.879234449761}, ItemArea{begin: 2286.879234449761, end: 3829.634449760766}, ItemArea{begin: 3829.6344497607665, end: 6212.764784688996}, ItemArea{begin: 6212.764784688996, end: 7419.369952153111}, ItemArea{begin: 7419.369952153111, end: 8794.050143540671}, ItemArea{begin: 8794.050143540671, end: 10504.880382775122}, ItemArea{begin: 10504.880382775124, end: 11150.000382775124}, ItemArea{begin: 11150.000382775122, end: 14205.430813397132}]
              // print("===========scrollController.offset= ${scrollController.offset}============ ${height - (itemArea.end - scrollController.offset)} ${0.15.sh}");
              if (height - (itemArea.end - widget.scrollController.offset) >
                  height - widget.itemHeights[i] - 116.w + 48.w) {
                if (currentIndex != i + 1) {
                  currentIndex = i + 1;
                  if (widget.onCategoryChange != null) {
                    widget.onCategoryChange!(currentIndex);
                  }
                }
              } else {
                if (currentIndex != i) {
                  currentIndex = i;
                  if (widget.onCategoryChange != null) {
                    widget.onCategoryChange!(currentIndex);
                  }
                }
              }

              needUpdateList.add(i);
              int j = i;
              bool run = true;
              while (run) {
                j++;
                if (j < categoryAreas.length) {
                  run = categoryAreas[j].end < areaEnd;
                  needUpdateList.add(j);
                } else {
                  run = false;
                }
              }
              break;
            }
          }

          ///监听滚动停止
          if (notification is ScrollEndNotification) {
            widget.onScrollCategoryChange?.call(needUpdateList);
          }
          return true;
        },
        child: Theme(
          data: Theme.of(context).copyWith(platform: TargetPlatform.iOS),
          child: GestureDetector(
            onVerticalDragStart: (details) {
              widget.handleDragStart(details, widget.scrollController);
            },
            onVerticalDragUpdate: (details) {
              widget.handleDragUpdate(details, widget.scrollController);
            },
            onVerticalDragEnd: widget.handleDragEnd,
            child: CustomScrollView(
              key: PageStorageKey<String>("1"),
              physics: const NeverScrollableScrollPhysics(),
              controller: widget.scrollController,
              slivers: getSlivers(context),
            ),
          ),
        ),
      ),
    );
  }

  ///每一个分类的范围
  late List<CategoryArea> categoryAreas;

  List<Widget> getSlivers(BuildContext context) {
    List<Widget> slivers = [];
    categoryAreas = [];
    for (int categoryIndex = 0; categoryIndex < widget.categoryCount; categoryIndex++) {
      ///gridview的行数
      int gridRowNum =
          (widget.itemCounts[categoryIndex] / widget.sliverGridDelegates[categoryIndex].crossAxisCount).ceil();
      double paddingHeight = 0;
      if (widget.gridPaddings.isNotEmpty) {
        paddingHeight = widget.gridPaddings[categoryIndex].top + widget.gridPaddings[categoryIndex].bottom;
      }
      double gridHeight = widget.itemHeights[categoryIndex] * gridRowNum +
          (gridRowNum - 1) * widget.sliverGridDelegates[categoryIndex].mainAxisSpacing +
          paddingHeight;
      // print("gridRowNum $gridRowNum  titleHeight ${widget.titleHeights[categoryIndex]} girdHeight ${gridHeight}");
      var minHeight = widget.minHeights[categoryIndex];
      if (gridHeight < minHeight) {
        if (height > 0) minHeight = height - widget.titleHeights[categoryIndex];
        gridHeight = minHeight;
      }

      if (widget.itemCounts[categoryIndex] == 0 && widget.minHeights[categoryIndex] == 0) {
        gridHeight = 234.w + paddingHeight;
      }

      double currentHeight = 0;

      categoryAreas.forEach((element) {
        currentHeight = currentHeight + element.end - element.begin;
      });

      categoryAreas.add(
          CategoryArea(begin: currentHeight, end: currentHeight + widget.titleHeights[categoryIndex] + gridHeight));

      slivers.add(SliverToBoxAdapter(
        child: widget.titleBuilder(context, categoryIndex),
      ));

      slivers.add(SliverToBoxAdapter(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: widget.itemCounts[categoryIndex] == 0 ? gridHeight : minHeight,
          ),
          child: widget.itemCounts[categoryIndex] == 0
              ? noGameWidget()
              : GridView.builder(
                  padding: widget.gridPaddings[categoryIndex],
                  shrinkWrap: true,
                  gridDelegate: widget.sliverGridDelegates.safeGet(categoryIndex) ?? widget.defaultDelegate,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, itemIndex) {
                    if (categoryIndex == 0 && itemIndex == 0) {
                      return Container(
                        child: widget.itemBuilder(context, categoryIndex, itemIndex),
                      );
                    }
                    return widget.itemBuilder(context, categoryIndex, itemIndex);
                  },
                  itemCount: widget.itemCounts[categoryIndex],
                ),
        ),
      ));
    }
    // print(categoryAreas);
    return slivers;
  }

  @override
  bool get wantKeepAlive => true;
}

class CategoryArea {
  double begin;
  double end;

  CategoryArea({required this.begin, required this.end});

  @override
  String toString() {
    return 'ItemArea{begin: $begin, end: $end}';
  }
}

class CategoryWidgetController {
  bool initJump = false;
  int initIndex = 0;

  _CategoryWidgetState? _categoryWidgetState;

  set categoryWidgetState(_CategoryWidgetState value) {
    _categoryWidgetState = value;
  }

  void jumpTo(int index) {
    if (_categoryWidgetState != null) {
      _categoryWidgetState!.jumpTo(index);
    } else {
      if (initJump == false) {
        initJump = true;
        initIndex = index;
      }
    }
  }

  int getCurrentIndex() {
    if (_categoryWidgetState != null) {
      return _categoryWidgetState!.getCurrentIndex();
    }
    return 0;
  }
}

Widget noGameWidget() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        alignment: Alignment.center,
        child: ObImage.asset(Assets.images.queTongyongKong.path),
        // color: Colors.white.withOpacity(0.04),
        width: 234.w,
        height: 234.w,
      ),
      SizedBox(height: 12.w),
      Text(
        'bet_histories_nothing_look_elsewhere'.tr,
        style: TextStyle(
          color: Colors.white.withOpacity(0.6),
          fontSize: 14,
        ),
      ),
    ],
  );
}

extension ListUtil<T> on List<T> {
  T? safeGet(int index) {
    if (index >= 0 && index < length) {
      return this[index];
    }
    return null;
  }
}
