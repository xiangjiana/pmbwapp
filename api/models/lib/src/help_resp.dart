import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class HelpResp {
  HelpResp({
    bookMarkList,
    tutorContentList,
    tutorNameList,
  }){
    this.bookMarkList = bookMarkList.cast<BookMark>();
    this.tutorContentList = tutorContentList.cast<TutorContent>();
    this.tutorNameList = tutorNameList.cast<TutorName>();
  }

  late final List<BookMark> bookMarkList;
  late final List<TutorContent> tutorContentList;
  late final List<TutorName> tutorNameList;
}

@jsonSerializable
class BookMark {
  BookMark({
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

  final String bookmarkName;
  final String bookmarkPicture;
  final int bookmarkSort;
  final int bookmarkStatus;
  final String createdAt;
  final String createdBy;
  final String id;
  final String merchantId;
  final String tutorId;
  final String updatedAt;
  final String updatedBy;
}

@jsonSerializable
class TutorContent {
  TutorContent({
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

  final String bookmarkId;
  final String contentDesc;
  final String contentName;
  final String contentPicture;
  final int contentSort;
  final int contentStatus;
  final String createdAt;
  final String createdBy;
  final String id;
  final String merchantId;
  final String tutorId;
  final String updatedAt;
  final String updatedBy;
}

@jsonSerializable
class TutorName {
  TutorName({
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

  final String createdAt;

  final String createdBy;
  final String id;
  final String merchantId;
  final String tutorDescribe;
  final String tutorName;
  final String tutorPicture;
  final int tutorSort;
  final int tutorStatus;
  final String updatedAt;
  final String updatedBy;
}
