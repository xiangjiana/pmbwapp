import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/repository/ui_wallet_item.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class GridWalletTile extends StatelessWidget {
  final UiWalletItem merchant;
  final VoidCallback? onTransferInPress;
  final VoidCallback? onTransferOutPress;
  final ValueChanged<UiWalletItem>? onItemFlowDetailClick;

  const GridWalletTile(this.merchant,
      {Key? key,
      this.onTransferInPress,
      this.onTransferOutPress,
      this.onItemFlowDetailClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorName.colorLineWhite6, width: 1.w),
        borderRadius: BorderRadius.all(Radius.circular(8.w)),
        color: Colors.white.withOpacity(0.04),
      ),
      child: Stack(
        children: [
          if (merchant.enabled && merchant.vipActivityGoing)
            _buildFlowActionButton(),
          Padding(
            padding: EdgeInsets.only(top: 16.w, left: 12.w, right: 12.w),
            child: Column(
              children: [
                _buildWalletBody(),
                const Spacer(),
                if (merchant.enabled)
                  _buildEnableTransferButton()
                else
                  _buildDisableTransferButton()
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buildWalletBody() {
    return SizedBox(
      height: 38.w,
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: merchant.venueWalletIconUrl,
            //"assets/images/venue/wallet_${merchant.id}.webp",
            width: 32.w,
            height: 32.w,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  merchant.name,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                if (merchant.enabled)
                  Text(
                    merchant.balance.isEmpty
                        ? "-"
                        : AppCurrencyUtils.dealBalance(merchant.balance),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: FontFamily.gothamMedium,
                      package: BaseX.pkg2,
                    ),
                  )
                else
                  Text(
                    'my_wallet_the_venue_is_under_maintenance'.tr,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buildEnableTransferButton() {
    return SizedBox(
      height: 34.w,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: onTransferInPress,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'my_wallet_transfer_in'.tr,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 1.w,
            height: 12.w,
            color: Colors.white.withOpacity(0.04),
          ),
          if (merchant.vipActivityGoing)
            Expanded(
              child: Container(
                alignment: Alignment.center,
                width: 65.w,
                child: Text(
                  'my_wallet_not_transferable'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white.withOpacity(0.3),
                    wordSpacing: -2,
                  ),
                ),
              ),
            )
          else
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onTransferOutPress,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'my_wallet_transfer_out'.tr,
                    style: TextStyle(
                        fontSize: 12, color: Colors.white.withOpacity(0.6)),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  SizedBox _buildDisableTransferButton() {
    return SizedBox(
      height: 34.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 5.w),
            alignment: Alignment.center,
            width: 65.w,
            child: Text(
              'my_wallet_not_transferable_in'.tr,
                  textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: Colors.white.withOpacity(0.3),
                    wordSpacing: -2,
              ),
            ),
          ),
          const Spacer(),
          Container(
            width: 1.w,
            height: 20.w,
            color: Colors.white.withOpacity(0.04),
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.only(right: 5.w),
            alignment: Alignment.center,
            width:65.w,
            child: Text(
              'my_wallet_not_transferable'.tr,
                  textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                    wordSpacing: -2,
                color: Colors.white.withOpacity(0.3),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Positioned _buildFlowActionButton() {
    return Positioned(
      top: 8.w,
      right: 8.w,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => onItemFlowDetailClick?.call(merchant),
        child: Container(
          alignment: Alignment.topRight,
          width: 32.w,
          child: pkObImage(
            Assets.images.icon.walletHint.path,
            width: 16.w,
          ),
        ),
      ),
    );
  }
}
