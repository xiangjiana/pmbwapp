import 'dart:async';

import 'package:rxdart/subjects.dart';

class Bus {
  final _subject = PublishSubject<BusEvent>();
  static Bus? _instance;

  Bus._();

  static Bus get instance => _instance ??= Bus._();

  void fire(int id, {dynamic data, dynamic data2, dynamic data3}) {
    _subject.add(BusEvent(id, data, data2, data3));
  }

  StreamSubscription<BusEvent> subscribe(
    void Function(BusEvent event)? onData, {
    Function? onError,
  }) {
    return _subject.listen(onData, onError: onError);
  }
}

class BusEvent {
  final int id;
  final dynamic data;
  final dynamic data2;
  final dynamic data3;

  const BusEvent(this.id, this.data, this.data2, this.data3);
}
