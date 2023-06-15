import 'package:flutter/material.dart' hide PageController;
import 'package:ob_component/ob_component.dart' hide ObTheme;

class AddAccountButton extends StatelessWidget {
  final String label;
  final EdgeInsets? margin;

  const AddAccountButton({Key? key, required this.label, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.all(Radius.circular(8.w)),
      ),
      height: 64.w,
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
