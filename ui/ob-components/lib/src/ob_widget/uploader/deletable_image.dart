import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ob_component/src/theme/colors.dart';

///
class DeletableImage extends StatelessWidget {
  ///
  const DeletableImage({
    required this.url,
    required this.onRemoveImage,
    required this.tag,
    Key? key,
  }) : super(key: key);

  /// 图片地址
  final String url;

  /// tag
  final String tag;

  /// 删除事件回调
  final Function(String) onRemoveImage;

  ImageProvider get _imageProvider {
    if (url.startsWith('http') || url.startsWith('https')) {
      return NetworkImage(url);
    }
    return FileImage(File(url));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Positioned(
              child: SizedBox(
                width: 72,
                height: 72,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image(
                      image: ResizeImage(_imageProvider, width: 72, height: 72),
                    )),
              ),
            ),
            Positioned(
              right: 4,
              top: 4,
              child: GestureDetector(
                onTap: () => onRemoveImage(url),
                child: Image.asset(
                  'assets/images/icon/com_delete.png',
                  width: 16,
                  height: 16,
                  package: 'ob_component',
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        Text(
          tag,
          style: const TextStyle(
            fontSize: 12,
            color: white60,
          ),
        )
      ],
    );
  }
}
