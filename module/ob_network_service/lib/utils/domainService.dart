import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:repository/backport/domain_factory.dart';
import 'package:repository/domain_pool/query_domain_task.dart';
import 'package:repository/gen/api/domainName_apis.dart';
import 'package:repository/gen/mod/domain_name_config_post_req_model.dart';
import 'package:repository/gen/mod/domain_name_config_post_resp_model.dart';
import 'package:sp_util/sp_util.dart';

import 'net_run_catch.dart';

class DomainService {
  static final DomainFactory domainFactory = DomainFactory();

  ///可修改为动态配置获取
  static String memberSld = '';
  static String launchSLd = '';
  static String cgwSld = '';
  static bool isUAT = false;
  static bool isBw = false;
  static int appId = -1;
  static const int bwX1AppId = 1000;

  static set setMemberSld(String value) {
    memberSld = value;
  }

  static set setLaunchSld(String value) {
    launchSLd = value;
  }

  static set setCgwSld(String value) {
    cgwSld = value;
  }

  static String apiType = 'prod';

  static set setApiType(String value) {
    apiType = value;
  }

  static String cgwKey = 'cgw_domain';
  static String memberKey = 'member_domain';
  static String launchKey = 'launch_domain';
  static String allKey = 'all_domain';

  static int checkNum = 1;

  static set setCheckNum(int value) {
    checkNum = value;
  }

  static List<String> memberSpList = [];
  static List<String> launchSpList = [];
  static List<String> cgwSpList = [];

