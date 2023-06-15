part of ob_crop_avatar;

const dotTotalSize = 32.0;

typedef CornerDotBuilder = Widget Function(
    double size, CropStyle style, EdgeAlignment edgeAlignment);

enum CropStatus { nothing, loading, ready, cropping }

enum CropStyle { dot, line }

class Crop extends StatelessWidget {
  /// 原始图像数据
  final Uint8List image;

  /// 裁剪完成时回调
  final ValueChanged<Uint8List> onCropped;

  /// 固定裁剪区域的纵横比 默认 null
  final double? aspectRatio;

  /// 裁剪区域的初始大小。
  /// 设置双精度值小于 1.0。
  /// 如果 initialSize 为 1.0（或 null），
  /// 裁剪区域会尽可能扩大。
  final double? initialSize;

  /// 裁剪区域的初始 [Rect]。
  /// 这个[Rect]必须基于[image]数据的rect，而不是screen。
  /// 例如 如果原始图像大小为 1280x1024，
  /// 给 [Rect.fromLTWH(240, 212, 800, 600)] 作为 [initialArea] 会
  /// 导致以 800x600 的图像大小覆盖图像的精确中心。
  ///
  /// 如果给定了 [initialArea]，则忽略 [initialSize]。
  /// 另一方面，尽管初始形状的 [aspectRatio] 仍然启用
  /// 裁剪区域取决于 [initialArea]。 一旦用户移动裁剪区域
  /// 用手，根据[aspectRatio]计算裁剪区域的形状。
  final Rect? initialArea;

  /// 圆形裁剪图像的标志。如果[真]，[纵横比]固定为1。
  final bool withCircleUi;

  /// 控制器
  final CropController? controller;

  /// 裁剪区域移动时调用的回调。
  final ValueChanged<Rect>? onMoved;

  /// 当裁剪小部件的状态改变时调用回调。
  /// 注意：目前，第一个回调是 [CropStatus.ready]
  /// 第一次加载[图像]数据后调用。
  final ValueChanged<CropStatus>? onStatusChanged;

  /// 放置在裁剪编辑器上的遮罩小部件的 [颜色]。
  final Color? maskColor;

  /// 裁剪编辑器基色的[颜色]。
  final Color baseColor;

  final Color? progressColor;

  final CropStyle cropStyle;

  /// 角点小部件的构建器。
  /// [CornerDotBuilder] 通过 [size] 表示每个点的大小
  /// 和 [EdgeAlignment] 表示每个点的位置。
  /// 如果需要不同颜色的默认dot Widget，可以使用[DotControl]。
  final CornerDotBuilder? cornerDotBuilder;

  const Crop({
    Key? key,
    required this.image,
    required this.onCropped,
    this.aspectRatio,
    this.initialSize,
    this.initialArea,
    this.withCircleUi = true,
    this.controller,
    this.onMoved,
    this.onStatusChanged,
    this.maskColor,
    this.baseColor = Colors.white,
    this.progressColor,
    this.cropStyle = CropStyle.dot,
    this.cornerDotBuilder,
  })  : assert((initialSize ?? 1.0) <= 1.0,
            'initialSize must be less than 1.0, or null meaning not specified.'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (c, constraints) {
        final newData = MediaQuery.of(c).copyWith(
          size: constraints.biggest,
        );
        return MediaQuery(
          data: newData,
          child: _CropEditor(
            image: image,
            onCropped: onCropped,
            aspectRatio: aspectRatio,
            initialSize: initialSize,
            initialArea: initialArea,
            withCircleUi: withCircleUi,
            controller: controller,
            onMoved: onMoved,
            onStatusChanged: onStatusChanged,
            maskColor: maskColor,
            baseColor: baseColor,
            progressColor: progressColor,
            cornerDotBuilder: cornerDotBuilder,
          ),
        );
      },
    );
  }
}

class _CropEditor extends StatefulWidget {
  final Uint8List image;
  final ValueChanged<Uint8List> onCropped;
  final double? aspectRatio;
  final double? initialSize;
  final Rect? initialArea;
  final bool withCircleUi;
  final CropController? controller;
  final ValueChanged<Rect>? onMoved;
  final ValueChanged<CropStatus>? onStatusChanged;
  final Color? maskColor;
  final Color baseColor;
  final Color? progressColor;
  final CropStyle cropStyle;
  final CornerDotBuilder? cornerDotBuilder;

  const _CropEditor({
    Key? key,
    required this.image,
    required this.onCropped,
    this.aspectRatio,
    this.initialSize,
    this.initialArea,
    this.withCircleUi = true,
    this.controller,
    this.onMoved,
    this.onStatusChanged,
    this.maskColor,
    required this.baseColor,
    this.progressColor,
    this.cropStyle = CropStyle.dot,
    this.cornerDotBuilder,
  }) : super(key: key);

  @override
  _CropEditorState createState() => _CropEditorState();
}

class _CropEditorState extends State<_CropEditor> {
  late CropController _cropController;
  late Rect _rect;
  image.Image? _targetImage;
  late Rect _imageRect;
  late Stopwatch stopwatch;
  double? _aspectRatio;
  bool _withCircleUi = true;
  bool _isFitVertically = false;
  Future<image.Image?>? _lastComputed;

