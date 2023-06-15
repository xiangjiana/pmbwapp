import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class HelpAllPostRespModel {
  HelpAllPostRespModel({
    required this.bookMarkList,
    required this.tutorContentList,
    required this.tutorNameList,
  });

  factory HelpAllPostRespModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<BookMarkList>? bookMarkList =
        jsonRes['bookMarkList'] is List ? <BookMarkList>[] : null;
    if (bookMarkList != null) {
      for (final dynamic item in jsonRes['bookMarkList']!) {
        if (item != null) {
          bookMarkList.add(BookMarkList.fromJson(
              asT<Map<String, dynamic>>("bookMarkList", item)!));
        }
      }
    }

    final List<TutorContentList>? tutorContentList =
        jsonRes['tutorContentList'] is List ? <TutorContentList>[] : null;
    if (tutorContentList != null) {
      for (final dynamic item in jsonRes['tutorContentList']!) {
        if (item != null) {
          tutorContentList.add(TutorContentList.fromJson(
              asT<Map<String, dynamic>>("tutorContentList", item)!));
        }
      }
    }

    final List<TutorNameList>? tutorNameList =
        jsonRes['tutorNameList'] is List ? <TutorNameList>[] : null;
    if (tutorNameList != null) {
      for (final dynamic item in jsonRes['tutorNameList']!) {
        if (item != null) {
          tutorNameList.add(TutorNameList.fromJson(
              asT<Map<String, dynamic>>("tutorNameList", item)!));
        }
      }
    }
    return HelpAllPostRespModel(
      bookMarkList: bookMarkList == null ? [] : bookMarkList,
      tutorContentList: tutorContentList == null ? [] : tutorContentList,
      tutorNameList: tutorNameList == null ? [] : tutorNameList,
    );
  }

  List<BookMarkList> bookMarkList;
  List<TutorContentList> tutorContentList;
  List<TutorNameList> tutorNameList;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bookMarkList': bookMarkList,
        'tutorContentList': tutorContentList,
        'tutorNameList': tutorNameList,
      };
}

class BookMarkList {
  BookMarkList({
    required this.bookmarkName,
    required this.bookmarkPicture,
    required this.bookmarkSort,
    required this.bookmarkStatus,
    required this.createdAt,
    required this.createdBy,
    required this.id,
    required this.merchantId,
    required this.tutorId,
    required this.updatedAt,
    required this.updatedBy,
  });

