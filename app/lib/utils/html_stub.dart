//用于避免引入dart.html引起的build apk等报错
class HttpRequest {
  late String responseType, response;
  open(String url, String path) {}
  send() {}
  late Stream onLoad;
}

class FileReader {
  late String result;
  readAsArrayBuffer(args) {}
  late Stream onLoad;
}

class Blob {
  Blob(List args) {}
}

class Url {
  static createObjectUrlFromBlob(args) {}
}

class Navigator {
  bool? onLine;
  String userAgent="";
}
class SessionStorage {
}

class window {
  static Navigator navigator = Navigator();
  static Document document = Document();
  static Map sessionStorage = {};
  static Location location = Location();
  static open(String url, String name, [String? options]) {}
  static void addEventListener(type, listener, [bool? useCapture]) {}
}

class Document {
  getElementsByTagName(String tagName) {}
  execCommand(String cmd) {}
}

class InputElement {
  setAttribute(String name, String value) {}
  select() {}
  remove() {}
  setSelectionRange(start,end) {}
}

class Body {}

class Location {
  late String origin;
}