  bool get _isImageLoading => _lastComputed != null;

  _Calculator get calculator => _isFitVertically
      ? const _VerticalCalculator()
      : const _HorizontalCalculator();

  set rect(Rect newRect) {
    setState(() {
      _rect = newRect;
    });
    widget.onMoved?.call(_rect);
  }

  @override
  void initState() {
    _cropController = widget.controller ?? CropController();
    _cropController.delegate = CropControllerDelegate()
      ..onCrop = _crop
      ..onChangeAspectRatio = (aspectRatio) {
        _resizeWith(aspectRatio, null);
      }
      ..onChangeWithCircleUi = (withCircleUi) {
        _withCircleUi = withCircleUi;
        _resizeWith(null, null);
      }
      ..onImageChanged = _resetImage
      ..onChangeRect = (newRect) {
        rect = calculator.correct(newRect, _imageRect);
      }
      ..onChangeArea = (newArea) {
        _resizeWith(_aspectRatio, newArea);
      };

    super.initState();
  }

  @override
  void didChangeDependencies() {
    final future = compute(_fromByteData, widget.image);
    _lastComputed = future;
    future.then((converted) {
      if (_lastComputed == future) {
        _targetImage = converted;
        _withCircleUi = widget.withCircleUi;
        _resetCroppingArea();

        setState(() {
          _lastComputed = null;
        });
        widget.onStatusChanged?.call(CropStatus.ready);
      }
    });
    super.didChangeDependencies();
  }

  /// 重置要裁剪的图像
  void _resetImage(Uint8List targetImage) {
    widget.onStatusChanged?.call(CropStatus.loading);
    final future = compute(_fromByteData, targetImage);
    _lastComputed = future;
    future.then((converted) {
      if (_lastComputed == future) {
        setState(() {
          _targetImage = converted;
          _lastComputed = null;
        });
        _resetCroppingArea();
        widget.onStatusChanged?.call(CropStatus.ready);
      }
    });
  }

  /// 用当前状态重置裁剪区域的 [Rect]
  void _resetCroppingArea() {
    final screenSize = MediaQuery.of(context).size;

    final imageRatio = _targetImage!.width / _targetImage!.height;
    _isFitVertically = imageRatio < screenSize.aspectRatio;

    _imageRect = calculator.imageRect(screenSize, imageRatio);

    _resizeWith(widget.aspectRatio, widget.initialArea);
  }

  /// 使用给定的纵横比调整裁剪区域的大小。
  void _resizeWith(double? aspectRatio, Rect? initialArea) {
    _aspectRatio = _withCircleUi ? 1 : aspectRatio;

    if (initialArea == null) {
      rect = calculator.initialCropRect(
        MediaQuery.of(context).size,
        _imageRect,
        _aspectRatio ?? 1,
        widget.initialSize ?? 1,
      );
    } else {
      final screenSizeRatio = calculator.screenSizeRatio(
        _targetImage!,
        MediaQuery.of(context).size,
      );
      rect = Rect.fromLTWH(
        _imageRect.left + initialArea.left / screenSizeRatio,
        _imageRect.top + initialArea.top / screenSizeRatio,
        initialArea.width / screenSizeRatio,
        initialArea.height / screenSizeRatio,
      );
    }
  }

  /// 用给定的区域裁剪给定的图像。
  Future<void> _crop(bool withCircleShape) async {
    assert(_targetImage != null);
    stopwatch = new Stopwatch()..start();
    final screenSizeRatio = calculator.screenSizeRatio(
      _targetImage!,
      MediaQuery.of(context).size,
    );

    widget.onStatusChanged?.call(CropStatus.cropping);

    //使用 Isolate compute()隔离运行 不阻止 主线线程UI 更新
    final cropResult = await compute(
      withCircleShape ? _doCropCircle : _doCrop,
      [
        _targetImage!,
        Rect.fromLTWH(
          (_rect.left - _imageRect.left) * screenSizeRatio,
          (_rect.top - _imageRect.top) * screenSizeRatio,
          _rect.width * screenSizeRatio,
          _rect.height * screenSizeRatio,
        ),
      ],
    );
    stopwatch.stop();
    // print('--------------->裁剪耗时 -${stopwatch.elapsedMilliseconds}');
    widget.onCropped(cropResult);

    widget.onStatusChanged?.call(CropStatus.ready);
  }

