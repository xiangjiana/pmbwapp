import 'ping_status.dart';

class PingData {
  final String domain;
  final String pinUrl;
  final PingStatus status;
  final Duration duration;

  PingData(this.domain, this.pinUrl, this.status, this.duration);

  @override
  String toString() {
    return 'PingData{domain: $domain,pingUtl:$pinUrl status: $status, duration: $duration}';
  }
}
