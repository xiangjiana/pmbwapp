import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/component/custom_date_picker.dart';
import 'package:ob_com_finance/src/modules/records/ledger_record/component/ledger_list_tile.dart';
import 'package:ob_com_finance/src/modules/records/ledger_record/ledger_record_controller.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TabViewItemCustom extends StatefulWidget {
  TabViewItemCustom({
    Key? key,
    required this.parentController,
    required this.controller,
    this.warnTips = '',
  }) : super(key: key);
  final LedgerRecordController parentController;
  final CustomRecordController controller;
  String? warnTips;

  @override
  State<StatefulWidget> createState() => _TabViewItemCustomState();
}

class _TabViewItemCustomState extends State<TabViewItemCustom>
    with BackTopMixin {
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
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            if (widget.controller.data == null)
              widget.parentController.customTimeTabText == 'periods_custom'.tr
                  ? SizedBox.shrink()
                  : PlaceholderLoading(
                      margin: EdgeInsets.zero,
                    )
            else if (widget.controller.data!.record.isEmpty)
              Center(child: EmptyView())
            else
              ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => widget.controller.navigateDetail(index),
                    child: LedgerListTile((widget.controller.data!.record)[index]),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Divider(
                      indent: 68,
                    ),
                    color: Colors.white.withOpacity(0.04),
                  );
                },
                itemCount: widget.controller.data!.record.length,
              ),
            if (widget.parentController.isShowDatePicker.value)
              CustomDatePicker(
                onConfirm: (TimeRange range) {
                  widget.parentController.onDatePickerConfirm(range);
                },
                onCancel: () {
                  widget.parentController.onDatePickerCancel();
                },
                warnTips: widget.warnTips,
              )
          ],
        ),
      ),
    );
  }
}