  @override
  Widget build(BuildContext context) {
    return _isImageLoading
        ? Container(
            margin: EdgeInsets.only(top: 250),
            alignment: Alignment.topCenter,
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    widget.progressColor ?? Colors.white30)),
          )
        : Stack(
            children: [
              Container(
                color: widget.baseColor,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.memory(
                  widget.image,
                  fit: _isFitVertically ? BoxFit.fitHeight : BoxFit.fitWidth,
                ),
              ),
              IgnorePointer(
                child: ClipPath(
                  clipper: _withCircleUi
                      ? _CircleCropAreaClipper(_rect)
                      : _CropAreaClipper(_rect),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: widget.maskColor ?? Colors.black.withAlpha(100),
                  ),
                ),
              ),
              Positioned(
                left: _rect.left,
                top: _rect.top,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    rect = calculator.moveRect(
                      _rect,
                      details.delta.dx,
                      details.delta.dy,
                      _imageRect,
                    );
                  },
                  child: Container(
                    width: _rect.width,
                    height: _rect.height,
                    color: Colors.transparent,
                  ),
                ),
              ),
              Positioned(
                left: _rect.left,
                top: _rect.top,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    rect = calculator.moveTopLeft(
                      _rect,
                      details.delta.dx,
                      details.delta.dy,
                      _imageRect,
                      _aspectRatio,
                    );
                  },
                  child: widget.cornerDotBuilder?.call(dotTotalSize,
                          widget.cropStyle, EdgeAlignment.topLeft) ??
                      BorderControl(EdgeAlignment.topLeft),
                ),
              ),
              Positioned(
                left: _rect.right - (dotTotalSize / 2),
                top: _rect.top,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    rect = calculator.moveTopRight(
                      _rect,
                      details.delta.dx,
                      details.delta.dy,
                      _imageRect,
                      _aspectRatio,
                    );
                  },
                  child: widget.cornerDotBuilder?.call(dotTotalSize,
                          widget.cropStyle, EdgeAlignment.topRight) ??
                      BorderControl(EdgeAlignment.topRight),
                ),
              ),
              Positioned(
                left: _rect.left,
                top: _rect.bottom - (dotTotalSize / 2),
                child: GestureDetector(
                  onPanUpdate: (details) {
                    rect = calculator.moveBottomLeft(
                      _rect,
                      details.delta.dx,
                      details.delta.dy,
                      _imageRect,
                      _aspectRatio,
                    );
                  },
                  child: widget.cornerDotBuilder?.call(dotTotalSize,
                          widget.cropStyle, EdgeAlignment.bottomLeft) ??
                      BorderControl(EdgeAlignment.bottomLeft),
                ),
              ),
              Positioned(
                left: _rect.right - (dotTotalSize / 2),
                top: _rect.bottom - (dotTotalSize / 2),
                child: GestureDetector(
                  onPanUpdate: (details) {
                    rect = calculator.moveBottomRight(
                      _rect,
                      details.delta.dx,
                      details.delta.dy,
                      _imageRect,
                      _aspectRatio,
                    );
                  },
                  child: widget.cornerDotBuilder?.call(dotTotalSize,
                          widget.cropStyle, EdgeAlignment.bottomRight) ??
                      BorderControl(EdgeAlignment.bottomRight),
                ),
              ),
            ],
          );
  }
}

class _CropAreaClipper extends CustomClipper<Path> {
  final Rect rect;

  _CropAreaClipper(this.rect);

  @override
  Path getClip(Size size) {
    return Path()
      ..addPath(
        Path()
          ..moveTo(rect.left, rect.top)
          ..lineTo(rect.right, rect.top)
          ..lineTo(rect.right, rect.bottom)
          ..lineTo(rect.left, rect.bottom)
          ..close(),
        Offset.zero,
      )
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class _CircleCropAreaClipper extends CustomClipper<Path> {
  final Rect rect;

  _CircleCropAreaClipper(this.rect);

  @override
  Path getClip(Size size) {
    return Path()
      ..addOval(Rect.fromCircle(center: rect.center, radius: rect.width / 2))
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

/// 处理裁剪图像。
/// 这个方法应该只能通过compute()调用
Uint8List _doCrop(List<dynamic> cropData) {
  final originalImage = cropData[0] as image.Image;
  final rect = cropData[1] as Rect;
  return Uint8List.fromList(
    image.encodePng(
      image.copyCrop(
        originalImage,
        x: rect.left.toInt(),
        y: rect.top.toInt(),
        width: rect.width.toInt(),
        height: rect.height.toInt(),
      ),
    ),
  );
}

/// 处理圆形的裁剪图像。
/// 这个方法应该只能通过compute()调用
Uint8List _doCropCircle(List<dynamic> cropData) {
  final originalImage = cropData[0] as image.Image;
  final rect = cropData[1] as Rect;
  return Uint8List.fromList(
    image.encodePng(
      image.copyCropCircle(
        originalImage,
        centerX: (rect.left + rect.width / 2).toInt(),
        centerY: (rect.top + rect.height / 2).toInt(),
        radius: min(rect.width, rect.height) ~/ 2,
      ),
    ),
  );
}

///解码方向感知图像。
image.Image? _fromByteData(Uint8List data) {
  try {
    final tempImage = image.decodeImage(data);
    assert(tempImage != null);
    // check orientation
    switch (tempImage?.exif.directories[0x0112] ?? -1) {
      case 3:
        return image.copyRotate(tempImage!, angle: 180);
      case 6:
        return image.copyRotate(tempImage!, angle: 90);
      case 8:
        return image.copyRotate(tempImage!, angle: -90);
    }
    return tempImage!;
  } catch (_) {
    return null;
  }
}
