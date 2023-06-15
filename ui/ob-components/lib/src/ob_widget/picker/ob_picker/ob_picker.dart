import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ob_component/src/ob_widget/picker/picker_selection_overlay.dart';
import 'package:ob_component/src/ob_widget/picker/picker_title.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

///
class ObPicker extends StatefulWidget {
  ///
  const ObPicker({
    required this.children,
    Key? key,
  }) : super(key: key);

  ///
  final List<Widget> children;

  @override
  _ObPickerState createState() => _ObPickerState();
}

class _ObPickerState extends State<ObPicker> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PickerTitle(
          onCancelListener: Navigator.of(context).pop,
          onConfirmListener: () => Navigator.of(context).pop(index),
        ),
        Expanded(
          child: CupertinoPicker(
            itemExtent: 40,
            selectionOverlay: const PickerSelectionOverlay(),
            onSelectedItemChanged: (int index) {
              setState(() {
                Vibrate.feedback(FeedbackType.impact);
                this.index = index;
              });
            },
            children: widget.children,
          ),
        ),
      ],
    );
  }
}
