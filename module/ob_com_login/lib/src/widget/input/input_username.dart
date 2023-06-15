import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ob_com_login/src/modules/user/user_toggle/repository/ui_toggle_item_user.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

typedef OnUserRemove = void Function(int index);
typedef OnUserChoose = void Function(int index);

class InputUserName extends StatefulWidget {
  InputUserName({
    Key? key,
    required this.controller,
    this.onChanged,
    this.autofocus = false,
    this.enableClean = false,
    this.enableDropDown = false,
    this.onCleanTap,
    this.onUserChoose,
    this.onUserRemove,
    this.focusNode,
    this.hint,
    this.prefixIconpaddingRight,
  }) : super(key: key);

  final TextEditingController controller;
  final bool autofocus;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final bool enableClean;
  final bool enableDropDown;
  final GestureTapCallback? onCleanTap;
  final OnUserRemove? onUserRemove;
  final OnUserChoose? onUserChoose;
  final String? hint;
  final double? prefixIconpaddingRight;

  @override
  _InputUserNameState createState() => _InputUserNameState();
}

class _InputUserNameState extends State<InputUserName> {
  ObPopupMenuController _menuController = ObPopupMenuController();

  @override
  void dispose() {
    _menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ObInputTextField(
      rimStyle: RimStyle.customize,
      editingController: widget.controller,
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      keyboardType: TextInputType.streetAddress,
      hintText: widget.hint,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('^[a-z0-9A-Z]+')),
        LengthLimitingTextInputFormatter(11),
      ],
      decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Color(0xff1a1c20),
            ),
      prefixIconConstraints: BoxConstraints(
        minWidth: 24.w,
        minHeight: 24.w,
      ),
      contentPadding: EdgeInsets.only(left: 20.w),
      suffixIcon: Container(
        constraints: BoxConstraints(minWidth: 40.w, maxWidth: 60.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: widget.enableClean,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  widget.onCleanTap?.call();
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: pkObImage(
                    Assets.images.icon.comDelete2.path,
                    width: 24.w,
                    height: 24.w,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.w),
          ],
        ),
      ),
    );
  }

  Widget _handItemWidget(int index, UIToggleItemUser item) {
    return Container(
      height: 48.w,
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                _menuController.hideMenu();
                widget.onUserChoose?.call(index);
              });
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: 8.w,
                top: 8.w,
                bottom: 8.w,
                right: 16.w,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Avatar(
                    radius: 32.w,
                    backgroundColor: ColorName.colorBackground,
                    backgroundImage: isAvatarHttpUrl(item.userAvatarUrl)
                        ? NetworkImage(item.userAvatarUrl)
                        : AssetImage(
                            item.userAvatarUrl.isNotEmpty
                                ? item.userAvatarUrl
                                    .replaceFirst(RegExp(r"[^.]*$"), "png")
                                : Assets.images.avatar.squarePhoto01.path,
                            package: BaseX.pkg) as ImageProvider,
                  ),
                  Text(
                    item.username,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          Positioned(
            right: 16.w,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                setState(() {
                  _menuController.hideMenu();
                  widget.onUserRemove?.call(index);
                });
              },
              child: pkObImage(
                Assets.images.icon.comDelete2.path,
                width: 24.w,
                height: 24.w,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isAvatarHttpUrl(String url) {
    return Uri.tryParse(url)?.scheme == 'https';
  }
}
