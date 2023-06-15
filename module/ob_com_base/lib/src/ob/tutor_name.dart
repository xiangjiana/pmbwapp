class TutorName {
  String id = '';
  String merchantId;
  String tutorName = '';
  String tutorDescribe = '';
  String tutorPicture = '';
  int tutorSort = 0;
  int tutorStatus;
  String route = '';

  TutorName({
    required this.id,
    this.merchantId = '',
    required this.tutorName,
    required this.tutorDescribe,
    required this.tutorPicture,
    required this.tutorSort,
    required this.route,
    this.tutorStatus = 1,
  });

  factory TutorName.fromJson(Map<String, dynamic> jsonRes) => TutorName(
        id: jsonRes['id'],
        merchantId: jsonRes['merchantId'],
        tutorName: jsonRes['tutorName'],
        tutorDescribe: jsonRes['tutorDescribe'],
        tutorPicture: jsonRes['tutorPicture'],
        tutorSort: jsonRes['tutorSort'],
        tutorStatus: jsonRes['tutorStatus'],
        route: jsonRes['route'],
      );
}
