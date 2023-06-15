import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:sp_util/sp_util.dart';

class ProxySetPage extends StatefulWidget {
  @override
  _ProxySetPageState createState() => _ProxySetPageState();
}

class _ProxySetPageState extends State<ProxySetPage> {
  bool? open;
  TextEditingController ipController =
      TextEditingController(text: SpUtil.getString("proxyIp", defValue: ""));
  TextEditingController portController = TextEditingController(
      text: SpUtil.getString("proxyPort", defValue: "8888"));
  @override
  void initState() {
    super.initState();
    open = SpUtil.getBool("setProxy", defValue: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ObTitleBar(title: "delegate_settings".tr),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                          value: open ?? false,
                          onChanged: (bool? b) {
                            open = b;
                            SpUtil.putBool("setProxy", open ?? false);
                            if (open ?? false) {
                              SpUtil.putString("proxyIp", ipController.text);
                              SpUtil.putString(
                                  "proxyPort", portController.text);
                            } else {
                              SpUtil.putString("proxyIp", "");
                              SpUtil.putString("proxyPort", "8888");
                            }
                            setState(() {});
                          }),
                      Text(
                        "delegate_need_restart_after_modify".tr,
                        style: TextStyle(
                          color: Colors.black,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "plz_enter_ip".tr,
                            style: TextStyle(
                                color: Colors.black, height: 1, fontSize: 18),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.visiblePassword,
                          style: TextStyle(color: Colors.black),
                          controller: ipController,
                          decoration: InputDecoration(
                              isDense: false,
                              contentPadding: EdgeInsets.zero,
                              hintText: "127.0.0.1",
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                              border: UnderlineInputBorder()),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "plz_enter_ip_port".tr,
                            style: TextStyle(
                                color: Colors.black, height: 1, fontSize: 18),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          cursorColor: Colors.black,
                          controller: portController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            isDense: false,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
