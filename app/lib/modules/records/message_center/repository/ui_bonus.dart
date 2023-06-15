import 'package:ob_package/modules/records/message_center/member_message_controller.dart';

class UiBonus {
  final double billAmount;
  final double bonusAmount;
  final String title;
  final String content;
  final Mode mode;
  final bool selected;
  final bool isCollected;
  final int status;
  final String createdAt;
  final String iconUrl;
  final String businessId;
  final int type;
  final String id;
  final String businessTime;
  final String remark;

  UiBonus(
    this.billAmount,
    this.bonusAmount,
    this.title,
    this.content,
    this.mode,
    this.isCollected,
    this.status,
    this.createdAt,
    this.iconUrl,
    this.selected,
    this.businessId,
    this.type,
    this.id,
    this.businessTime,
    this.remark,
  );

  UiBonus copyWith({
    double? billAmount,
    double? bonusAmount,
    String? title,
    String? content,
    Mode? mode,
    bool? selected,
    bool? isCollected,
    int? status,
    String? createdAt,
    String? iconUrl,
    String? businessId,
    int? type,
    String? id,
    String? businessTime,
    String? remark,
  }) {
    return UiBonus(
      billAmount ?? this.billAmount,
      bonusAmount ?? this.bonusAmount,
      title ?? this.title,
      content ?? this.content,
      mode ?? this.mode,
      isCollected ?? this.isCollected,
      status ?? this.status,
      createdAt ?? this.createdAt,
      iconUrl ?? this.iconUrl,
      selected ?? this.selected,
      businessId ?? this.businessId,
      type ?? this.type,
      id ?? this.id,
      businessTime ?? this.businessTime,
      remark ?? this.remark,
    );
  }
}
