import 'dart:async';

import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';

import 'package:user/user.dart';
const _kDefaultAvatarUrl = "assets/images/avatar/square_photo_01.png";

class AuthService extends GetxService {
  final Rx<AuthState> rxAuthState = Rx<AuthState>(LoggedOut());

  AuthState get authState => rxAuthState.value;

  set authState(AuthState val) => rxAuthState.value = val;

  final _vipExperience = '--'.obs;
  final RxBool isAgent = false.obs;

  set vipExperience(String value) => _vipExperience.value = value;

  String get vipExperience => _vipExperience.value;

  final _vipLabel = "--".obs;

  set vipLabel(String value) => _vipLabel.value = value;

  String get vipLabel => _vipLabel.value;

  double get vipExperienceNum =>
      (double.tryParse(vipExperience.replaceAll('%', '')) ?? 0) / 100;

  /// 是否登录
  bool get isLogin => authState is LoggedIn;

  /// 用户信息
  UiUser get user => (authState as LoggedIn).uiUser;

  //处于试玩状态
  bool get isTryPlay {
    if (isLogin && Store.clientId != Store.clientIdPG) {
      return (authState as LoggedIn).uiUser.isTryPlay;
    }
    return false;
  }

  //用户名
  String get userName {
    if (isLogin) {
      return user.userName;
    }
    return '';
  }

  //用户名
  String get realName {
    if (isLogin) {
      return user.realName ?? '';
    }
    return '';
  }

  /// 是否有头像
  bool get isAvatar {
    if (isLogin) {
      return user.avatarUrl == null ? false : user.avatarUrl!.isNotEmpty;
    }
    return false;
  }

  //头像判断
  bool get isAvatarHttpUrl {
    if (isLogin) {
      return Uri
          .tryParse(user.avatarUrl ?? _kDefaultAvatarUrl)
          ?.scheme ==
          'https';
    }
    return false;
  }

  //头像地址
  String get userAvatarUrl {
    if (isLogin) {
      if (user.avatarUrl == null) return _kDefaultAvatarUrl.toPng();
      var url = user.avatarUrl!.isEmpty
          ? _kDefaultAvatarUrl
          : !isAvatarHttpUrl
          ? user.avatarUrl!.replaceFirst(RegExp(r"[^.]*$"), "webp")
          : user.avatarUrl!;

      return url.toPng();
    }
    return _kDefaultAvatarUrl.toPng();
  }

  //vip 等级
  String get vipLevel {
    if (isLogin) {
      return user.vipLevel;
    } else {
      return '1';
    }
  }

  /// 是否开启自动转账
  bool get isAutoTransferOpen {
    if (isLogin) {
      return user.isAutoTransferOpen;
    }
    return false;
  }

  bool get isAllowTypeUserName {
    if (isLogin) {
      return user.realName?.isEmpty ?? true;
    }
    return false;
  }

  void updateAuthState(AuthState state) {
    authState = state;
    syncUser();
  }

  Future<UiUser> syncUser() async {
    MemberInfo res = await Get.find<UserApi>().info();
    isAgent.value = res.entryAuthority == '1';
    authState = LoggedIn(UiUser(
        res.id,
        res.userName,
        res.noTransfer.toInt().toString() == '1',
        res.email,
        res.mobile,
        res.birth,
        res.birthday,
        res.realName,
        res.topImagesUrl,
        res.gender.toInt().toString(),
        res.merchantId.toInt().toString(),
        '${res.vipSerialNum.toInt()}',
        res.totalWithdrawNum,
        res.accountType == 1));
    return (authState as LoggedIn).uiUser;
  }

  void syncUserBirth(String birth) {
    if (isLogin) {
      authState = LoggedIn(user.copyWith(birth: birth));
    }
  }

  void syncUserGender(String gender) {
    if (isLogin) {
      authState = LoggedIn(user.copyWith(gender: gender));
    }
  }

  void syncUserAvatar(String url) {
    if (isLogin) {
      authState = LoggedIn(user.copyWith(avatarUrl: url));
    }
  }

  void syncUserRealName(String realName) {
    if (isLogin) {
      authState = LoggedIn(user.copyWith(realName: realName));
    }
  }

  void syncUserAutoUpdateSetting(bool b) {
    if (isLogin) {
      authState = LoggedIn(user.copyWith(isAutoTransferOpen: b));
    }
  }
}

abstract class AuthState {}

class LoggedIn extends AuthState {
  final UiUser uiUser;

  LoggedIn(this.uiUser);
}

class LoggedOut extends AuthState {}

class UiUser {
  final String id;
  final String userName;
  final bool isAutoTransferOpen;
  final String? email;
  final String? phone;
  final String? birth;
  final String? birthDay;
  final String? realName;
  final String? avatarUrl;
  final String? gender;
  final String merchantId;
  final String vipLevel;
  final int? totalWithdrawNum;
  final bool isTryPlay;

  @override
  String toString() {
    return 'UiUser{id: $id, userName: $userName, isAutoTransferOpen: $isAutoTransferOpen, email: $email, phone: $phone, birth: $birth,birthDay: $birthDay, realName: $realName, avatarUrl: $avatarUrl, gender: $gender, merchantId: $merchantId, vipLevel: $vipLevel,totalWithdrawNum:$totalWithdrawNum,}';
  }

  UiUser(this.id,
      this.userName,
      this.isAutoTransferOpen,
      this.email,
      this.phone,
      this.birth,
      this.birthDay,
      this.realName,
      this.avatarUrl,
      this.gender,
      this.merchantId,
      this.vipLevel,
      this.totalWithdrawNum,
      this.isTryPlay);

  UiUser copyWith({
    String? id,
    String? userName,
    bool? isAutoTransferOpen,
    String? email,
    String? phone,
    String? birth,
    String? birthDay,
    String? realName,
    String? avatarUrl,
    String? gender,
    String? merchantId,
    String? vipLevel,
    int? totalWithdrawNum,
    bool? isTryPlay,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (userName == null || identical(userName, this.userName)) &&
        (isAutoTransferOpen == null ||
            identical(isAutoTransferOpen, this.isAutoTransferOpen)) &&
        (email == null || identical(email, this.email)) &&
        (phone == null || identical(phone, this.phone)) &&
        (birth == null || identical(birth, this.birth)) &&
        (birthDay == null || identical(birthDay, this.birth)) &&
        (realName == null || identical(realName, this.realName)) &&
        (avatarUrl == null || identical(avatarUrl, this.avatarUrl)) &&
        (gender == null || identical(gender, this.gender)) &&
        (merchantId == null || identical(merchantId, this.merchantId)) &&
        (isTryPlay == null || identical(isTryPlay, this.isTryPlay))) {
      return this;
    }

    return UiUser(
      id ?? this.id,
      userName ?? this.userName,
      isAutoTransferOpen ?? this.isAutoTransferOpen,
      email ?? this.email,
      phone ?? this.phone,
      birth ?? this.birth,
      birthDay ?? this.birthDay,
      realName ?? this.realName,
      avatarUrl ?? this.avatarUrl,
      gender ?? this.gender,
      merchantId ?? this.merchantId,
      vipLevel ?? this.vipLevel,
      totalWithdrawNum ?? this.totalWithdrawNum,
      isTryPlay ?? this.isTryPlay,
    );
  }
}
