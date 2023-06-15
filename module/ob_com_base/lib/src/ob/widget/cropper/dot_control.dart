part of ob_crop_avatar;

class DotControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: dotTotalSize / 2,
      height: dotTotalSize / 2,
      decoration: ShapeDecoration(
        shape: DotBorderControl(size: 10),
      ),
    );
  }
}
