import 'package:ob_package/modules/records/message_center/member_message_controller.dart';

class UiMessage {
  final String id;
  final String iconUrl;
  final String title;
  final String content;
  final Mode mode;
  final bool selected;
  final bool isRead;
  final String createdAt;
  final bool typeMsg;

  UiMessage(this.id,this.iconUrl, this.title, this.content, this.mode, this.selected, this.isRead, this.createdAt,this.typeMsg);

  UiMessage copyWith({
    String? id,
    String? iconUrl,
    String? title,
    String? content,
    Mode? mode,
    bool? selected,
    bool? isRead,
    String? createdAt,
    bool? typeMsg,
  }) {
    return UiMessage(
      id ?? this.id,
      iconUrl ?? this.iconUrl,
      title ?? this.title,
      content ?? this.content,
      mode ?? this.mode,
      selected ?? this.selected,
      isRead ?? this.isRead,
      createdAt ?? this.createdAt,
      typeMsg ?? this.typeMsg,
    );
  }
}
