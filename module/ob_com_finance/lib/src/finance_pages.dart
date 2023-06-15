import 'package:get/get.dart';
import 'package:ob_com_finance/src/modules/finance/cryptocurrency_deposit_wiki/cryptocurrency_deposit_wiki_page.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/my_wallet_controller.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/my_wallet_page.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/repository/my_wallet_repository.dart';
import 'package:ob_com_finance/src/modules/finance/account/account_controller.dart';
import 'package:ob_com_finance/src/modules/finance/account/account_page.dart';
import 'package:ob_com_finance/src/modules/finance/account/repository/account_repository.dart';
import 'package:ob_com_finance/src/modules/finance/add_bank_account/add_bank_account_controller.dart';
import 'package:ob_com_finance/src/modules/finance/add_bank_account/add_bank_account_page.dart';
import 'package:ob_com_finance/src/modules/finance/add_bank_account/repository/add_bank_account_repository.dart';
import 'package:ob_com_finance/src/modules/finance/add_bank_accout_profile/add_bank_account_profile_controller.dart';
import 'package:ob_com_finance/src/modules/finance/add_bank_accout_profile/add_bank_account_profile_page.dart';
import 'package:ob_com_finance/src/modules/finance/add_bank_accout_profile/repository/add_account_profile_repository.dart';
import 'package:ob_com_finance/src/modules/finance/add_virtual_account/add_virtual_account_controller.dart';
import 'package:ob_com_finance/src/modules/finance/add_virtual_account/add_virtual_account_page.dart';
import 'package:ob_com_finance/src/modules/finance/add_virtual_account/repository/add_virtual_account_repository.dart';
import 'package:ob_com_finance/src/modules/records/access_record/access_record_controller.dart';
import 'package:ob_com_finance/src/modules/records/access_record/access_record_page.dart';
import 'package:ob_com_finance/src/modules/records/access_record/repository/access_record_repository.dart';
import 'package:ob_com_finance/src/modules/records/access_record_detail/access_record_detail_controller.dart';
import 'package:ob_com_finance/src/modules/records/access_record_detail/access_record_detail_page.dart';
import 'package:ob_com_finance/src/modules/records/ledger_detail/ledger_detail_controller.dart';
import 'package:ob_com_finance/src/modules/records/ledger_detail/ledger_detail_page.dart';
import 'package:ob_com_finance/src/modules/records/ledger_record/ledger_record_controller.dart';
import 'package:ob_com_finance/src/modules/records/ledger_record/repository/ledger_record_repository.dart';
import 'package:ob_com_finance/src/modules/records/ledger_record/ledger_record_page.dart';
import 'package:ob_com_finance/src/modules/finance/third_deposit/third_deposit_page.dart';
import 'package:ob_com_finance/src/modules/finance/transfer/repository/transfer_repository.dart';
import 'package:ob_com_finance/src/modules/finance/transfer/transfer_controller.dart';
import 'package:ob_com_finance/src/modules/finance/transfer/transfer_page.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/bank_card_withdraw_controller.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/cryptocurrency_withdraw_controller.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/repository/withdraw_repository.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/withdraw_controller.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/withdraw_page.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'modules/finance/deposit_easy/deposit_easy_binding.dart';
import 'modules/finance/deposit_easy/deposit_easy_page.dart';

