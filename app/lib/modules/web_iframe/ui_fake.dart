import 'dart:async';

class platformViewRegistry {
  static void registerViewFactory(String viewId, dynamic cb) {}
}

class IFrameElement {
  set src(String value) => value;
  set allow(String value) => value;
  set allowFullscreen(bool value) => value;

  Style get style => Style();
  late String id;
  addEventListener(String name,Function callback){}
}

class Style {
  set border(String value) => value;
  late String animation;
  late String opacity;
  late String animationFillMode;
  late String width;
  late String height;
  late String animationName;
  late String animationDuration;
  late String animationDelay;
}

class window {
  static Listen get onMessage => Listen();
}

class Listen {
  StreamSubscription? listen(Function cb) {
    return null;
  }
}

class context {
  static void callMethod(String text, List<String> list) {}
}
