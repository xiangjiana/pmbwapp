import 'dart:ui';

class UiFilterTags {
  final int id;
  final String tagName;
  final Color checkedColor;
  final Color defaultColor;

  UiFilterTags(
    this.id,
    this.tagName,
    this.checkedColor,
    this.defaultColor,
  );

  UiFilterTags copyWith({
    int? id,
    String? tagName,
    Color? checkedColor,
    Color? defaultColor,
  }) {
    return UiFilterTags(
      id ?? this.id,
      tagName ?? this.tagName,
      checkedColor ?? this.checkedColor,
      defaultColor ?? this.defaultColor,
    );
  }
}
