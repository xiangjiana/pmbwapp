import 'dart:async';

import 'package:bank/bank.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/account/repository/bank.dart';
import 'package:params/params.dart';
import 'package:repository/utils/upload.dart';
import 'package:user/user.dart';

class UserProfileRepository {
  final userApi = Get.find<UserApi>();

  Future<bool> updateBirth(String birth) async {
    try {
      return userApi.updateBirth(
        BirthParam(
          birth: birth,
        ),
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> updateRealName(
    String realName,
  ) async {
    await Get.find<UserApi>().updateRealName(RealNameParam(realName: realName));
  }

  Future<void> updateRealNameNew(
    String realName,
  ) async {
    await Get.find<UserApi>().updateRealName(RealNameParam(realName: realName));
  }

  /// [gender] 会员性别 0=女，1=男
  Future<void> updateGender(
    String gender,
  ) async {
    await Get.find<UserApi>().updateGender(GenderParam(gender: gender));
  }

  Future<String> uploadAvatar(String filePath) {
    final completer = Completer<String>();
    UploaderPlugin.avatarUpload(
      use: true,
      filePath: filePath,
      success: (UploadImageMod res) => completer.complete(res.imgUrl),
      fail: (code, msg) => completer.completeError(msg),
    );
    return completer.future;
  }

  Future<void> updateAvatarUrl(
    String url,
  ) async {
    await Get.find<UserApi>().uploadSubmit(AvatarParam(topImagesUrl: url));
  }

  Future<List<Bank>> getAccounts(String type) async {
    List<UserBankCard> userBankCards =
        await Get.find<BankApi>().query(ListBankParam(dataType: type));
    List<Bank> banks = [];
    userBankCards.forEach((element) {
      banks.add(Bank(
        accountType: element.accountType,
        bankBranch: element.bankBranch,
        bankCode: element.bankCode,
        bankName: element.bankName,
        cardNumber: element.cardNumber,
        city: element.city,
        cnName: element.cnName,
        id: element.id,
        isUsed: element.isUsed,
        merchantId: element.merchantId,
        province: element.province,
        realName: element.realName,
        status: element.status,
        userId: element.userId,
        userName: element.bindUserName,
        virtualAddress: element.virtualAddress,
        virtualKind: element.virtualKind,
        virtualProtocol: element.virtualProtocol,
      ));
    });
    return banks;
  }
}
