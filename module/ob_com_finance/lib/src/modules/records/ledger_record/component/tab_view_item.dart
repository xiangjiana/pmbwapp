import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/records/ledger_record/component/ledger_list_tile.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TabViewItem extends StatefulWidget {
  const TabViewItem({Key? key, required this.controller}) : super(key: key);
  final controller;

  @override
  State<StatefulWidget> createState() => _TabViewItemState();
}

class _TabViewItemState extends State<TabViewItem> with BackTopMixin {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SmartRefresher(
        enablePullUp: true,
        enablePullDown: true,
        scrollController: scrollController,
        onRefresh: widget.controller.onRefresh,
        onLoading: widget.controller.onLoading,
        controller: widget.controller.smartRefreshCtrl,
        child: widget.controller.data == null
            ? const PlaceholderLoading(
                alignment: Alignment.topCenter,
              )
            : widget.controller.data.record!.isEmpty
                ? const EmptyView()
                : SingleChildScrollView(
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () => widget.controller.navigateDetail(index),
                          child: LedgerListTile(
                              (widget.controller.data.record!)[index]),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return  Container(
                          color: Colors.white.withOpacity(0.04),
                          child: const Divider(
                            indent: 68,
                          ),
                        );
                      },
                      itemCount: widget.controller.data.record!.length,
                    ),
                  ),
      ),
    );
  }
}
