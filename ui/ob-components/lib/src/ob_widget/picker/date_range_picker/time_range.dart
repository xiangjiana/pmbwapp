///
class TimeRange {
  ///
  TimeRange(this.start, this.end);

  ///
  final String start;

  ///
  final String end;

  @override
  String toString() {
    return 'TimeRange{start: $start, end: $end}';
  }
}
