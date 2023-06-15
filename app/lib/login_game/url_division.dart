import 'package:common_utils/common_utils.dart';

class UrlDivision {
  late String domainName;
  late Map<String, String>? param;
  late String entireUrl;
  late int type;

  UrlDivision(
      {this.domainName = "", this.param, this.entireUrl = "", this.type = 0});

  factory UrlDivision.sports(String url, int types) {
    String domains = "";
    Map<String, String> params = Map<String, String>();

    try {
      if (url.isEmpty) {
        return UrlDivision();
      }
      if (!RegexUtil.isURL(url)) {
        return UrlDivision();
      }
      final subStr = url.split('\/?');
      if (subStr.length >= 2) {
        domains = subStr[0];
        params = Uri.splitQueryString(subStr[1]);
      }
    } catch (e) {
      // print("url-->解析失败");
    }
    return UrlDivision(domainName: domains, param: params, type: types);
  }

  factory UrlDivision.esports(String url, int types) {
    String domains = "";
    Map<String, String> params = Map<String, String>();
    try {
      if (url.isEmpty) {
        return UrlDivision();
      }
      if (!RegexUtil.isURL(url)) {
        return UrlDivision();
      }
      final subStr = url.split('?');
      if (subStr.length >= 2) {
        domains = subStr[0];
        params = Uri.splitQueryString(subStr[1]);
      }
    } catch (e) {
      // print("url-->解析失败");
    }
    return UrlDivision(domainName: domains, param: params, type: types);
  }

  factory UrlDivision.zrTable(String url, int types) {
    String domains = "";
    Map<String, String> params = Map<String, String>();
    try {
      if (url.isEmpty) {
        return UrlDivision();
      }
      if (!RegexUtil.isURL(url)) {
        return UrlDivision();
      }
      final subStr = url.split('\/?');
      if (subStr.length >= 2) {
        domains = subStr[0];
        params = Uri.splitQueryString(subStr[1]);
      }
    } catch (e) {
      // print("url-->解析失败");
    }
    return UrlDivision(domainName: domains, param: params, type: types);
  }

  factory UrlDivision.qpTable(String url, int types) {
    String domains = "";
    Map<String, String> params = Map<String, String>();
    try {
      if (url.isEmpty) {
        return UrlDivision();
      }
      if (!RegexUtil.isURL(url)) {
        return UrlDivision();
      }
      final subStr = url.split('?');
      if (subStr.length >= 2) {
        domains = subStr[0];
        params = Uri.splitQueryString(subStr[1]);
      }
    } catch (e) {
      // print("url-->解析失败");
    }
    return UrlDivision(domainName: domains, param: params, type: types);
  }

  //替换url参数
  factory UrlDivision.urlChange(UrlDivision urlData, String gameCode, String gameId) {
    switch (gameCode) {
      case 'ty':
        urlData.param!['mid'] = gameId;
        StringBuffer buffer = StringBuffer();
        buffer.write(urlData.domainName + "/?");
        urlData.param!.forEach((key, value) {
          buffer.write(key + "=" + value + "&");
        });
        urlData.entireUrl = buffer.toString().substring(0, buffer.length - 1);
        break;
      case 'dj':
        int index = urlData.domainName.lastIndexOf('/');
        var domain = urlData.domainName.substring(0, index);
        StringBuffer buffer = StringBuffer();
        buffer.write(domain + "/" + gameId + "?");
        urlData.param!.forEach((key, value) {
          buffer.write(key + "=" + value + "&");
        });
        urlData.entireUrl = buffer.toString().substring(0, buffer.length - 1);
        break;
    }

    return urlData;
  }
}