  static Future<void> initDomain() async {
    if (kIsWeb) {
      return;
    }

    DomainFactory.dead.clear();
    cgwSpList.clear();
    memberSpList.clear();
    launchSpList.clear();

    List<String> cgwList;
    List<String> cgwListSp;
    List<String> memberList;
    List<String> memberListSp;
    List<String> launchList;
    List<String> launchListSp;
    if (apiType == 'prod') {
      if (DomainService.isBw) {
        if (appId == bwX1AppId) {
          cgwList = [
            'bwcgw.nriuqmci.com',
            'bwcgw.ubcikevf.com',
          ];
          memberList = [
            'bmember.vqnkjgvs.com',
            'bmember.rdpllhgo.com',
          ];
          launchList = [
            'blaunch.mohvdccs.com',
            'blaunch.lqhzwhdn.com',
          ];
        } else {
          cgwList = [
            'bwcgw.tbvprbkr.com',
            'bwcgw.xruoijih.com',
            'bwcgw.tdrijktl.com',
            'bwcgw.tdzjxnvu.com',
            'bwcgw.rmfclbbo.com'
          ];
          memberList = [
            'bmember.sjsweayr.com',
            'bmember.ulcbwhhb.com',
            'bmember.lgbjinyk.com',
            'bmember.mqttkgws.com',
            'bmember.sadpzwdv.com',
          ];
          launchList = [
            'blaunch.ixvzujgi.com',
            'blaunch.wuklapmt.com',
            'blaunch.mhimtyed.com',
            'blaunch.qcwodfcg.com',
            'blaunch.rqiridob.com',
          ];
        }
      } else {
        cgwList = [
          'cgw.on0i46ip.com',
          'cgw.ots8k922.com',
          'cgw.q0ke8fzc.com',
          'cgw.obl94hcu.com',
          'cgw.jzofjf27.com',
          'cgw.f3b9h1ae.com',
          'cgw.esqrh0zd.com',
        ];
        memberList = [
          'member.o6x73ocf.com',
          'member.o6w50jaq.com',
          'member.igy9pv6z.com',
          'member.h9ppbjzh.com',
          'member.xc6ooxv5.com',
          'member.nh7fbmzu.com',
          'member.g7o01n72.com',
        ];
        launchList = [
          'launch.81lmbydt.com',
          'launch.xoasrp0u.com',
          'launch.dnsov0ev.com',
          'launch.1vve24i9.com',
          'launch.52bv0g8a.com',
        ];
      }
    } else if (apiType == 'pre') {
      if (DomainService.isBw) {
        cgwList = ['bw-client-gateway.pre.zhanggao223.com'];
        memberList = ['bw-client-gateway.pre.zhanggao223.com'];
        launchList = ['bw-client-gateway.pre.zhanggao223.com'];
      } else {
        cgwList = [
          'cgw1.pre.x3zel2w4.com',
          'cgw2.pre.x3zel2w4.com',
          'cgw3.pre.x3zel2w4.com',
          'cgw4.pre.x3zel2w4.com',
          'cgw5.pre.x3zel2w4.com',
          'cgw6.pre.x3zel2w4.com',
          'cgw7.pre.x3zel2w4.com',
          'cgw8.pre.x3zel2w4.com',
          'cgw9.pre.x3zel2w4.com',
          'cgw10.pre.x3zel2w4.com',
        ];
        memberList = [
          'member1.pre.x3zel2w4.com',
          'member2.pre.x3zel2w4.com',
          'member3.pre.x3zel2w4.com',
          'member4.pre.x3zel2w4.com',
          'member5.pre.x3zel2w4.com',
          'member6.pre.x3zel2w4.com',
          'member7.pre.x3zel2w4.com',
          'member8.pre.x3zel2w4.com',
          'member9.pre.x3zel2w4.com',
          'member10.pre.x3zel2w4.com',
        ];
        launchList = [
          'luanch1.pre.x3zel2w4.com',
          'luanch2.pre.x3zel2w4.com',
          'luanch3.pre.x3zel2w4.com',
          'luanch4.pre.x3zel2w4.com',
          'luanch5.pre.x3zel2w4.com',
          'luanch6.pre.x3zel2w4.com',
          'luanch7.pre.x3zel2w4.com',
          'luanch8.pre.x3zel2w4.com',
          'luanch9.pre.x3zel2w4.com',
          'luanch10.pre.x3zel2w4.com',
        ];
      }
    } else if (apiType == 'test') {
      if (DomainService.isBw) {
        cgwList = [
          'bw-client-gateway.test.zhanggao223.com',
        ];
        memberList = [
          'bw-client-gateway.test.zhanggao223.com',
        ];
        launchList = [
          'bw-client-gateway.test.zhanggao223.com',
        ];
      } else {
        cgwList = [
          'cgw.test.v0l6syfy.com',
          'cgw.test.x3zel2w4.com',
          'cgw.test.fqphg427.com',
          'cgw.test.d6kjnex6.com',
          'cgw.test.zhanggao223.com',
        ];
        memberList = [
          'member.test.v0l6syfy.com',
          'member.test.x3zel2w4.com',
          'member.test.fqphg427.com',
          'member.test.d6kjnex6.com',
          'member.test.zhanggao223.com',
        ];
        launchList = [
          'launch.test.v0l6syfy.com',
          'launch.test.x3zel2w4.com',
          'launch.test.fqphg427.com',
          'launch.test.d6kjnex6.com',
          'launch.test.zhanggao223.com',
        ];
      }
    } else if (apiType == 'uat') {
      cgwList = [
        'cgw.r812ximv.com',
      ];
      memberList = [
        'member.jyky0igs.com',
      ];
      launchList = [
        'launch.9eqmifaa.com',
      ];
    } else {
      if (DomainService.isBw) {
        cgwList = ['bw-client-gateway.dev.zhanggao223.com'];
        memberList = ['bw-client-gateway.dev.zhanggao223.com'];
        launchList = ['bw-client-gateway.dev.zhanggao223.com'];
      } else {
        cgwList = [
          'client-gateway.dev.zhanggao223.com',
        ];
        memberList = [
          'client-gateway.dev.zhanggao223.com',
        ];
        launchList = [
          'client-gateway.dev.zhanggao223.com',
        ];
      }
    }
    if (DomainService.isUAT) {
      cgwSpList.addAll(cgwList);
      memberSpList.addAll(memberList);
      launchSpList.addAll(launchList);

      setMemberSld = memberSpList.first;
      setLaunchSld = launchSpList.first;
      setCgwSld = cgwSpList.first;
      return;
    }

    cgwListSp = SpUtil.getStringList(cgwKey) ?? <String>[];
    memberListSp = SpUtil.getStringList(memberKey) ?? <String>[];
    launchListSp = SpUtil.getStringList(launchKey) ?? <String>[];
    cgwList.insertAll(0, cgwListSp);
    memberList.insertAll(0, memberListSp);
    launchList.insertAll(0, launchListSp);

    cgwSpList.addAll(cgwList);
    cgwSpList.addAll(memberList);
    cgwSpList.addAll(launchList);

    memberSpList.addAll(memberList);
    memberSpList.addAll(cgwList);
    memberSpList.addAll(launchList);

    launchSpList.addAll(launchList);
    launchSpList.addAll(cgwList);
    launchSpList.addAll(memberList);

    cgwSpList = cgwSpList.toSet().toList();
    memberSpList = memberSpList.toSet().toList();
    launchSpList = launchSpList.toSet().toList();

    cgwSpList.addAll(cgwListSp);
    memberSpList.addAll(memberListSp);
    launchSpList.addAll(launchListSp);

    setMemberSld = memberSpList.first;
    setLaunchSld = launchSpList.first;
    setCgwSld = cgwSpList.first;
  }

