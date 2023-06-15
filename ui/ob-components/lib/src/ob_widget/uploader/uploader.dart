import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ob_component/ob_component.dart';
import 'package:ob_component/src/ob_widget/uploader/update_image.dart';
import 'package:ob_component/src/theme/colors.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import 'deletable_image.dart';

/// 选择图片组件
class Uploader extends StatefulWidget {
  ///
  const Uploader({
    Key? key,
    this.maxCount = 3,
    this.fileList = const <String>[],
    this.customRequest,
    this.onChange,
    this.beforeAdd,
  }) : super(key: key);

  /// 最大可选择数量
  final int maxCount;

  /// 图片列表
  final List<String> fileList;

  /// 自定义请求
  final FutureOr<String?> Function(String, {required Function builder})?
      customRequest;

  /// 上传文件改变时的状态
  final void Function(List<String>)? onChange;

  /// 选择图片前的预处理 一般用于权限问题处理
  final FutureOr<bool> Function()? beforeAdd;

  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  late final List<String> _dataSource = widget.fileList.toList();
  final List<_UploadImageStatus> _uploadingDataSource = <_UploadImageStatus>[];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: <Widget>[
        for (int i = 0; i < _dataSource.length; i++)
          DeletableImage(
            url: _dataSource[i],
            onRemoveImage: _handleRemove,
            tag: '${i + 1}/${widget.maxCount}',
          ),
        for (int i = 0; i < _uploadingDataSource.length; i++)
          UpdateImage(
            url: _uploadingDataSource[i].originUrl,
            tag: '${_dataSource.length + i + 1}/${widget.maxCount}',
            progress: _uploadingDataSource[i].progress,
          ),
        if ((_dataSource.length + _uploadingDataSource.length) <
            widget.maxCount)
          GestureDetector(
            onTap: () => _handleAdd(context),
            child: Column(
              children: <Widget>[
                Container(
                  width: 72,
                  height: 72,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: white4,
                  ),
                  child: Image.asset(
                    'assets/images/icon/course_add.png',
                    width: 24,
                    height: 24,
                    package: 'ob_component',
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _getTagText(),
                  style: const TextStyle(
                    fontSize: 12,
                    color: white60,
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }

  void _handleRemove(String url) {
    setState(() {
      if (mounted) {
        _dataSource.remove(url);
        widget.onChange?.call(_dataSource);
      }
    });
  }

  Future<void> _handleAdd(BuildContext context) async {
    final bool allowAdd = (await widget.beforeAdd?.call()) ?? true;
    if (allowAdd) {
      try {
        final String filePath;
        if (kIsWeb) {
          final XFile f = (await ImagePicker().pickImage(source: ImageSource.gallery))!;
          filePath = f.path;
        } else {
          final List<AssetEntity>? assets = await AssetPicker.pickAssets(
            context,
            pickerConfig: const AssetPickerConfig(maxAssets: 1),
          );
          filePath = ((await assets?.first.originFile)?.path)!;
        }
        String? url;
        if (filePath != null) {
          if (widget.customRequest != null) {
            final _UploadImageStatus uploadStatus =
                _UploadImageStatus(filePath);
            _uploadingDataSource.add(uploadStatus);
            setState(() {});
            try {
              url = await widget.customRequest!(filePath,
                  builder: (double process) {
                uploadStatus.progress = process;
                setState(() {});
              });
              _uploadingDataSource.remove(uploadStatus);
            } catch (_) {
              _uploadingDataSource.remove(uploadStatus);
            }
            if (url == null || url == '') {
              setState(() {});
            }
          } else {
            url = filePath;
          }
        }
        setState(() {
          if ((url != null && url != '') && mounted) {
            _dataSource.add(url);
            widget.onChange?.call(_dataSource);
          }
        });
      } catch (e) {
        print("$e");
      }
    }
  }

  String _getTagText() {
    final int totalCount = widget.maxCount;
    final int length = _dataSource.length + 1;
    if (_dataSource.isEmpty) {
      return '0/$totalCount';
    } else {
      return '$length/$totalCount';
    }
  }
}

class _UploadImageStatus {
  _UploadImageStatus(this.originUrl);

  final String originUrl;
  double progress = 0;

  bool get isUploading => progress < 1;
}
