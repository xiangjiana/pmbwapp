part of ob_crop_avatar;

/// 控制裁剪动作的控制器。
class CropController {
  late CropControllerDelegate _delegate = CropControllerDelegate();

  /// setter for [CropControllerDelegate]
  set delegate(CropControllerDelegate value) => _delegate = value;

  /// 使用当前配置裁剪给定图像
  void crop() => _delegate.onCrop(false);

  /// 使用当前配置和圆形裁剪给定图像。
  void cropCircle() => _delegate.onCrop(true);

  /// 更改要裁剪的图像。
  /// 当图像改变时，裁剪区域的[Rect]将被重置。
  set image(Uint8List value) => _delegate.onImageChanged(value);

  /// 改变固定纵横比
  /// 如果[value]为空，裁剪区域可以不固定纵横比移动。
  set aspectRatio(double? value) => _delegate.onChangeAspectRatio(value);

  /// 更改是否使用圆形 UI 进行裁剪。
  /// 如果[value]为真，[aspectRatio]自动固定为1
  set withCircleUi(bool value) => _delegate.onChangeWithCircleUi(value);

  /// 更改裁剪区域的 [Rect]。
  /// 如果该值指示在图像之外，则更正该值。
  set rect(Rect value) => _delegate.onChangeRect(value);

  /// 根据原始图像的 [Rect] 更改裁剪区域的 [Rect]。
  set area(Rect value) => _delegate.onChangeArea(value);
}

/// 委托 [CropController] 的动作
class CropControllerDelegate {
  /// 回调 [CropController.crop] 被调用。
  /// 该值的含义是如果裁剪圆形图像。
  late ValueChanged<bool> onCrop;

  /// [CropController.image] 设置的回调。
  late ValueChanged<Uint8List> onImageChanged;

  /// [CropController.aspectRatio] 设置的回调。
  late ValueChanged<double?> onChangeAspectRatio;

  /// [CropController.withCircleUi] 设置的回调。
  late ValueChanged<bool> onChangeWithCircleUi;

  /// [CropController.rect] 设置的回调。
  late ValueChanged<Rect> onChangeRect;

  /// [CropController.area] 设置的回调。
  late ValueChanged<Rect> onChangeArea;
}
