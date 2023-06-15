import 'package:flutter/material.dart' hide PageController;
import 'package:ob_com_finance/src/modules/records/access_record/access_record_controller.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/component/custom_date_picker.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:get/get.dart';
import 'package:ob_com_finance/src/modules/records/access_record/access_list_tile.dart';
import 'package:ob_com_finance/src/modules/records/access_record/repository/ui_access_record.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TabViewItem extends StatefulWidget {
  TabViewItem({
    Key? key,
    required this.parentController,
    required this.controller,
    required this.emptyWidget,
  }) : super(key: key);

  final AccessRecordController parentController;
  final controller;
  final Widget emptyWidget;

  @override
  State<StatefulWidget> createState() => _TabViewItemState();
}

class _TabViewItemState extends State<TabViewItem> with BackTopMixin {
  final RefreshController refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SmartRefresher(
        enablePullUp: true,
        enablePullDown: true,
        scrollController: scrollController,
        onRefresh: () {
          try {
            widget.controller.onRefresh();
            refreshController.refreshCompleted();
          } catch (_) {
            refreshController.refreshFailed();
          }
        },
        onLoading: () {
          try {
            widget.controller.onLoading();
            widget.controller.noMoreData
                ? refreshController.loadNoData()
                : refreshController.loadComplete();
          } catch (_) {
            refreshController.loadFailed();
          }
        },
        controller: refreshController,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            if (widget.controller.data == null)
              PlaceholderLoading(
                alignment: Alignment.topCenter,
              )
            else if (widget.controller.data!.record.isEmpty)
              widget.emptyWidget
            else
              CustomScrollView(
                shrinkWrap: true,
                physics: GetPlatform.isAndroid
                    ? ClampingScrollPhysics()
                    : BouncingScrollPhysics(),
                slivers: _buildAccessRecordList(),
              ),
            if (widget.parentController.isShowDatePicker.value)
              CustomDatePicker(
                onConfirm: (TimeRange range) {
                  widget.parentController.onDatePickerConfirm(range);
                },
                onCancel: () {
                  widget.parentController.onDatePickerCancel();
                },
                warnTips: 'bet_histories_records_of_the_last30_days'.tr,
              )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAccessRecordList() {
    final listTmp = widget.controller.data?.record ?? <UiAccessRecord>[];
    return [
      SliverPadding(
        padding: EdgeInsets.zero,
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final record = listTmp[index];
              bool hasDateHeader = true;
              if (listTmp.length > 1 && index > 0) {
                final prevRecord = listTmp[index - 1];
                hasDateHeader = record.daily != prevRecord.daily;
              }
              return Column(
                children: [
                  if (hasDateHeader)
                    Container(
                      width: 1.sw,
                      margin: EdgeInsets.only(
                        top: 8.w,
                        left: 16.w,
                        right: 16.w,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.04),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(8.w)),
                      ),
                      child: Text(
                        record.daily,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.6),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  if (hasDateHeader)
                    Divider(
                      indent: 16.w,
                      endIndent: 16.w,
                    ),
                  _buildAccessRecord(record),
                ],
              );
            },
            childCount: listTmp.length,
          ),
        ),
      )
    ];
  }

  Widget _buildAccessRecord(UiAccessRecord record) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: record.details.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: GestureDetector(
            onTap: () => Get.toNamed(
              AppRoutes.ACCESS_RECORD_DETAIL,
              arguments: record.details[index],
            ),
            child: AccessListTile(
              detail: record.details[index],
              roundBottom: index == (record.details.length - 1),
            ),
          ),
        );
      },
    );
  }
}
