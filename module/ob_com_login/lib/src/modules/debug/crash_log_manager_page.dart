import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:get/get.dart';
import 'crash_log_manager.dart';
import 'log_detail.dart';

class CrashLogManagerPage extends StatefulWidget {
  @override
  _CrashLogManagerPageState createState() => _CrashLogManagerPageState();
}

class _CrashLogManagerPageState extends State<CrashLogManagerPage> {
  List<File> files = [];
  List<String> fileLengths = [];

  @override
  void initState() {
    super.initState();
    initFiles();
  }

  void initFiles() async {
    if (Constants.crashLogDirPath == null) {
      await CrashLogManager.initCrashFile();
    }
    files.clear();
    fileLengths.clear();
    Directory directory = Directory(Constants.crashLogDirPath!);
    List<FileSystemEntity> fileSystemEntities = directory.listSync();
    fileSystemEntities.forEach((element) async {
      files.add(File(element.path));
      int length = File(element.path).lengthSync();
      String sizeString = "";
      if (length > 1000 * 1000) {
        sizeString = "${(length / 1000.0 / 1000.0).toStringAsFixed(2)}MB";
      } else if (length > 1000) {
        sizeString = "${(length / 1000.0).toStringAsFixed(2)}KB";
      } else {
        sizeString = "${length}B";
      }
      fileLengths.add(sizeString);
    });
    print("files  ${files.length}");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ObTitleBar(title: "crash_log_manage".tr),
          // Container(
          //   color: Colors.white,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Checkbox(
          //           value: Constants.writeCrashLog,
          //           onChanged: (bool? open) async {
          //             Constants.writeCrashLog = open ?? false;
          //             SpUtil.putBool(Constants.writeCrashLogEnable,
          //                 Constants.writeCrashLog);
          //             setState(() {});
          //             DateTime dateTime = DateTime.now();
          //             File file = File(Constants.crashLogDirPath! +
          //                 "/${dateTime.year}${dateTime.month}${dateTime.day}.txt");
          //             if (!file.existsSync()) {
          //               file.createSync();
          //               initFiles();
          //               setState(() {});
          //             }
          //           }),
          //       Container(
          //         margin: EdgeInsets.only(left: 10.w),
          //         child: Text(
          //           "日志开关",
          //           style: TextStyle(height: 1, color: Colors.black),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return getItemHeader();
                }
                String fileName = files[index - 1]
                    .path
                    .substring(files[index - 1].path.lastIndexOf("/") + 1);

                return getItem(fileName, fileLengths[index - 1], () async {
                  Get.to(LogDetail(await files[index - 1].readAsString(),
                      files[index - 1].path));
                }, () async {
                  files[index - 1].deleteSync();
                  files.removeAt(index - 1);
                  setState(() {});
                });
              },
              itemCount: files.length + 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget getItem(String fileName, String fileSize, Function() onLookPress,
      Function() onDeletePress) {
    return Container(
      height: 40.w,
      color: Colors.grey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Center(
                  child:
                  Text(fileName, style: TextStyle(color: Colors.white)))),
          Expanded(
              child: Center(
                  child:
                  Text(fileSize, style: TextStyle(color: Colors.white)))),
          Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
                child: ElevatedButton(
                  onPressed: onLookPress,
                  child: Center(
                      child: Text(
                        "view".tr,
                        style: TextStyle(color: Colors.black),
                      )),
                ),
              )),
          Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
                child: ElevatedButton(
                  onPressed: onDeletePress,
                  child: Center(
                      child: Text(
                        "delete".tr,
                        style: TextStyle(color: Colors.black),
                      )),
                ),
              )),
        ],
      ),
    );
  }

  Widget getItemHeader() {
    return Container(
      color: Colors.white,
      height: 30.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Center(child: Text("file_name".tr))),
          Expanded(child: Center(child: Text("file_size".tr))),
          Expanded(child: Text("")),
          Expanded(child: Text("")),
        ],
      ),
    );
  }
}
