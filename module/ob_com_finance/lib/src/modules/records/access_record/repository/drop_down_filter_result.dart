class DropDownFilterResult {
  final String status;

  DropDownFilterResult({
    required this.status,
  });

  DropDownFilterResult copyWith({
    String? bizType,
    String? status,
  }) {
    return DropDownFilterResult(
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'DropDownFilterResult{status: $status}';
  }
}
