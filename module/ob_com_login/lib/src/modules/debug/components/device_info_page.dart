import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:repository/utils/sqlite_service.dart';
import 'package:sp_util/sp_util.dart';

import '../crash_log_manager.dart';

class DeviceInfoPage extends StatefulWidget {
  @override
  _DeviceInfoPageState createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  List<Widget> widgets = <Widget>[];
  String info = "";
  @override
  void initState() {
    super.initState();
    getDeviceInfo();
  }

  void getDeviceInfo() async {
    if (!kIsWeb) {
      Map<String, dynamic> map = await CrashLogManager.initPlatformState();
      map.keys.forEach((String element) {
        widgets.add(getRow(element.replaceAll("\n", ""), map[element]));
        info += "${element.replaceAll("\n", "")}:${map[element]}\n";
      });
      widgets.add(getRow("sentryId", SpUtil.getString("sentryId", defValue: "") ?? ''));
      info += "sentryId:${SpUtil.getString("sentryId", defValue: "")}";
      widgets.add(getRow("db_path", NetCache.db.path)); //sqlite存储

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      body: Column(
        children: <Widget>[
          ObTitleBar(
            title: "device_info".tr,
            actions: [
              Container(
                margin: EdgeInsets.only(right: 15),
                child: GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(text: info));
                    showToast("copy_successfully".tr);
                  },
                  child: Text(
                    "copy".tr,
                    style: TextStyle(fontSize: 16, color: Colors.white, height: 1),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: widgets,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getRow(String label, String text) {
    Widget row = Container(
      margin: EdgeInsets.symmetric(vertical: 5.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Text(
            label,
            style: TextStyle(fontSize: 14, color: Colors.white, height: 1),
          )),
          Expanded(
              child: Text(
            text,
            style: TextStyle(fontSize: 14, color: Colors.white, height: 1),
          )),
        ],
      ),
    );
    return row;
  }
}
