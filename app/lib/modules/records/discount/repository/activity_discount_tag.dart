///   id: "708707442042769451",
///   merchantId: "588326785867908888",
///   name: "今日折扣",
///   remark: "今日折扣备注",
///   sort: 4,
///   status: 1,
///   operator: "admin",
///   updatedAt: "2022-03-08 10:00:37"

class ActivityDiscountTag {
  String? id;
  String? merchantId;
  String? activityName;
  String? remark;
  int? activitySort;
  int? activityStatus;
  String? activityType;

  ActivityDiscountTag({
    this.id,
    this.merchantId,
    this.activityName,
    this.activityType,
    this.remark,
    this.activitySort,
    this.activityStatus,
  });

  ActivityDiscountTag.fromJson(dynamic json) {
    id = json['id'];
    merchantId = json['merchantId'];
    activityName = json['activityName'];
    remark = json['remark'];
    activitySort = json['activitySort'];
    activityStatus = json['activityStatus'];
    activityType = json['activityType'] ?? '';
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['activitySort'] = activitySort;
    map['activityName'] = activityName;
    map['remark'] = remark;
    map['id'] = id;
    map['merchantId'] = merchantId;
    map['activityStatus'] = activityStatus;
    map['activityType'] = activityType;
    return map;
  }
}
