import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' if (dart.library.io) 'html_stub.dart' as html;
import 'dart:js' if (dart.library.io) 'js_stub.dart' as js;
import 'dart:typed_data';

class WebUtil {
  static final String scheme = 'obapp://';
  static final String sharingLink = 'obapp://page=sharinglink'; // 活动分享地址
  static final String deposit = 'obapp://page=deposit'; // 链接到存款页面
  static final String inviteRecord = 'obapp://page=inviterecord'; // 链接到活动记录页面
  static final String callBack = 'obapp://page=callback'; // 返回到我的页面
  static final String login = 'obapp://page=login'; // 重新登录页面
  static final String customService = 'obapp://page=customservice'; // 链接到客服
  static final String accountBank = 'obapp://page=account'; //  链接到绑定银行卡页面
  static final String bindPhone = 'obapp://page=bind_phone'; // 链接到绑定手机页面
  static final String goToVenue = 'obapp://page=goToVenue&v=ty'; // 跳转场馆 ty,zr,dj,cp,qp,dy,by



  //打开游戏H5页面
  static void openGameInApp(
    String url, {
    required String gameId,
    String title = "",
    String gameCode = "",
    String gameType = "",
    bool testify = false,
  }) {
    try {
      BaseX.instance.baseCallback?.WebUtil_openGameInApp(
        url,
        gameId: gameId,
        title: title,
        gameCode: gameCode,
        gameType: gameType,
        testify: testify,
      );
    } catch (e) {}
  }

  //打开游戏H5页面 跳Web 页面加载  gameCode 游戏类型不能为空 gameId 为空加载场馆 testify 区分接口
  static void openGameWebApp(
      {required String gameType, required String gameCode, String url = "", String gameId = "", String title = "", bool testify = false}) {
    if (Get.currentRoute == AppRoutes.GAME) {
      eventBus.fire(GameChangeEvent(title: title, gameCode: gameCode, gameId: gameId, testify: testify, gameType: gameType));
    } else {
      Get.toNamed(
        AppRoutes.GAME,
        arguments: {"title": title, "url": url, "gameType": gameType, "gameCode": gameCode, "gameId": gameId, "testify": testify},
      );
    }
  }

  //打开普通h5页面
  static void openInApp(
    String url, {
    String? title,
    bool showTitle = true,
    bool isHtml = false,
    bool hasLoading = false,
    bool showToolbar = true,
    bool openBrowser = false,
  }) {
    if (kIsWeb || openBrowser) {
      openInBrowser(url);
    } else {
      eventBus.fire(FloatBonusEvent(show: false));
      Get.toNamed(
        AppRoutes.WEB,
        arguments: {
          "showTitle": showTitle,
          "title": title,
          "url": url,
          "isHtml": isHtml,
          'hasLoading': Store.clientId == Store.clientIdDJ ? true : hasLoading,
          'showToolbar': showToolbar,
        },
        preventDuplicates: false,
      );
    }
  }

  static void jumpToOffice() {
    Get.toNamed(AppRoutes.h5DownloadPage);
  }

  static html.WindowBase? win;
  //用系统浏览器打开。直接调launch在web端的话一些浏览器打不开，这里做判断，web端调用window.open打开
  static void openInBrowser(String url) {
    if (kIsWeb) {
      if(win!=null){
        win!.location.href=url;
        win=null;
      }else{
        html.window.open(url, '_blank');
      }
    } else {
      launch(url);
    }
  }
  //判断是否safari浏览器
  static bool isSafari(){
    if(html.window.navigator.userAgent.toLowerCase().contains("safari")&&!html.window.navigator.userAgent.toLowerCase().contains("chrome")){
      return true;
    }
    return false;
  }
  //预先打开一个window，iOS safari浏览器回调时间太长会不允许打开，要根据请求时间做处理预先打开
  static windowPreOpen(){
    if(!kIsWeb||!GetPlatform.isIOS)return;
    win=html.window.open("about:blank", '_blank');
  }
  //关闭预先打开的window，登录游戏失败没有拿到url需要调用这个
  static windowClose(){
    if(win!=null){
      win!.close();
      win=null;
    }
  }
  //调用内嵌的iframe打开第三方网页，
  static void openInIframe(String url) {
    js.context.callMethod("sendMessage", [
      jsonEncode({"action": "openIframe", "url": url})
    ]);
  }

