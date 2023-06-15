class UiWalletItem {
  String id;
  String name;
  String balance;
  String venueIconUrlApp;
  String venueWalletIconUrl;
  bool vipActivityGoing; //通过 isMerchantTransferAvailable 方法异步查询得到是否可用
  int status; //开启1 维护2 禁用0 接口不会返回0的情况。
  String venueType;
  String venueName;

  bool get enabled {
    return this.status == 1;
  }

  bool get maintained {
    return this.status == 2;
  }

  bool get disabled {
    return this.status == 0;
  }

  UiWalletItem({
    required this.id,
    required this.name,
    required this.balance,
    required this.venueIconUrlApp,
    required this.venueWalletIconUrl,
    required this.status,
    required this.vipActivityGoing,
    required this.venueType,
    required this.venueName,
  });

  UiWalletItem copyWith({
    String? id,
    String? name,
    String? balance,
    String? venueIconUrlApp,
    String? venueWalletIconUrl,
    int? status,
    bool? vipActivityGoing,
    String? venueType,
    String? venueName,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (name == null || identical(name, this.name)) &&
        (balance == null || identical(balance, this.balance)) &&
        (vipActivityGoing == null ||
            identical(vipActivityGoing, this.vipActivityGoing)) &&
        (venueType == null || identical(venueType, this.venueType)) &&
        (venueName == null || identical(venueName, this.venueName))) {
      return this;
    }

    return UiWalletItem(
      id: id ?? this.id,
      name: name ?? this.name,
      balance: balance ?? this.balance,
      venueIconUrlApp: venueIconUrlApp ?? this.venueIconUrlApp,
      venueWalletIconUrl: venueWalletIconUrl ?? this.venueWalletIconUrl,
      status: status ?? this.status,
      vipActivityGoing: vipActivityGoing ?? this.vipActivityGoing,
      venueType: venueType ?? this.venueType,
      venueName: venueName ?? this.venueName,
    );
  }

  Map toMap() {
    return {
      "id": id.toString(),
      "name": name.toString(),
      "venueIconUrlApp": venueIconUrlApp.toString(),
      "venueWalletIconUrl": venueWalletIconUrl.toString(),
      "balance": balance.toString(),
      "vipActivityGoing": vipActivityGoing ? "true" : "false",
      "status": status.toString(),
      "venueType": venueType.toString(),
      "venueName": venueName.toString(),
    };
  }

  @override
  String toString() {
    return 'UiWalletItem{id: $id,'
        ' name: $name,'
        ' venueIconUrlApp: $venueIconUrlApp,'
        ' venueWalletIconUrl: $venueWalletIconUrl,'
        ' balance: $balance, vipActivityGoing: $vipActivityGoing, status: $status,venueType:$venueType,venueName:$venueName}';
  }
}
