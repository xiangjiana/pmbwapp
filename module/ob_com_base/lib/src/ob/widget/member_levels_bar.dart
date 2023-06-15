
import 'package:flutter/material.dart';
import 'package:ob_com_base/gen/colors.gen.dart';

class MemberLevelBar extends StatelessWidget {
  final String title;
  final String mine;
  final List<String> list;
  final ValueChanged? onTap;
  final EdgeInsets? padding;

  MemberLevelBar({required this.title, required this.mine, required this.list, this.padding, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: 42,
      color: Color(0xff1d2933),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              if (this.onTap != null)
                this.onTap!(list[0]);
            },
            child:      Text(
              this.title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white60,
              ),
            ),
          ),

          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, idx) {
                  return _buildNameItem(
                      mine: this.mine,
                      name: list[idx],
                      onTap: () {
                        if (this.onTap != null)
                        this.onTap!(list[idx]);
                      });
                },
                separatorBuilder: (ctx, idx) {

                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: (){
                      if (this.onTap != null)
                        this.onTap!(list[idx+1]);
                    },
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          '>',
                          style: TextStyle(color: Colors.white60),
                        ),
                      ),
                    ),
                  );
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        '>',
                        style: TextStyle(color: Colors.white60),
                      ),
                    ),
                  );
                },
                itemCount: list.length),
          ),
        ],
      ),
    );
  }

  Color _nameColor(bool highlight) {
    if (highlight) {
      return ColorName.colorEmbellish;
    }
    return Colors.white60;
  }

  Widget _buildNameItem(
      {required String mine, required String name, GestureTapCallback? onTap}) {
    return Center(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Text(
          name,
          style: TextStyle(
            fontSize: 14,
            color: _nameColor(mine != title && this.list.length != 1),
          ),
        ),
      ),
    );
  }
}
