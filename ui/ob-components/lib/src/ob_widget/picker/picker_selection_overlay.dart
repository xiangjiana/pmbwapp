import 'package:flutter/material.dart';

/// picker 默认 selectionOverlay
class PickerSelectionOverlay extends StatelessWidget {
  ///
  const PickerSelectionOverlay();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        border: Border(
          top: BorderSide(
              color: Colors.white.withOpacity(0.06),
              width: 1,
              style: BorderStyle.solid),
          bottom: BorderSide(
              color: Colors.white.withOpacity(0.06),
              width: 1,
              style: BorderStyle.solid),
        ),
      ),
    );
  }
}
