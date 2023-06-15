import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_login/ob_com_login.dart';
import 'package:ob_com_login/src/modules/user/user_toggle/repository/ui_toggle_item_user.dart';

import 'package:ob_component/ob_component.dart' hide ObTheme;


import 'user_toggle_state.dart';

class UserToggleTile extends StatelessWidget {
  final UIToggleItemUser userTile;
  final bool isUnfoldOrFold;
  final bool isChangeEditor;
  final GestureTapCallback? onToggleTap;

  UserToggleTile({
    Key? key,
    required this.userTile,
    this.isUnfoldOrFold = false,
    this.isChangeEditor = false,
    this.onToggleTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.w,
      width: double.infinity,
      child: ActionTypeListener(
        child: Row(
          children: [
            Offstage(
              offstage: !isChangeEditor,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Slidable.of(context)!.openEndActionPane();
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: pkObImage(
                    Assets.images.icon.comEditOrange.path,
                    width: 24.w,
                    height: 24.w,
                  ),
                ),
              ),
            ),
            Expanded(
              child: _buildTileWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTileWidget() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onToggleTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.w,
        ),
        child: Row(
          children: [
            SizedBox(width: 16.w),
            Avatar(
              radius: 30.w,
              backgroundColor: ColorName.colorBackground,
              backgroundImage: userTile.userAvatarUrl.isNullOrEmpty
                  ? AssetImage(Assets.images.avatar.squarePhoto01.path, package: BaseX.pkg)
                  : isAvatarHttpUrl(userTile.userAvatarUrl)
                      ? NetworkImage(userTile.userAvatarUrl)
                      : AssetImage(userTile.userAvatarUrl, package: BaseX.pkg) as ImageProvider,
            ),
            SizedBox(width: 16.w),
            Text(userTile.username),
            Spacer(),
            Offstage(
              offstage: !userTile.isCurrentLogin,
              child: ObImage.asset(
                Assets.images.icon.comSelect.path,
                width: 20.w,
                height: 20.w,
              ),
            ),
            SizedBox(width: 16.w),
          ],
        ),
      ),
    );
  }

  bool isAvatarHttpUrl(String url) {
    return Uri.tryParse(url)?.scheme == 'https';
  }
}
