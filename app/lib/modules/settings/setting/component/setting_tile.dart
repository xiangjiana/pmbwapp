import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class SettingTile extends StatefulWidget {
  final String title;
  final String description;
  final Widget? newMark;
  final VoidCallback? onPress;
  final bool isShow;

  SettingTile({
    Key? key,
    required this.title,
    this.description = "",
    this.newMark,
    this.onPress,
    this.isShow = true,
  }) : super(key: key);

  @override
  _SettingTileState createState() => _SettingTileState();
}

class _SettingTileState extends State<SettingTile> {
  DateTime? _lastClickTime;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 防重复提交
        if (_lastClickTime == null ||
            DateTime.now().difference(_lastClickTime!) >
                Duration(milliseconds: 800)) {
          _lastClickTime = DateTime.now();
          widget.onPress!.call();
        } else {
          _lastClickTime = DateTime.now();
        }
      },
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          height: 48.w,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: LocaleUtils.isLocale ? 14 : 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
              if (widget.newMark != null) widget.newMark!,
              if (widget.description.isNotEmpty)
                Text(
                  widget.description.isEmpty
                      ? "-"
                      : widget.description == "-"
                          ? "0.00B"
                          : widget.description,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.6),
                      fontWeight: FontWeight.w400),
                ),
              Visibility(
                visible: widget.onPress != null && widget.isShow,
                child: Row(
                  children: [
                    SizedBox(width: 10.w),
                    ObImage.asset(
                      Assets.images.icon.homeMoreRight.path,
                      width: 16,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
