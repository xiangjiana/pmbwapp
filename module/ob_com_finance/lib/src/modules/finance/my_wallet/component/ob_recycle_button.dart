import 'package:flutter/material.dart' hide PageController;
import 'package:ob_com_finance/src/modules/finance/my_wallet/component/recycle_button.dart'
    as Withdraw;
import 'package:ob_com_finance/src/modules/finance/my_wallet/repository/ui_wallet_item.dart';
import 'package:ob_com_finance/src/modules/finance/transfer/component/recycle_button.dart'
    as Transfer;
import 'package:ob_com_base/ob_com_base.dart';

import '../../transfer/component/recycle_new_button.dart' as Capital;

class ObRecycleButton extends StatefulWidget {
  const ObRecycleButton({
    Key? key,
    required this.type,
    required this.onPressed,
    required this.walletItems,
    this.height,
    this.maxWidth,
    this.minHeight,
    this.fontSize,
  }) : super(key: key);

  final String type;
  final Function onPressed;
  final List<UiWalletItem> walletItems;
  final double? height;
  final double? maxWidth;
  final double? minHeight;
  final double? fontSize;

  @override
  _ObRecycleButtonState createState() => _ObRecycleButtonState();
}

class _ObRecycleButtonState extends State<ObRecycleButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final List<UiWalletItem> availableWallet;

  @override
  void initState() {
    super.initState();
    availableWallet = widget.walletItems
        .where((e) => (e.enabled && !e.vipActivityGoing))
        .toList();
    if (availableWallet.length > 0) {
      int upperBound =
          availableWallet.length == 1 ? 1 : availableWallet.length - 1;
      _animationController = AnimationController(
        duration: const Duration(milliseconds: 400),
        lowerBound: 0.0,
        upperBound: upperBound.toDouble(),

        vsync: this, // 垂直同步
      );
    } else {
      _animationController = AnimationController(
        duration: const Duration(milliseconds: 400),
        lowerBound: 0.0,
        upperBound: 0.1,
        vsync: this,
      );
    }
    _animationController.addListener(() {});
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPressed,
      child: widget.type == 'transfer'
          ? Transfer.RecycleButton(
              availableWallet: availableWallet,
              animationController: _animationController,
              height: widget.height,
              maxWidth: widget.maxWidth,
              minHeight: widget.minHeight,
              fontSize: widget.fontSize,
            )
          : widget.type == 'capital'
              ? Capital.RecycleNewButton(
                  availableWallet: availableWallet,
                  animationController: _animationController,
                  height: widget.height,
                  maxWidth: widget.maxWidth,
                  minHeight: widget.minHeight,
                  fontSize: widget.fontSize,
                )
              : Withdraw.RecycleButton(
                  availableWallet: availableWallet,
                  animationController: _animationController,
                  height: widget.height,
                  maxWidth: widget.maxWidth,
                  minHeight: widget.minHeight,
                  fontSize: widget.fontSize,
                  backgroundColor: widget.type == 'withdraw'
                      ? Colors.white.withOpacity(0.1)
                      : Colors.black.withOpacity(0.1),
                ),
    );
  }

  Future<void> onPressed() async {
    bool enabled = CoolDownManager.handler(
      key: 'recyclerBalance',
      duration: 1000,
    );
    if (!enabled) return;
    if (_animationController.isAnimating) return;
    _animationController.forward();
    await widget.onPressed();
    _animationController.reset();
  }
}
