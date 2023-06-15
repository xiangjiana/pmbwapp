import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';
import 'package:ob_package/modules/records/activity_record/repository/ui_invite_record.dart';

import 'activity_text.dart';

class InviteTile extends StatelessWidget {
  final UiInviteRecord uiInviteRecord;

  InviteTile({
    Key? key,
    required this.uiInviteRecord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Column(
        children: [
          ItemTileSimple(
            userName: uiInviteRecord.userName,
            statusTxt: uiInviteRecord.statusTxt,
            statusColor: uiInviteRecord.statusColor,
          ),
          Divider(color: Colors.white.withOpacity(0.06), height: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.w),
                  Row(
                    children: [
                      _txtStyle(
                        'activity_tile_register_label'.tr,
                        color: ColorName.colorTextWhite60,
                      ),
                      SizedBox(width: 24.w),
                      _txtStyle(
                        uiInviteRecord.registerTime,
                        color: ColorName.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 6.w),
                  Row(
                    children: [
                      _txtStyle(
                        'activity_tile_deposit_label'.tr,
                        color: ColorName.colorTextWhite60,
                      ),
                      SizedBox(width: 24.w),
                      _txtStyle(
                        '${(uiInviteRecord.firstDeposit)}',
                        color: ColorName.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 12.w),
                ],
              ),
              Spacer(),
              Visibility(
                visible: uiInviteRecord.status > 1,
                child: Text(
                  '${(uiInviteRecord.bonus)}',
                  style: TextStyle(
                    color: ColorName.white,
                    fontSize: 16,
                    fontFamily: "DIN-Medium",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
            ],
          ),
        ],
      ),
    );
  }

  Widget _txtStyle(String txt, {Color? color}) {
    return Text(
      txt,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: 12,
      ),
    );
  }
}
