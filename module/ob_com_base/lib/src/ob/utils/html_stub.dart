//用于避免引入dart.html引起的build apk等报错
class HttpRequest {
  late String responseType,response;
  open(String url,String path){}
  send(){}
  late Stream onLoad;
}
class FileReader {
  late String result;
  readAsArrayBuffer(args){}
  late Stream onLoad;
}
class Blob {
  Blob(List args){}
}
class Url {
  static createObjectUrlFromBlob(args){}
  static createObjectUrl(args){}
}
class Body {
  appendChild(args){}
}
class WindowBase {
  late WindowBaseLocation location;
  close(){}
}
class WindowBaseLocation{
  String? href;
}
class Navigator {
  bool? onLine;
  String userAgent="";
  String language="";
}
class window{
  static Document document=Document();
  static Location location=Location();
  static open(String url, String name, [String? options]){}
  static Navigator navigator = Navigator();
  static late Map sessionStorage;
}
class Document{
  Body body=Body();
  getElementsByTagName(String tagName){}
  execCommand(String cmd){}
  createElement(args){}
  getElementsByName(args){}
}
class InputElement{
  setAttribute(String name,String value){}
  select(){}
  remove(){}
  setSelectionRange(start,end){}
}
class Location{
  late String origin;
}
