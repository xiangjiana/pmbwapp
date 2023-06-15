class PageResponse<T> {
  final int pageNum;
  final int pageSize;
  late  List<T> record;
  final int totalPage;
  final int totalRecord;

  PageResponse(this.pageNum, this.pageSize, this.record, this.totalPage,
      this.totalRecord);

  PageResponse<T> copyWith({
    int? pageNum,
    int? pageSize,
    List<T>? record,
    int? totalPage,
    int? totalRecord,
  }) {
    if ((pageNum == null || identical(pageNum, this.pageNum)) &&
        (pageSize == null || identical(pageSize, this.pageSize)) &&
        (record == null || identical(record, this.record)) &&
        (totalPage == null || identical(totalPage, this.totalPage)) &&
        (totalRecord == null || identical(totalRecord, this.totalRecord))) {
      return this;
    }

    return PageResponse<T>(
      pageNum ?? this.pageNum,
      pageSize ?? this.pageSize,
      record ?? this.record,
      totalPage ?? this.totalPage,
      totalRecord ?? this.totalRecord,
    );
  }
}
