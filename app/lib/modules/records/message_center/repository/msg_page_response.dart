import 'package:ob_com_base/ob_com_base.dart';
class MsgPageResponse<T> extends PageResponse<T> {
  final int count;

  MsgPageResponse(int pageNum, int pageSize, List<T> record, int totalPage,
  int totalRecord,this.count):super(pageNum,pageSize,record,totalPage,totalRecord);

  MsgPageResponse<T> copyWith({
    int? pageNum,
    int? pageSize,
    List<T>? record,
    int? totalPage,
    int? totalRecord,
    int? count,
  }) {
    if ((pageNum == null || identical(pageNum, this.pageNum)) &&
        (pageSize == null || identical(pageSize, this.pageSize)) &&
        (record == null || identical(record, this.record)) &&
        (totalPage == null || identical(totalPage, this.totalPage)) &&
        (totalRecord == null || identical(totalRecord, this.totalRecord)) &&
        (count == null || identical(count, this.count))) {
      return this;
    }

    return MsgPageResponse<T>(
      pageNum ?? this.pageNum,
      pageSize ?? this.pageSize,
      record ?? this.record,
      totalPage ?? this.totalPage,
      totalRecord ?? this.totalRecord,
      count ?? this.count,
    );
  }
}
