import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:repository/utils/domainService.dart';
import 'package:repository/utils/net.dart';
import 'package:sp_util/sp_util.dart';

class EvnSelectButton extends StatelessWidget {
  const EvnSelectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        "modify_env".tr,
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () async {
        List<String> envs = [
          "QA",
          "DEV",
          "env_pre".tr,
        ];
        final index = await Get.picker(
            children: List.generate(
          envs.length,
          (index) => Center(
            child: Text(
              envs[index],
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ));

        if (index == 0) {
          Net().apiTypeSet = 'test';
          DomainService.setApiType = 'test';
          Net().dio.options.baseUrl =
              "https://member.test.zhanggao223.com/client-gateway/";
          DomainService.cgwSpList = [
            'cgw.o2ohua.com',
            'cgw.o2ohua121.com',
            'cgw.o2ohua222.com',
            'cgw.o2ohua555.com',
            'cgw.o2ohua454.com',
            'cgw.o2ohua847.com',
            'cgw.o2ohua844.com',
            'cgw.o2ohua844.com',
            'cgw.test.com',
            'cgw.test.zhanggao223.com',
            'cgw.test.d6kjnex6.com',
            //'test.com',
          ];
          DomainService.memberSpList = [
            'member.o2ohua.com',
            'member.o2ohua121.com',
            'member.o2ohua222.com',
            'member.o2ohua555.com',
            'member.o2ohua454.com',
            'member.o2ohua847.com',
            'member.o2ohua844.com',
            'member.o2ohua844.com',
            'member.test.com',
            'member.test.d6kjnex6.com',
            'member.test1.com',
            'member.test.zhanggao223.com',
            //'test.com',
          ];
          DomainService.launchSpList = [
            'launch.o2ohua.com',
            'launch.o2ohua121.com',
            'launch.o2ohua222.com',
            'launch.o2ohua555.com',
            'launch.o2ohua454.com',
            'launch.o2ohua847.com',
            'launch.o2ohua844.com',
            'launch.test.com',
            'launch.test.d6kjnex6.com',
            'launch.test1.com',
            'launch.test.zhanggao223.com',
            //'test.com',
          ];
          SpUtil.remove(DomainService.allKey);
          SpUtil.remove(DomainService.memberKey);
          SpUtil.remove(DomainService.launchKey);
          SpUtil.remove(DomainService.cgwKey);
          DomainService.launchSpList.clear();
          DomainService.memberSpList.clear();
          DomainService.cgwSpList.clear();

          ///预埋域名
          await DomainService.initDomain();
        } else if (index == 1) {
          Net().apiTypeSet = 'dev';

          DomainService.setApiType = 'dev';
          Net().dio.options.baseUrl =
              "https://client-gateway.dev.zhanggao223.com/client-gateway";
        } else if (index == 2) {
          Net().apiTypeSet = 'prod';
          DomainService.setApiType = 'prod';
          Net().dio.options.baseUrl =
              "https://member.igy9pv6z.com/client-gateway/";
          SpUtil.remove(DomainService.allKey);
          SpUtil.remove(DomainService.memberKey);
          SpUtil.remove(DomainService.launchKey);
          SpUtil.remove(DomainService.cgwKey);
          DomainService.launchSpList.clear();
          DomainService.memberSpList.clear();
          DomainService.cgwSpList.clear();
          ///检测初始域名是否可用
          ///DomainService.checkDomain();

          ///预埋域名
          await DomainService.initDomain();
        } else {
          Net().apiTypeSet = 'test';
          DomainService.setApiType = 'test';
          Net().dio.options.baseUrl =
              "https://member.test.zhanggao223.com/client-gateway/";
          DomainService.cgwSpList = [
            'cgw.o2ohua.com',
            'cgw.o2ohua121.com',
            'cgw.o2ohua222.com',
            'cgw.o2ohua555.com',
            'cgw.o2ohua454.com',
            'cgw.o2ohua847.com',
            'cgw.o2ohua844.com',
            'cgw.o2ohua844.com',
            'cgw.test.com',
            'cgw.test.zhanggao223.com',
            'cgw.test.d6kjnex6.com',
            //'test.com',
          ];
          DomainService.memberSpList = [
            'member.o2ohua.com',
            'member.o2ohua121.com',
            'member.o2ohua222.com',
            'member.o2ohua555.com',
            'member.o2ohua454.com',
            'member.o2ohua847.com',
            'member.o2ohua844.com',
            'member.o2ohua844.com',
            'member.test.com',
            'member.test.d6kjnex6.com',
            'member.test1.com',
            'member.test.zhanggao223.com',
            //'test.com',
          ];
          DomainService.launchSpList = [
            'launch.o2ohua.com',
            'launch.o2ohua121.com',
            'launch.o2ohua222.com',
            'launch.o2ohua555.com',
            'launch.o2ohua454.com',
            'launch.o2ohua847.com',
            'launch.o2ohua844.com',
            'launch.test.com',
            'launch.test.d6kjnex6.com',
            'launch.test1.com',
            'launch.test.zhanggao223.com',
            //'test.com',
          ];
          SpUtil.remove(DomainService.allKey);
          SpUtil.remove(DomainService.memberKey);
          SpUtil.remove(DomainService.launchKey);
          SpUtil.remove(DomainService.cgwKey);
          DomainService.launchSpList.clear();
          DomainService.memberSpList.clear();
          DomainService.cgwSpList.clear();
          ///检测初始域名是否可用
          ///DomainService.checkDomain();

          ///预埋域名
          await DomainService.initDomain();
        }

        showToast('env_current'.tr+" ${envs}\n${Net().dio.options.baseUrl}");

        Get.back();
      },
    );
  }
}
