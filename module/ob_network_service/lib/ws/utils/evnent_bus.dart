import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';

class EventBusUtil {
  static EventBus eventBus = EventBus();

  //处理正常数据的事件派发
  static void dispatch(int id, String data) {
    switch (id) {
      case -666:
        break;
      case -10000:
        // 错误监听
        break;
      case 1:
        // 心跳
        break;
      case 201:
        // 真人推荐桌台
        debugPrint('真人来数据了');
        break;
      case 202:
        // 彩票长龙数据
        break;
      case 203:
        // 商户后台新增公共/活动/通知主动推送到APP
        break;
      case 204:
        // 提款审核一审
        break;
      case 205:
        // 提款审核二审
        break;
      case 206:
        // 提款审核三审
        break;
      case 207:
        // 提款审核出款审核
        break;
      case 208:
        // 提款审核出款
        break;
      case 209:
        // 消息通知
        break;
      case 210:
        // 活动消息通知
        break;
      case 211:
        // 后台对公告进行开启、禁用操作
        break;
      case 212:
        break;
      case 213:
        break;
      case 214:
        break;
      case 215:
        break;
      case 216:
        break;
      case 217:
        break;
      case 218:
        break;
      case 219:
        break;
      case 220:
        break;
      case 221:
        break;
      case 222:
        break;
      case 223:
        break;
      case 224:
        break;
      case 225:
        break;
    }
  }
}
