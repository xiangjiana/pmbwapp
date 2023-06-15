import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class DiscountTile extends StatelessWidget {
  final ActivityConfig discount;

  const DiscountTile({Key? key, required this.discount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 16.w),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.w)),
      ),
      color: Colors.white.withOpacity(0.04),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Stack(
              children: [
                Opacity(
                  opacity: (discount.activityStatus ) < 4 ? 1 : 0.4,
                  child: AspectRatio(
                    aspectRatio: 750 / 320,
                    child: CachedNetworkImage(
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      imageUrl: discount.listPicture.isNotNullOrEmpty
                          ? discount.listPicture
                          : '',
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                      placeholder: (ctx, url) => ColoredBox(
                        color: Colors.white.withOpacity(0.4),
                      ),
                      color: (discount.activityStatus ) < 4
                          ? null
                          : Colors.transparent,
                      colorBlendMode: (discount.activityStatus ) < 4
                          ? null
                          : BlendMode.color,
                    ),
                  ),
                ),

                /// 左上角标签
                if (discount.listPictureIcon.isNotNullOrEmpty) _getTabWidget(),

                Positioned(
                  left: 0,
                  bottom: 10.w,
                  child: _buildRangeTime(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getTabWidget() {
    if ((discount.activityStatus ) < 4) {
      return ObImage.network(
        discount.listPictureIcon,
        width: 40.w,
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(8.w),
        topLeft: Radius.circular(6.w),
      ),
      child: ObImage.network(
        discount.listPictureIcon,
        width: 40.w,
        color: Colors.white,
        blendMode: BlendMode.color,
      ),
    );
  }

  _buildRangeTime() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 4.w,
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          ObImage.asset(
            Assets.images.icon.homeTime.path,
            width: 20,
            height: 20,
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            _statusExpiredTimeText,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              height: 1.4,
            ),
          )
        ],
      ),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(20),
          ),
        ),
        color: Color(0xffb2b2b2).withOpacity(0.3),
      ),
    );
  }

  String? get _activityStartAt {
    final str =
        discount.activityStartTime.split(" ").first.replaceAll("-", ".");
    if (str.isNotNullOrEmpty) return str;
    return '';
  }

  String? get _activityEndAt {
    final str = discount.activityEndTime.split(' ').first.replaceAll('-', '.');
    if (str.isNotNullOrEmpty) return str;
    return '';
  }

  //activityStatus 活动状态 0-新创建 1-未展示 2-未开始 3-进行中 4-已过期 5-已停用 6-已结束
  get _statusExpiredTimeText {
    if (discount.cycle == 1) {
      return _statusShow(discount.activityStatus.toInt());
    } else if (discount.cycle == 2) {
      return _foreverStatus(discount.activityStatus.toInt());
    }
    return '';
  }

  //状态显示
  String _statusShow(int status) {
    switch (status) {
      case 4:
        return 'invite_activity_record_state_7'.tr + ' ';
      case 5:
        return 'setting_close'.tr;
      case 6:
        return 'ended'.tr;
      default:
        return '$_activityStartAt-$_activityEndAt';
    }
  }

  //状态显示
  String _foreverStatus(int status) {
    switch (status) {
      case 4:
        return 'invite_activity_record_state_7'.tr + ' ';
      case 5:
        return 'setting_close'.tr;
      case 6:
        return 'ended'.tr;
      default:
        return 'long_term'.tr;
    }
  }
}