  factory BookMarkList.fromJson(Map<String, dynamic> jsonRes) => BookMarkList(
        bookmarkName: jsonRes['bookmarkName'] == null
            ? ''
            : asT<String>("bookmarkName", jsonRes['bookmarkName'])!,
        bookmarkPicture: jsonRes['bookmarkPicture'] == null
            ? ''
            : asT<String>("bookmarkPicture", jsonRes['bookmarkPicture'])!,
        bookmarkSort: jsonRes['bookmarkSort'] == null
            ? 0
            : asT<int>("bookmarkSort", jsonRes['bookmarkSort'])!,
        bookmarkStatus: jsonRes['bookmarkStatus'] == null
            ? 0
            : asT<int>("bookmarkStatus", jsonRes['bookmarkStatus'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        createdBy: jsonRes['createdBy'] == null
            ? ''
            : asT<String>("createdBy", jsonRes['createdBy'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
        tutorId: jsonRes['tutorId'] == null
            ? ''
            : asT<String>("tutorId", jsonRes['tutorId'])!,
        updatedAt: jsonRes['updatedAt'] == null
            ? ''
            : asT<String>("updatedAt", jsonRes['updatedAt'])!,
        updatedBy: jsonRes['updatedBy'] == null
            ? ''
            : asT<String>("updatedBy", jsonRes['updatedBy'])!,
      );

  String bookmarkName = '';
  String bookmarkPicture = '';
  int bookmarkSort = 0;
  int bookmarkStatus = 0;
  String createdAt = '';
  String createdBy = '';
  String id = '';
  String merchantId = '';
  String tutorId = '';
  String updatedAt = '';
  String updatedBy = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bookmarkName': bookmarkName,
        'bookmarkPicture': bookmarkPicture,
        'bookmarkSort': bookmarkSort,
        'bookmarkStatus': bookmarkStatus,
        'createdAt': createdAt,
        'createdBy': createdBy,
        'id': id,
        'merchantId': merchantId,
        'tutorId': tutorId,
        'updatedAt': updatedAt,
        'updatedBy': updatedBy,
      };
}

class TutorContentList {
  TutorContentList({
    required this.bookmarkId,
    required this.contentDesc,
    required this.contentName,
    required this.contentPicture,
    required this.contentSort,
    required this.contentStatus,
    required this.createdAt,
    required this.createdBy,
    required this.id,
    required this.merchantId,
    required this.tutorId,
    required this.updatedAt,
    required this.updatedBy,
  });

  factory TutorContentList.fromJson(Map<String, dynamic> jsonRes) =>
      TutorContentList(
        bookmarkId: jsonRes['bookmarkId'] == null
            ? ''
            : asT<String>("bookmarkId", jsonRes['bookmarkId'])!,
        contentDesc: jsonRes['contentDesc'] == null
            ? ''
            : asT<String>("contentDesc", jsonRes['contentDesc'])!,
        contentName: jsonRes['contentName'] == null
            ? ''
            : asT<String>("contentName", jsonRes['contentName'])!,
        contentPicture: jsonRes['contentPicture'] == null
            ? ''
            : asT<String>("contentPicture", jsonRes['contentPicture'])!,
        contentSort: jsonRes['contentSort'] == null
            ? 0
            : asT<int>("contentSort", jsonRes['contentSort'])!,
        contentStatus: jsonRes['contentStatus'] == null
            ? 0
            : asT<int>("contentStatus", jsonRes['contentStatus'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        createdBy: jsonRes['createdBy'] == null
            ? ''
            : asT<String>("createdBy", jsonRes['createdBy'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
        tutorId: jsonRes['tutorId'] == null
            ? ''
            : asT<String>("tutorId", jsonRes['tutorId'])!,
        updatedAt: jsonRes['updatedAt'] == null
            ? ''
            : asT<String>("updatedAt", jsonRes['updatedAt'])!,
        updatedBy: jsonRes['updatedBy'] == null
            ? ''
            : asT<String>("updatedBy", jsonRes['updatedBy'])!,
      );

  String bookmarkId = '';
  String contentDesc = '';
  String contentName = '';
  String contentPicture = '';
  int contentSort = 0;
  int contentStatus = 0;
  String createdAt = '';
  String createdBy = '';
  String id = '';
  String merchantId = '';
  String tutorId = '';
  String updatedAt = '';
  String updatedBy = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bookmarkId': bookmarkId,
        'contentDesc': contentDesc,
        'contentName': contentName,
        'contentPicture': contentPicture,
        'contentSort': contentSort,
        'contentStatus': contentStatus,
        'createdAt': createdAt,
        'createdBy': createdBy,
        'id': id,
        'merchantId': merchantId,
        'tutorId': tutorId,
        'updatedAt': updatedAt,
        'updatedBy': updatedBy,
      };
}

class TutorNameList {
  TutorNameList({
    required this.createdAt,
    required this.createdBy,
    required this.id,
    required this.merchantId,
    required this.tutorDescribe,
    required this.tutorName,
    required this.tutorPicture,
    required this.tutorSort,
    required this.tutorStatus,
    required this.updatedAt,
    required this.updatedBy,
  });

  factory TutorNameList.fromJson(Map<String, dynamic> jsonRes) => TutorNameList(
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        createdBy: jsonRes['createdBy'] == null
            ? ''
            : asT<String>("createdBy", jsonRes['createdBy'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
        tutorDescribe: jsonRes['tutorDescribe'] == null
            ? ''
            : asT<String>("tutorDescribe", jsonRes['tutorDescribe'])!,
        tutorName: jsonRes['tutorName'] == null
            ? ''
            : asT<String>("tutorName", jsonRes['tutorName'])!,
        tutorPicture: jsonRes['tutorPicture'] == null
            ? ''
            : asT<String>("tutorPicture", jsonRes['tutorPicture'])!,
        tutorSort: jsonRes['tutorSort'] == null
            ? 0
            : asT<int>("tutorSort", jsonRes['tutorSort'])!,
        tutorStatus: jsonRes['tutorStatus'] == null
            ? 0
            : asT<int>("tutorStatus", jsonRes['tutorStatus'])!,
        updatedAt: jsonRes['updatedAt'] == null
            ? ''
            : asT<String>("updatedAt", jsonRes['updatedAt'])!,
        updatedBy: jsonRes['updatedBy'] == null
            ? ''
            : asT<String>("updatedBy", jsonRes['updatedBy'])!,
      );

  String createdAt = '';
  String createdBy = '';
  String id = '';
  String merchantId = '';
  String tutorDescribe = '';
  String tutorName = '';
  String tutorPicture = '';
  int tutorSort = 0;
  int tutorStatus = 0;
  String updatedAt = '';
  String updatedBy = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'createdAt': createdAt,
        'createdBy': createdBy,
        'id': id,
        'merchantId': merchantId,
        'tutorDescribe': tutorDescribe,
        'tutorName': tutorName,
        'tutorPicture': tutorPicture,
        'tutorSort': tutorSort,
        'tutorStatus': tutorStatus,
        'updatedAt': updatedAt,
        'updatedBy': updatedBy,
      };
}
