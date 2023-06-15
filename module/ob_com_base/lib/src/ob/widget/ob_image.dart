import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ob_com_base/ob_com_base.dart';

extension AsObImage on String {
  ObImage asObImage({
    Key? key,
    ImageErrorWidgetBuilder? errorBuilder,
    BoxFit? fit,
    double? height,
    double? width,
    String? package = BaseX.pkg,
    Color? color,
    BlendMode? colorBlendMode,
    Alignment alignment = Alignment.center,
  }) {
    return ObImage.asset(
      toPng(),
      key: key,
      errorBuilder: errorBuilder,
      fit: fit,
      height: height,
      width: width,
      package: package,
      color: color,
      colorBlendMode: colorBlendMode,
      alignment: alignment,
    );
  }
}

extension AsObImage2 on AssetGenImage {
  ObImage asObImage2({
    Key? key,
    ImageErrorWidgetBuilder? errorBuilder,
    BoxFit? fit,
    double? height,
    double? width,
    String? package = BaseX.pkg,
    Color? color,
    BlendMode? colorBlendMode,
    Alignment alignment = Alignment.center,
  }) {
    return ObImage.asset(
      path,
      key: key,
      errorBuilder: errorBuilder,
      fit: fit,
      height: height,
      width: width,
      package: package,
      color: color,
      colorBlendMode: colorBlendMode,
      alignment: alignment,
    );
  }
}

//针对图片加载异常导致app黑屏问题
class ObImage extends StatelessWidget {
  final Image image;

//加载网络图片
  ObImage.network(
      String src, {
        Key? key,
        ImageErrorWidgetBuilder? errorBuilder,
        BoxFit? fit,
        double? height,
        double? width,
        Alignment alignment = Alignment.center,
        String? cacheKey,
        Color? color,
        BlendMode? blendMode,
        bool? gaplessPlayback,
        ImageLoadingBuilder? loadingBuilder,
      })  : image = Image(
    image: CachedNetworkImageProvider(src, cacheKey: cacheKey),
    fit: fit,
    color: color,
    colorBlendMode: blendMode,
    alignment: alignment,
    height: height,
    width: width,
    gaplessPlayback: gaplessPlayback ?? false,
    loadingBuilder: loadingBuilder,
    errorBuilder: errorBuilder ??
            (context, object, stack) {
          return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.04),
            ),
          );
        },
  ),
        super(key: key);

//加载本地图片
  ObImage.asset(
      String src, {
        Key? key,
        ImageErrorWidgetBuilder? errorBuilder,
        BoxFit? fit,
        double? height,
        double? width,
        String? package = BaseX.pkg,
        Color? color,
        BlendMode? colorBlendMode,
        Alignment alignment = Alignment.center,
      })  : image = Image.asset(
    src.toPng(),
    fit: fit,
    alignment: alignment,
    height: height,
    width: width,
    color: color,
    package: package,
    colorBlendMode: colorBlendMode,
    errorBuilder: errorBuilder ??
            (context, object, stack) {
          return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.04),
            ),
          );
        },
  ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return image;
  }
}

// ignore: must_be_immutable
class ObImageAuto extends StatelessWidget {
  final String src;
  final ImageErrorWidgetBuilder? errorBuilder;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final Alignment alignment;
  final ImageLoadingBuilder? loadingBuilder;
  final bool? gaplessPlayback;
  final String? cacheKey;

  const ObImageAuto(this.src,
      {this.errorBuilder,
        this.fit,
        this.height,
        this.width,
        this.cacheKey,
        this.alignment = Alignment.center,
        this.loadingBuilder,
        this.gaplessPlayback});

  //接口返回的图片域名会变动但图片实际没变，此时不重新加载图片，在web端会导致
  bool isSameImage(String srcOld, String srcNew) {
    if (srcOld.startsWith("http") && srcNew.startsWith("http")) {
      if (srcOld.substring(srcOld.lastIndexOf("/")) == srcNew.substring(srcNew.lastIndexOf("/"))) {
        return true;
      }
      return false;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (src.startsWith('http://') || src.startsWith('https://')) {
      return ObImage.network(
        src,
        errorBuilder: errorBuilder,
        fit: fit,
        height: height,
        width: width,
        cacheKey: cacheKey,
        alignment: alignment,
        loadingBuilder: loadingBuilder,
        gaplessPlayback: gaplessPlayback,
      );
    }
    return ObImage.asset(
      src.toPng(),
      errorBuilder: errorBuilder,
      fit: fit,
      height: height,
      width: width,
      alignment: alignment,
    );
  }
}

ObImage pkObImage(
    String src, {
      Key? key,
      ImageErrorWidgetBuilder? errorBuilder,
      BoxFit? fit,
      double? height,
      double? width,
      Color? color,
      BlendMode? colorBlendMode,
      Alignment alignment = Alignment.center,
    }) {
  return ObImage.asset(
    src.toPng(),
    key: key,
    errorBuilder: errorBuilder,
    fit: fit,
    height: height,
    width: width,
    color: color,
    colorBlendMode: colorBlendMode,
    package: BaseX.pkg,
    alignment: alignment,
  );
}
