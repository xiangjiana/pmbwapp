import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

///
final Story agentTableStory = Story(
  section: 'General',
  name: 'AgentTable',
  builder: (BuildContext ctx, KnobsBuilder k) {
    final RefreshController refreshController = RefreshController();
    const int count = 20;
    return AgentTable(
      tableWidth: 500.w,
      refreshController: refreshController,
      enablePullUp: true,
      enablePullDown: true,
      leftTitles: List<Widget>.generate(count, (int index) {
        return Container(
          width: 100.w,
          height: 50.w,
          child: Center(child: Text("$index左边数据")),
        );
      }),
      titles: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.w),
              bottomLeft: Radius.circular(8.w),
            ),
          ),
          width: 100.w,
          height: 50.w,
          child: const Center(child: Text("表头1")),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
          ),
          width: 100.w,
          height: 50.w,
          child: const Center(child: Text("表头2")),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
          ),
          width: 100.w,
          height: 50.w,
          child: const Center(child: Text("表头3")),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
          ),
          width: 100.w,
          height: 50.w,
          child: const Center(child: Text("表头4")),
        ),
        Container(
          width: 100.w,
          height: 50.w,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8.w),
              bottomRight: Radius.circular(8.w),
            ),
          ),
          child: const Center(child: Text("表头5")),
        ),
      ],
      onRefresh: () {
        Future<void>.delayed(const Duration(seconds: 1), () {
          refreshController.refreshCompleted();
        });
      },
      onLoading: () {
        Future<void>.delayed(const Duration(seconds: 3), () {
          refreshController.loadComplete();
        });
      },
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: <Widget>[
            Container(
              width: 100.w,
              height: 50.w,
              child: Center(child: Text("$index数据1")),
            ),
            Container(
              width: 100.w,
              height: 50.w,
              child: Center(child: Text("$index数据2")),
            ),
            Container(
              width: 100.w,
              height: 50.w,
              child: Center(child: Text("$index数据3")),
            ),
            Container(
              width: 100.w,
              height: 50.w,
              child: Center(child: Text("$index数据4")),
            ),
          ],
        );
      },
      itemCount: count,
    );
  },
);
