import 'package:flutter/widgets.dart';
import 'package:ob_component/ob_component.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

///
final Story animationStory = Story(
  section: 'General',
  name: 'Animation',
  builder: (BuildContext ctx, KnobsBuilder k) {
    final RefreshController _refreshController =
        RefreshController(initialRefresh: false);
    final List<int> dataSet = List<int>.generate(20, (int v) => v);
    return SmartRefresher(
      controller: _refreshController,
      enablePullUp: true,
      enablePullDown: true,
      header: const ObRefreshHeader(),
      footer: const ObRefreshFooter(),
      onRefresh: () async {
        await Future<void>.delayed(const Duration(seconds: 3), () {
          _refreshController.refreshCompleted();
        });
      },
      onLoading: () async {
        await Future<void>.delayed(const Duration(seconds: 3), () {
          _refreshController.loadNoData();
        });
      },
      child: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) => const Text('这是index'),
        itemCount: dataSet.length,
        itemExtent: 100.0,
      ),
    );
  },
);
