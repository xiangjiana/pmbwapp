import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'linear_percent_indicator.dart';

///
class UpdateImage extends StatelessWidget {
  ///
  const UpdateImage({
    required this.url,
    required this.tag,
    Key? key,
    this.progress = 0,
  }) : super(key: key);

  /// 图片地址
  final String url;

  /// tag
  final String tag;

  /// 当前进度
  final double progress;

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
          alignment: Alignment.center,
          children: <Widget>[
            /// 图片展示位置
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

            /// 蒙皮
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.black.withOpacity(0.6),
              ),
            ),

            /// 文字区  正在上传
            Container(
              child: Text(
                "uploading_label".tr,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),

            ///进度条
            Positioned(
              left: 8,
              right: 8,
              bottom: 0,
              height: 3,
              child: Container(
                clipBehavior: Clip.antiAlias,
                height: 3,
                decoration: const ShapeDecoration(
                  shape: StadiumBorder(),
                  color: Colors.white30,
                ),
                child: LinearPercentIndicator(
                  strokeCapRound: true,
                  height: 3,
                  backgroundColor: Colors.transparent,
                  colors: const <Color>[
                    Color(0xff3BC117),
                    Color(0xff3BC117),
                  ],
                  value: progress > 1 ? 1 : progress,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          tag,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white60,
          ),
        )
      ],
    );
  }
}
