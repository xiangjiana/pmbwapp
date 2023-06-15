import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ob_package/modules/records/discount/discount.dart';

class DiscountWidget extends StatefulWidget {
  @override
  _DiscountWidgetState createState() => _DiscountWidgetState();
}

class _DiscountWidgetState extends State<DiscountWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Promotion();
  }

  @override
  bool get wantKeepAlive => true;
}
