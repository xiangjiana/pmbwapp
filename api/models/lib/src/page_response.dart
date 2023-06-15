import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:models/models.dart';
import 'package:models/src/bw_message_announcement.dart';
import 'package:models/src/bw_message_bonus_detail.dart';
import 'package:models/src/bw_message_notice_detail.dart';
import 'package:models/src/deposit_details.dart';
import 'package:models/src/feedback.dart';
import 'package:models/src/member_account_recording.dart';
import 'package:models/src/member_deposit_recording.dart';
import 'package:models/src/member_withdrawal_recording.dart';

@jsonSerializable
class PageResponse<T> {
  final int pageNum;
  final int pageSize;
  final List<T> record;
  final int totalPage;
  final int totalRecord;
  final Map<String, dynamic>? summary;

  PageResponse(this.pageNum, this.pageSize, this.record, this.totalPage,
      this.totalRecord,
      {this.summary});

  PageResponse<T> copyWith({
    int? pageNum,
    int? pageSize,
    List<T>? record,
    int? totalPage,
    int? totalRecord,
    Map<String, dynamic>? summary,
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
      summary: summary ?? this.summary,
    );
  }
}

@jsonSerializable
class BwMessageAnnouncementPageResponse
    extends PageResponse<BwMessageAnnouncement> {
  BwMessageAnnouncementPageResponse(
      int pageNum,
      int pageSize,
      List<BwMessageAnnouncement> record,
      int totalPage,
      int totalRecord,
      Map<String, dynamic> summary)
      : super(pageNum, pageSize, record, totalPage, totalRecord,
            summary: summary);
}

@jsonSerializable
class BwMessageBonusDetailPageResponse
    extends PageResponse<BwMessageBonusDetail> {
  BwMessageBonusDetailPageResponse(
      int pageNum,
      int pageSize,
      List<BwMessageBonusDetail> record,
      int totalPage,
      int totalRecord,
      Map<String, dynamic> summary)
      : super(pageNum, pageSize, record, totalPage, totalRecord,
            summary: summary);
}

@jsonSerializable
class BwMessageNoticeDetailPageResponse
    extends PageResponse<BwMessageNoticeDetail> {
  BwMessageNoticeDetailPageResponse(
    int pageNum,
    int pageSize,
    List<BwMessageNoticeDetail> record,
    int totalPage,
    int totalRecord,
    Map<String, dynamic>? summary,
  ) : super(pageNum, pageSize, record, totalPage, totalRecord,
            summary: summary);
}

@jsonSerializable
class DepositDetailsPageResponse extends PageResponse<DepositDetails> {
  DepositDetailsPageResponse(int pageNum, int pageSize,
      List<DepositDetails> record, int totalPage, int totalRecord)
      : super(pageNum, pageSize, record, totalPage, totalRecord);
}

@jsonSerializable
class MemberDepositRecordingPageResponse
    extends PageResponse<MemberDepositRecording> {
  MemberDepositRecordingPageResponse(int pageNum, int pageSize,
      List<MemberDepositRecording> record, int totalPage, int totalRecord)
      : super(pageNum, pageSize, record, totalPage, totalRecord);
}

@jsonSerializable
class MemberAccountRecordingPageResponse
    extends PageResponse<MemberAccountRecording> {
  MemberAccountRecordingPageResponse(int pageNum, int pageSize,
      List<MemberAccountRecording> record, int totalPage, int totalRecord)
      : super(pageNum, pageSize, record, totalPage, totalRecord);
}

@jsonSerializable
class MemberWithdrawalRecordingPageResponse
    extends PageResponse<MemberWithdrawalRecording> {
  MemberWithdrawalRecordingPageResponse(int pageNum, int pageSize,
      List<MemberWithdrawalRecording> record, int totalPage, int totalRecord)
      : super(pageNum, pageSize, record, totalPage, totalRecord);
}

@jsonSerializable
class FeedbackPageResponse extends PageResponse<Feedback> {
  FeedbackPageResponse(int pageNum, int pageSize, List<Feedback> record,
      int totalPage, int totalRecord)
      : super(pageNum, pageSize, record, totalPage, totalRecord);
}

@jsonSerializable
class VenueDyPcPageResponse extends PageResponse<ConfigGameNew> {
  VenueDyPcPageResponse(
      int pageNum, int pageSize, List<ConfigGameNew> record, int totalPage, int totalRecord)
      : super(pageNum, pageSize, record, totalPage, totalRecord);
}