  static void getNewDomainList() async {
    if (kIsWeb) {
      return;
    }

    ///检查域名不够用 请求后台数据
    await netRunCatch(() async {
      await _getMemberDomainList();
      await _getLaunchDomainList();
      await _getCgwDomainList();
    });
  }

  ///异步请求 获取member域名 1-activity、2-member、3-launch、4-其他
  static Future<void> _getMemberDomainList() async {
    var domainData = await _getTypeDomain(5, 2);
    var list = domainData.data.where((element) => element.domainStatus == 1).map((e) => e.address).toList();
    await SpUtil.putStringList(memberKey, list);
    memberSpList.addAll(list);
  }

  /// 异步请求 获取 launch 域名1-activity、2-member、3-launch、4-其他
  static Future<void> _getLaunchDomainList() async {
    var domainData = await _getTypeDomain(5, 3);
    var list = domainData.data.where((element) => element.domainStatus == 1).map((e) => e.address).toList();
    await SpUtil.putStringList(launchKey, list);
    launchSpList.addAll(list);
  }

  /// 异步请求 获取cgw 域名 域名1-activity、2-member、3-launch、4-其他
  static Future<void> _getCgwDomainList() async {
    var domainData = await _getTypeDomain(5, 4);
    var list = domainData.data.where((element) => element.domainStatus == 1).map((e) => e.address).toList();
    await SpUtil.putStringList(cgwKey, list);
    cgwSpList.addAll(list);
  }

  static Future<DomainNameConfigPostRespModel> _getTypeDomain(int number, bigType) {
    final completer = Completer<DomainNameConfigPostRespModel>();
    DomainNameApis.domainNameConfigPost(
      parameters: DomainNameConfigPostReqModel(number: number, bigType: bigType),
      success: (DomainNameConfigPostRespModel res) {
        completer.complete(res);
      },
      fail: (_) {},
    );
    return completer.future;
  }

  static void checkMember(String path) async {
    final taskMember = QueryDomainTask(failCallback: (String url) {});
    var taskList = <String>[];
    for (var i = 0; i < memberSpList.length; i++) {
      taskList.add('https://${memberSpList[i]}');
    }
    taskMember.start(taskList, path);
    try {
      final domain = await taskMember.checkAndAwait();
      debugPrint('可用member域名: $domain');
      setMemberSld = domain.substring(8);
    } on TimeoutException {
      checkMember(path);
    } on NoValidDomainException {
      debugPrint('未发现可用域名');
    }
  }

  static void checkLaunch(String path) async {
    final taskLaunch = QueryDomainTask(failCallback: (String url) {});
    var taskList = <String>[];

    for (var i = 0; i < launchSpList.length; i++) {
      taskList.add('https://${launchSpList[i]}');
    }
    taskLaunch.start(taskList, path);
    try {
      final domain = await taskLaunch.checkAndAwait();
      debugPrint('可用launch域名: $domain');
      setLaunchSld = domain.substring(8);
    } on TimeoutException {
      checkLaunch(path);
    } catch (e) {
      debugPrint('未发现可用域名');
    }
  }

  static void checkCgw(String path) async {
    final taskCgw = QueryDomainTask(failCallback: (String url) {});
    var taskList = <String>[];

    for (var i = 0; i < cgwSpList.length; i++) {
      taskList.add('https://${cgwSpList[i]}');
    }

    taskCgw.start(taskList, path);
    try {
      final domain = await taskCgw.checkAndAwait();
      debugPrint('可用cgw域名: $domain');
      setCgwSld = domain.substring(8);
    } on TimeoutException {
      checkCgw(path);
    } catch (e) {
      debugPrint('未发现可用域名');
    }
  }
}
