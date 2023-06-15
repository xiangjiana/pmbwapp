/// accountType : 75012596
/// bankBranch : "id labore ut culpa nisi"
/// bankCode : "sed laborum"
/// bankName : "aliqua ex ut nostrud"
/// cardNumber : "reprehenderit anim Lorem Duis"
/// city : "ex Ut Excepteur consequat reprehenderit"
/// cnName : "quis"
/// id : "et"
/// isUsed : -70015738
/// merchantId : "cillum"
/// province : "quis aute aliquip"
/// realName : "nisi incididunt irure"
/// status : 94470070
/// userId : "eu fugiat minim sit quis"
/// userName : "est in sed"
/// virtual_address : "mollit amet"
/// virtual_kind : "pariatur velit laboris cupidatat Excepteur"
/// virtual_protocol : "cillum est dolor"

class Bank {
  int? accountType;
  String? bankBranch;
  String? bankCode;
  String? bankName;
  String? cardNumber;
  String? city;
  String? cnName;
  String? id;
  int? isUsed;
  String? merchantId;
  String? province;
  String? realName;
  int? status;
  String? userId;
  String? userName;
  String? virtualAddress;
  String? virtualKind;
  String? virtualProtocol;

  Bank(
      {this.accountType,
      this.bankBranch,
      this.bankCode,
      this.bankName,
      this.cardNumber,
      this.city,
      this.cnName,
      this.id,
      this.isUsed,
      this.merchantId,
      this.province,
      this.realName,
      this.status,
      this.userId,
      this.userName,
      this.virtualAddress,
      this.virtualKind,
      this.virtualProtocol});

  Bank.fromJson(dynamic json) {
    accountType = json["accountType"];
    bankBranch = json["bankBranch"];
    bankCode = json["bankCode"];
    bankName = json["bankName"];
    cardNumber = json["cardNumber"];
    city = json["city"];
    cnName = json["cnName"];
    id = json["id"];
    isUsed = json["isUsed"];
    merchantId = json["merchantId"];
    province = json["province"];
    realName = json["realName"];
    status = json["status"];
    userId = json["userId"];
    userName = json["userName"];
    virtualAddress = json["virtualAddress"];
    virtualKind = json["virtualKind"];
    virtualProtocol = json["virtualProtocol"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["accountType"] = accountType;
    map["bankBranch"] = bankBranch;
    map["bankCode"] = bankCode;
    map["bankName"] = bankName;
    map["cardNumber"] = cardNumber;
    map["city"] = city;
    map["cnName"] = cnName;
    map["id"] = id;
    map["isUsed"] = isUsed;
    map["merchantId"] = merchantId;
    map["province"] = province;
    map["realName"] = realName;
    map["status"] = status;
    map["userId"] = userId;
    map["userName"] = userName;
    map["virtualAddress"] = virtualAddress;
    map["virtualKind"] = virtualKind;
    map["virtualProtocol"] = virtualProtocol;
    return map;
  }
}
