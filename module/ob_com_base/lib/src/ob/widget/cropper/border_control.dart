part of ob_crop_avatar;

class BorderControl extends StatelessWidget {
  final EdgeAlignment edgeAlignment;

  BorderControl(this.edgeAlignment);

  @override
  Widget build(BuildContext context) {
    if (edgeAlignment == EdgeAlignment.topLeft)
      return Container(
        width: dotTotalSize / 2,
        height: dotTotalSize / 2,
        decoration: ShapeDecoration(
          shape: RectangleBorderControl(
            topLeftCornerSide: BorderSide(
              color: Colors.white,
            ),
            topSide: BorderSide(
              color: Colors.white,
              width: 2.5,
            ),
            leftSide: BorderSide(
              color: Colors.white,
              width: 2.5,
            ),
          ),
        ),
      );
    if (edgeAlignment == EdgeAlignment.topRight)
      return Container(
        width: dotTotalSize / 2,
        height: dotTotalSize / 2,
        decoration: ShapeDecoration(
          shape: RectangleBorderControl(
            topRightCornerSide: BorderSide(
              color: Colors.white,
            ),
            rightSide: BorderSide(
              color: Colors.white,
              width: 2.5,
            ),
            topSide: BorderSide(
              color: Colors.white,
              width: 2.5,
            ),
          ),
        ),
      );

    if (edgeAlignment == EdgeAlignment.bottomLeft)
      return Container(
        width: dotTotalSize / 2,
        height: dotTotalSize / 2,
        decoration: ShapeDecoration(
          shape: RectangleBorderControl(
            borderRadius: BorderRadius.all(Radius.circular(2)),
            bottomLeftCornerSide: BorderSide(
              color: Colors.white,
            ),
            leftSide: BorderSide(
              color: Colors.white,
              width: 2.5,
            ),
            bottomSide: BorderSide(
              color: Colors.white,
              width: 2.5,
            ),
          ),
        ),
      );
    if (edgeAlignment == EdgeAlignment.bottomRight)
      return Container(
        width: dotTotalSize / 2,
        height: dotTotalSize / 2,
        decoration: ShapeDecoration(
          shape: RectangleBorderControl(
            bottomRightCornerSide: BorderSide(
              color: Colors.white,
              width: 5,
            ),
            rightSide: BorderSide(
              color: Colors.white,
              width: 2.5,
            ),
            bottomSide: BorderSide(
              color: Colors.white,
              width: 2.5,
            ),
          ),
        ),
      );
    else
      return SizedBox.shrink();
  }
}