  static Future<String> parseLocalHtml(String filePath) async {
    String fileHtmlContents = await rootBundle.loadString(filePath);
    return Uri.dataFromString(fileHtmlContents, mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString();
  }

  static String urlAddParams(String url, {Map<String, dynamic>? params}) {
    Uri uri = Uri.parse(url);
    String queryString = "";
    String fragmentString = "";
    String returnUrl;
    if (uri.fragment != "") {
      fragmentString = "#" + uri.fragment;
    }
    if (params != null) {
      for (String key in params.keys) {
        queryString = queryString + key + "=" + params[key] + "&";
      }
      queryString = queryString.substring(0, queryString.length - 1);

      if (uri.query == "") {
        queryString = "?" + queryString;
      } else {
        queryString = "?" + uri.query + "&" + queryString;
      }

      returnUrl = uri.scheme + "://" + uri.authority + uri.path + queryString + fragmentString;
    } else {
      returnUrl =
          uri.scheme + "://" + uri.authority + uri.path + (uri.query == "" ? "" : "?" + uri.query) + fragmentString;
    }

    print("returnUrl  $returnUrl");
    return returnUrl;
  }

  static String getSessionStorage(String key) {
    return html.window.sessionStorage[key]!;
  }

  //获取网页域名地址 如https://app.test.zhanggao223.com
  static String getWebSiteOrigin() {
    return html.window.location.origin;
  }

  //web端bytes存文件
  static String bytes2file(bytes) {
    html.Blob blob = new html.Blob([bytes]);
    String path = html.Url.createObjectUrlFromBlob(blob);
    return path;
  }

  //web端文件路径转blob
  static file2blob(filePath) async {
    html.HttpRequest request = html.HttpRequest();
    request.responseType = 'blob';
    request.open("get", filePath);
    request.send();
    await request.onLoad.first;
    var heciBlob = request.response;
    return heciBlob;
  }

  //web端文件路径转uin8list
  static Future<Uint8List> file2uini8list(filePath) async {
    html.HttpRequest request = html.HttpRequest();
    request.responseType = 'blob';
    request.open("get", filePath);
    request.send();
    await request.onLoad.first;
    var heciBlob = request.response;
    html.FileReader fileReader = html.FileReader();
    fileReader.readAsArrayBuffer(heciBlob);
    await fileReader.onLoad.first;
    dynamic data = fileReader.result;
    return data;
  }

  static void saveImageByhttpAddress(String url) async {
    var aLink = html.window.document.createElement('a');
    aLink.attributes['download'] = url.substring(url.lastIndexOf("/") + 1);
    html.HttpRequest request = html.HttpRequest();
    request.responseType = 'blob';
    request.open("get", url);
    request.send();
    await request.onLoad.first;
    var blob = request.response;
    aLink.attributes['href'] = html.Url.createObjectUrl(blob);
    aLink.click();
    aLink.remove();
  }

  //调用web端方法复制内容到剪切板
  static void copyText2Clipboard(String text) {
    Future.delayed(const Duration(seconds: 0),(){
      html.InputElement input = html.InputElement();
      input.setAttribute('value', text);
      html.window.document.getElementsByTagName("body")[0].append(input);
      //iOS web的复制与Android不同，oppo vivo浏览器的复制直接用Clipboard.setData
      if (html.window.navigator.userAgent.contains("iPhone") || html.window.navigator.userAgent.contains("iPad")) {
        input.setSelectionRange(0, 9999);
      } else {
        input.select();
      }
      if(html.window.navigator.userAgent.toLowerCase().contains("vivobrowser")||html.window.navigator.userAgent.toLowerCase().contains("heytapbrowser")){
        html.window.document.execCommand('Cut');
      } else {
        input.setAttribute('readonly', 'readonly');
        html.window.document.execCommand('Copy');
      }
      input.remove();
    });
  }

}
