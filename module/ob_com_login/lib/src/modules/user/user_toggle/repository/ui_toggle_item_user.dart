class UIToggleItemUser {
  String id;
  String username;
  String password;
  String token;
  String userAvatarUrl; //头像
  bool isCurrentLogin; //当前登录
  bool isRemember; //记住密码

  UIToggleItemUser({
    required this.id,
    required this.username,
    this.password = "",
    this.token = "",
    this.userAvatarUrl = "",
    this.isCurrentLogin = false,
    this.isRemember = false,
  });

  factory UIToggleItemUser.fromJson(Map<String, dynamic> json) {
    return UIToggleItemUser(
        id: fixIdType(json["id"]),
        username: json["username"],
        password: json["password"],
        token: json["token"],
        userAvatarUrl: json["userAvatarUrl"],
        isCurrentLogin: json["isCurrentLogin"],
        isRemember: json["isRemember"]);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "token": token,
        "userAvatarUrl": userAvatarUrl,
        "isCurrentLogin": isCurrentLogin,
        "isRemember": isRemember,
      };

  UIToggleItemUser copyWith({
    String? id,
    String? username,
    String? password,
    String? token,
    String? userAvatarUrl,
    bool? isCurrentLogin,
    bool? isRemember,
  }) {
    return UIToggleItemUser(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      token: token ?? this.token,
      userAvatarUrl: userAvatarUrl ?? this.userAvatarUrl,
      isCurrentLogin: isCurrentLogin ?? this.isCurrentLogin,
      isRemember: isRemember ?? this.isRemember,
    );
  }

  static String fixIdType(dynamic id) {
    if (id == null) return '';
    return '$id';
  }
}