abstract class FinancePages {
  static final pages = [
    GetPage(
      name: AppRoutes.CRYPTOCURRENCY_DEPOSIT_WIKI,
      page: () => CryptocurrencyDepositWikiPage(),
    ),
    GetPage(
        name: AppRoutes.ACCOUNT,
        page: () => AccountPage(),
        binding: BindingsBuilder(
          () => {
            Get.lazyPut(() => AccountRepository()),
            Get.lazyPut(() => AccountController(Get.find(), Get.find())),
          },
        ),
        children: [
          GetPage(
            name: AppRoutes.BANK,
            page: () => const AddBankAccountPage(),
            binding: BindingsBuilder(
              () => {
                Get.lazyPut(() => AddBankAccountRepository()),
                Get.lazyPut(
                    () => AddBankAccountController(Get.find(), Get.find())),
              },
            ),
            children: [
              GetPage(
                name: AppRoutes.PROFILE,
                page: () => const AddBankAccountProfilePage(),
                binding: BindingsBuilder(
                  () => {
                    Get.lazyPut(() => AddAccountProfileRepository()),
                    Get.lazyPut(() => AddBankAccountProfileController(
                        Get.find(), Get.find())),
                  },
                ),
              ),
            ],
          ),
          GetPage(
            name: AppRoutes.CRYPTOCURRENCY,
            page: () => AddVirtualAccountPage(),
            binding: BindingsBuilder(
              () => {
                Get.lazyPut(() => AddVirtualAccountRepository()),
                Get.lazyPut(
                    () => AddVirtualAccountController(Get.find(), Get.find())),
              },
            ),
          ),
        ]),
    GetPage(
      name: AppRoutes.TRANSFER,
      page: () => TransferPage(),
      binding: BindingsBuilder(
        () => {
          Get.lazyPut(() => TransferRepository()),
          Get.lazyPut(() => TransferController(Get.find(), Get.find())),
        },
      ),
    ),
    GetPage(
      name: AppRoutes.WITHDRAW,
      page: () => WithdrawPage(),
      binding: BindingsBuilder(
        () => {
          Get.lazyPut(() => WithdrawRepository()),
          Get.lazyPut(() => BankCardWithdrawController(Get.find(), Get.find())),
          Get.lazyPut(
              () => CryptoCurrencyWithdrawController(Get.find(), Get.find())),
          Get.lazyPut(() => WithdrawController(
              Get.find(), Get.find(), Get.find(), Get.find())),
        },
      ),
    ),
    GetPage(
      name: AppRoutes.DEPOSIT_EASY,
      page: () => DepositEasyPage(),
      binding: DepositEasyBinding(),
    ),
    GetPage(
      name: AppRoutes.THIRD_DEPOSIT,
      page: () => const ThirdDepositPage(),
    ),
    GetPage(
      name: AppRoutes.MY_WALLET,
      page: () => MyWalletPage(),
      binding: BindingsBuilder(
        () => {
          Get.lazyPut(() => MyWalletRepository()),
          Get.lazyPut(() => MyWalletController(Get.find(), Get.find())),
        },
      ),
    ),
    GetPage(
      name: AppRoutes.LEDGER_RECORD,
      page: () => LedgerRecordPage(),
      binding: BindingsBuilder(
        () => {
          Get.lazyPut(() => LedgerRecordRepository()),
          Get.lazyPut(() => LedgerRecordController()),
          Get.lazyPut(() => TodayRecordController(Get.find())),
          Get.lazyPut(() => YesterdayRecordController(Get.find())),
          Get.lazyPut(() => RecentWeekRecordController(Get.find())),
          Get.lazyPut(() => RecentMonthRecordController(Get.find())),
          Get.lazyPut(() => CustomRecordController(Get.find())),
        },
      ),
    ),
    GetPage(
      name: AppRoutes.LEDGER_DETAIL,
      page: () => LedgerDetailPage(),
      binding: BindingsBuilder(
        () => {
          Get.lazyPut(() => LedgerDetailController()),
        },
      ),
    ),
    GetPage(
      name: AppRoutes.ACCESS_RECORD,
      page: () => AccessRecordPage(),
      binding: BindingsBuilder(
        () => {
          Get.lazyPut(() => AccessRecordRepository()),
          Get.lazyPut(() => AccessRecordController()),
        },
      ),
    ),
    GetPage(
      name: AppRoutes.ACCESS_RECORD_DETAIL,
      page: () => AccessRecordDetailPage(),
      binding: BindingsBuilder(
        () => {
          Get.lazyPut(() => AccessRecordDetailController()),
        },
      ),
    ),
  ];
}
