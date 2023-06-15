import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';

@immutable
class LogDetail extends StatelessWidget {
  final String content;
  final String path;
  LogDetail(this.content, this.path);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      body: Column(
        children: [
          ObTitleBar(title: "log_detail".tr),
          Expanded(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Text(
                  "log_file_path".tr+":$path\n" + content,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
