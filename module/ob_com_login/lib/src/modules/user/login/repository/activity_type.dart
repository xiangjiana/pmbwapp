/// id : "2"
/// merchantId : "588326785867908888"
/// activityType : 0
/// activityName : "555"
/// activitySort : 2
/// createdBy : "darcy"
/// createdAt : "2021-06-29 11:45:01"
/// updatedBy : "toretto"
/// updatedAt : "2021-06-30 10:21:44"

class ActivityType {
  String? id;
  String? merchantId;
  int? activityType;
  String? activityName;
  int? activitySort;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;

  ActivityType(
      {this.id,
      this.merchantId,
      this.activityType,
      this.activityName,
      this.activitySort,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt});

  ActivityType.fromJson(dynamic json) {
    id = json['id'];
    merchantId = json['merchantId'];
    activityType = json['activityType'];
    activityName = json['activityName'];
    activitySort = json['activitySort'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedBy = json['updatedBy'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['merchantId'] = merchantId;
    map['activityType'] = activityType;
    map['activityName'] = activityName;
    map['activitySort'] = activitySort;
    map['createdBy'] = createdBy;
    map['createdAt'] = createdAt;
    map['updatedBy'] = updatedBy;
    map['updatedAt'] = updatedAt;
    return map;
  }
}
