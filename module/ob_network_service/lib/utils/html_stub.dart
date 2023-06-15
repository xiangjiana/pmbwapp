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
}