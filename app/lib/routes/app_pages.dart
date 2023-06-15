import 'package:get/get.dart';
import 'package:ob_package/modules/game/gamegrid/game_grid_page.dart';
import 'package:ob_package/modules/game/gamegrid/game_grid_page_binding.dart';
import 'package:ob_package/modules/game/venuelist/venue_list_page.dart';
import 'package:ob_package/modules/game/venuelist/venue_list_page_binding.dart';
import 'package:ob_package/modules/home/home_binding.dart';
import 'package:ob_package/modules/home/home_page.dart';
import 'package:ob_package/modules/records/activity_record/activity_record_binding.dart';
import 'package:ob_package/modules/records/activity_record/activity_record_page.dart';
import 'package:ob_package/modules/records/discount_detail/discount_detail.dart';
import 'package:ob_package/modules/records/discount_detail/repository/repository.dart';
import 'package:ob_package/modules/records/invite_detail/invite_detail_controller.dart';
import 'package:ob_package/modules/records/invite_detail/invite_detail_page.dart';
import 'package:ob_package/modules/records/message_center/message_binding.dart';
import 'package:ob_package/modules/records/message_center/message_page.dart';
import 'package:ob_package/modules/records/my_feedback/my_feedback_bingding.dart';
import 'package:ob_package/modules/records/my_feedback/my_feedback_page.dart';
import 'package:ob_package/modules/settings/contact_us/contact_us_controller.dart';
import 'package:ob_package/modules/settings/contact_us/contact_us_page.dart';
import 'package:ob_package/modules/settings/contact_us/repository/contact_us_repository.dart';
import 'package:ob_package/modules/settings/feedback/feedback_binding.dart';
import 'package:ob_package/modules/settings/feedback/feedback_page_new.dart';
import 'package:ob_package/modules/settings/lang_setting/lang_setting_controller.dart';
import 'package:ob_package/modules/settings/lang_setting/lang_setting_page.dart';
import 'package:ob_package/modules/settings/lock_setting/lock_setting_controller.dart';
import 'package:ob_package/modules/settings/lock_setting/lock_setting_page.dart';
import 'package:ob_package/modules/settings/setting/setting_controller.dart';
import 'package:ob_package/modules/settings/setting/setting_page.dart';
import 'package:ob_package/modules/user/avatar_clip/avatar_clip_controller.dart';
import 'package:ob_package/modules/user/avatar_clip/avatar_clip_page.dart';
import 'package:ob_package/modules/user/bind_email/bind_email_controller.dart';
import 'package:ob_package/modules/user/bind_email/bind_email_page.dart';
import 'package:ob_package/modules/user/set_real_name/set_real_name_controller.dart';
import 'package:ob_package/modules/user/set_real_name/set_real_name_page.dart';
import 'package:ob_package/modules/user/user_profile/repository/user_profile_repository.dart';
import 'package:ob_package/modules/user/user_profile/user_profile_controller.dart';
import 'package:ob_package/modules/user/user_profile/user_profile_page.dart';
import 'package:ob_package/modules/user/verify_identity/email_verify_identity_controller.dart';
import 'package:ob_package/modules/user/verify_identity/email_verify_identity_page.dart';
import 'package:ob_package/modules/user/verify_identity/phone_verify_identity_controller.dart';
import 'package:ob_package/modules/user/verify_identity/phone_verify_identity_page.dart';
import 'package:ob_package/modules/user/verify_identity/repository/verify_identity_repository.dart';
import 'package:ob_package/modules/user/verify_identity/verify_identity_page.dart';
import 'package:ob_package/modules/vip/vip_level/vip_level_binding.dart';
import 'package:ob_package/modules/vip/vip_level/vip_level_page.dart';
import 'package:ob_package/modules/vip/vip_level_detail/vip_level_detail_binding.dart';
import 'package:ob_package/modules/vip/vip_level_detail/vip_level_detail_page.dart';
import 'package:ob_package/modules/web_iframe/web_iframe_page.dart';
import 'package:ob_package/modules/web_iframe/web_iframe_page_binding.dart';
import 'package:ob_package/modules/welcome/onboarding_page.dart';
import 'package:ob_package/modules/welcome/splash_page.dart';
import 'package:ob_package/modules/welcome/welcome_controller.dart';
import 'package:ob_com_base/ob_com_base.dart';
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
import 'package:ob_com_finance/src/modules/finance/invite_apply/Invite_apply_controller.dart';
import 'package:ob_com_finance/src/modules/finance/invite_apply/invite_apply.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/my_wallet_controller.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/my_wallet_page.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/repository/my_wallet_repository.dart';
import 'package:ob_com_finance/src/modules/finance/third_deposit/third_deposit_page.dart';
import 'package:ob_com_finance/src/modules/finance/transfer/repository/transfer_repository.dart';
import 'package:ob_com_finance/src/modules/finance/transfer/transfer_controller.dart';
import 'package:ob_com_finance/src/modules/finance/transfer/transfer_page.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/bank_card_withdraw_controller.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/cryptocurrency_withdraw_controller.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/repository/withdraw_repository.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/withdraw_controller.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/withdraw_page.dart';
import 'package:ob_com_finance/src/modules/records/access_record/access_record_controller.dart';
import 'package:ob_com_finance/src/modules/records/access_record/access_record_page.dart';
import 'package:ob_com_finance/src/modules/records/access_record/repository/access_record_repository.dart';
import 'package:ob_com_finance/src/modules/records/access_record_detail/access_record_detail_controller.dart';
import 'package:ob_com_finance/src/modules/records/access_record_detail/access_record_detail_page.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/bet_detail_list_controller.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/bet_detail_list_page.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/bet_histories_page.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/bet_settled_controller.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/bet_un_settled_controller.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/repository/bet_detail_list_repository.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/repository/bet_histories_repository.dart';
import 'package:ob_com_finance/src/modules/records/ledger_detail/ledger_detail_controller.dart';
import 'package:ob_com_finance/src/modules/records/ledger_detail/ledger_detail_page.dart';
import 'package:ob_com_finance/src/modules/records/ledger_record/ledger_record_controller.dart';
import 'package:ob_com_finance/src/modules/records/ledger_record/ledger_record_page.dart';
import 'package:ob_com_finance/src/modules/records/ledger_record/repository/ledger_record_repository.dart';
import 'package:ob_com_login/src/modules/help_widget/help_empty_controller.dart';
import 'package:ob_com_login/src/modules/help_widget/help_empty_page.dart';
import 'package:ob_com_login/src/modules/settings/error/limit_ip_controller.dart';
import 'package:ob_com_login/src/modules/settings/error/limit_ip_page.dart';
import 'package:ob_com_login/src/modules/user/bind_phone_number/bind_phone_number_controller.dart';
import 'package:ob_com_login/src/modules/user/bind_phone_number/bind_phone_number_page.dart';
import 'package:ob_com_login/src/modules/user/bind_phone_number/repository/bind_phone_number_repository.dart';
import 'package:ob_com_login/src/modules/user/login/login_controller.dart';
import 'package:ob_com_finance/src/modules/finance/deposit_easy/deposit_easy_page.dart';
import 'package:ob_com_finance/src/modules/finance/deposit_easy/deposit_easy_binding.dart';
import '../modules/game/my_collection/binding.dart';
import '../modules/game/my_collection/view.dart';
import '../modules/home/components/capital/capital_controller.dart';
import '../modules/home/components/capital/capital_page.dart';
import '../modules/home/components/electronic_games/electronic_games_view.dart';
import '../modules/home/components/walltet/wallet_controller.dart';
import '../modules/home/components/walltet/wallet_page.dart';
part 'app_routes2.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomePageBinding(),
      // 单独设置 home 页面不设置转场动画，会导致showcase 全局坐标计算出错
      transition: Transition.noTransition,
      children: [
        GetPage(
          name: AppRoutes.CONTACT_US,
          page: () => ContactUsPage(),
          middlewares: [AuthMiddleware()],
          binding: BindingsBuilder(() => {
                Get.lazyPut(() => ContactRepository()),
                Get.lazyPut(() => ContactUsController(Get.find())),
              }),
        ),
        GetPage(
          name: AppRoutes.FEEDBACK,
          page: () => FeedbackPageNew(),
          binding: FeedbackBinding(),
          middlewares: [AuthMiddleware()]
        ),
        GetPage(
          name: AppRoutes.MY_FEEDBACK,
          page: () => MyFeedbackPage(),
          binding: MyFeedbackBinding(),
          middlewares: [AuthMiddleware()]
        ),
        GetPage(
          name: AppRoutes.HELP_EMPTY,
          page: () => HelpEmptyPage(),
          binding: BindingsBuilder(() => {
                Get.lazyPut(() => HelpEmptyController()),
              }),
        ),
      ],
    ),
    GetPage(
      name: AppRoutes.BET_HISTORY,
      page: () => BetHistoriesPage(),
      middlewares: [AuthMiddleware()],
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => BetHistoriesRepository()),
            Get.lazyPut(() => BetUnSettledController(Get.find(), Get.find())),
            Get.lazyPut(() => BetSettledController(Get.find())),
          }),
    ),
    GetPage(
      name: AppRoutes.BET_DETAIL_LIST,
      page: () => BetDetailListPage(),
      middlewares: [AuthMiddleware()],
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => BetDetailListRepository()),
            Get.lazyPut(() => BetDetailListController(Get.find())),
          }),
    ),
    GetPage(
      name: AppRoutes.MESSAGE,
      page: () => MessagePage(),
      middlewares: [AuthMiddleware()],
      binding: MessageBinding(),
    ),
    GetPage(
      name: AppRoutes.WEB_IFRAME,
      page: () => WebIframePage(),
      middlewares: [AuthMiddleware()],
      binding: WebIframePageBinding(),
    ),
    GetPage(
        name: AppRoutes.ACCOUNT,
        page: () => AccountPage(),
        middlewares: [AuthMiddleware()],
        binding: BindingsBuilder(() => {
              Get.lazyPut(() => AccountRepository()),
              Get.lazyPut(() => AccountController(Get.find(), Get.find())),
            }),
        children: [
          GetPage(
            name: AppRoutes.BANK,
            page: () => AddBankAccountPage(),
            middlewares: [AuthMiddleware()],
            binding: BindingsBuilder(() => {
                  Get.lazyPut(() => AddBankAccountRepository()),
                  Get.lazyPut(
                      () => AddBankAccountController(Get.find(), Get.find())),
                }),
            children: [
              GetPage(
                name: AppRoutes.PROFILE,
                middlewares: [AuthMiddleware()],
                page: () => AddBankAccountProfilePage(),
                binding: BindingsBuilder(() => {
                      Get.lazyPut(() => AddAccountProfileRepository()),
                      Get.lazyPut(() => AddBankAccountProfileController(
                          Get.find(), Get.find())),
                    }),
              ),
            ],
          ),
          GetPage(
            name: AppRoutes.CRYPTOCURRENCY,
            page: () => AddVirtualAccountPage(),
            middlewares: [AuthMiddleware()],
            binding: BindingsBuilder(() => {
                  Get.lazyPut(() => AddVirtualAccountRepository()),
                  Get.lazyPut(() =>
                      AddVirtualAccountController(Get.find(), Get.find())),
                }),
          ),
        ]),
    GetPage(
      name: AppRoutes.TRANSFER,
      page: () => TransferPage(),
      middlewares: [AuthMiddleware()],
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => TransferRepository()),
            Get.lazyPut(() => TransferController(Get.find(), Get.find())),
          }),
    ),
    GetPage(
      name: AppRoutes.CAPITAL,
      page: () => CapitalPage(),
      binding: BindingsBuilder(() => {
        Get.lazyPut(
              () => CapitalController(
            Get.find(),
          ),
        ),
      }),
    ),
    GetPage(
      name: AppRoutes.WALLET,
      page: () => WalletPage(),
      binding: BindingsBuilder(() => {
        Get.lazyPut(
              () => WalletController(),
        ),
      }),
    ),
    GetPage(
      name: AppRoutes.WITHDRAW,
      middlewares: [AuthMiddleware()],
      page: () => WithdrawPage(),
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => WithdrawRepository()),
            Get.lazyPut(
                () => BankCardWithdrawController(Get.find(), Get.find())),
            Get.lazyPut(
                () => CryptoCurrencyWithdrawController(Get.find(), Get.find())),
            Get.lazyPut(() => WithdrawController(
                Get.find(), Get.find(), Get.find(), Get.find())),
          }),
    ),
    GetPage(
      name: AppRoutes.DEPOSIT_EASY,
      page: () => DepositEasyPage(),
      middlewares: [AuthMiddleware()],
      binding: DepositEasyBinding(),
    ),
    GetPage(
      name: AppRoutes.THIRD_DEPOSIT,
      middlewares: [AuthMiddleware()],
      page: () => ThirdDepositPage(),
    ),
    GetPage(
      name: AppRoutes.BIND_EMAIL,
      middlewares: [AuthMiddleware()],
      page: () => BindEmailPage(),
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => BindEmailController(Get.find())),
          }),
    ),
    GetPage(
      name: AppRoutes.BIND_PHONE_NUMBER,
      middlewares: [AuthMiddleware()],
      page: () => BindPhoneNumberPage(),
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => BindPhoneNumberRepository()),
            Get.lazyPut(
                () => BindPhoneNumberController(Get.find(), Get.find())),
          }),
    ),
    GetPage(
      name: AppRoutes.SETTING,
      page: () => SettingPage(),
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => SettingController(Get.find())),
          }),
    ),
    GetPage(
      name: AppRoutes.LOCK_SETTING,
      middlewares: [AuthMiddleware()],
      page: () => LockSettingPage(),
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => LockSettingController()),
            Get.lazyPut(() => LoginController()),
          }),
    ),
    GetPage(
      name: AppRoutes.VERIFY_INDETITY,
      middlewares: [AuthMiddleware()],
      page: () => VerifyIdentityPage(),
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => VerifyIdentityRepository()),
            Get.lazyPut(
                () => PhoneVerifyIdentityController(Get.find(), Get.find())),
            Get.lazyPut(
                () => EmailVerifyIdentityController(Get.find(), Get.find())),
          }),
    ),
    GetPage(
      name: AppRoutes.PHONE_VERIFY_INDETITY,
      middlewares: [AuthMiddleware()],
      page: () => PhoneVerifyIdentityPage(),
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => VerifyIdentityRepository()),
            Get.lazyPut(
                () => PhoneVerifyIdentityController(Get.find(), Get.find())),
          }),
    ),
    GetPage(
      name: AppRoutes.EMAIL_VERIFY_INDETITY,
      middlewares: [AuthMiddleware()],
      page: () => EmailVerifyIdentityPage(),
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => VerifyIdentityRepository()),
            Get.lazyPut(
                () => EmailVerifyIdentityController(Get.find(), Get.find())),
          }),
    ),
    GetPage(
      name: AppRoutes.USER_PROFILE,
      page: () => UserProfilePage(),
      middlewares: [AuthMiddleware()],
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => UserProfileRepository()),
            Get.lazyPut(() => UserProfileController(Get.find(), Get.find())),
          }),
    ),
    GetPage(
      name: AppRoutes.Avatar_Clip,
      page: () => AvatarClipPage(),
      middlewares: [AuthMiddleware()],
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => AvatarClipController()),
          }),
    ),
    GetPage(
      name: AppRoutes.SET_REAL_NAME,
      page: () => SetRealNamePage(),
      middlewares: [AuthMiddleware()],
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => SetRealNameController(Get.find())),
          }),
    ),
    GetPage(
      name: AppRoutes.LANG_SETTING,
      page: () => LangSettingPage(),
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => LangSettingController()),
          }),
    ),
    GetPage(
      name: AppRoutes.BIND_PHONE_NUMBER,
      middlewares: [AuthMiddleware()],
      page: () => BindPhoneNumberPage(),
    ),
    GetPage(
      name: AppRoutes.BIND_EMAIL,
      middlewares: [AuthMiddleware()],
      page: () => BindEmailPage(),
    ),
    GetPage(
      name: AppRoutes.MY_FEEDBACK,
      middlewares: [AuthMiddleware()],
      page: () => MyFeedbackPage(),
    ),
    GetPage(
      name: AppRoutes.MY_WALLET,
      page: () => MyWalletPage(),
      middlewares: [AuthMiddleware()],
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => MyWalletRepository()),
            Get.lazyPut(() => MyWalletController(Get.find(), Get.find())),
          }),
    ),
    GetPage(
      name: AppRoutes.LEDGER_RECORD,
      middlewares: [AuthMiddleware()],
      page: () => LedgerRecordPage(),
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => LedgerRecordRepository()),
            Get.lazyPut(() => LedgerRecordController()),
            Get.lazyPut(() => TodayRecordController(Get.find())),
            Get.lazyPut(() => YesterdayRecordController(Get.find())),
            Get.lazyPut(() => RecentWeekRecordController(Get.find())),
            Get.lazyPut(() => RecentMonthRecordController(Get.find())),
            Get.lazyPut(() => CustomRecordController(Get.find())),
          }),
    ),
    GetPage(
      name: AppRoutes.LEDGER_DETAIL,
      middlewares: [AuthMiddleware()],
      page: () => LedgerDetailPage(),
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => LedgerDetailController()),
          }),
    ),
    GetPage(
      name: AppRoutes.ACCESS_RECORD,
      middlewares: [AuthMiddleware()],
      page: () => AccessRecordPage(),
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => AccessRecordRepository()),
            Get.lazyPut(() => AccessRecordController()),
            // Get.lazyPut(() => DepositRecordController(Get.find())),
            // Get.lazyPut(() => WithdrawRecordController(Get.find())),
          }),
    ),
    GetPage(
      name: AppRoutes.ACCESS_RECORD_DETAIL,
      middlewares: [AuthMiddleware()],
      page: () => AccessRecordDetailPage(),
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => AccessRecordDetailController()),
          }),
    ),
    GetPage(
      name: AppRoutes.ACTIVITY_RECORD,
      middlewares: [AuthMiddleware()],
      page: () => ActivityRecordPage(),
      binding: ActivityRecordBinding(),
    ),
    GetPage(
      name: AppRoutes.DISCOUNT_DETAIL,
      middlewares: [AuthMiddleware()],
      page: () => DiscountDetailPage(),
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => DiscountDetailRepository()),
          }),
    ),
    GetPage(
      name: AppRoutes.INVITE_DETAIL,
      page: () => InviteDetailPage(),
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => InviteDetailController()),
          }),
    ),
    GetPage(
      name: AppRoutes.INVITE_APPLY,
      page: () => InviteApplyPage(),
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => InviteApplyController(Get.find())),
          }),
    ),
    GetPage(
      name: AppRoutes.VIP_LEVEL,
      page: () => VipLevelPage(),
      binding: VipLevelBinding(),
    ),
    GetPage(
        name: AppRoutes.VIP_LEVEL_DETAIL,
        page: () => VipLevelDetailPage(),
        binding: VipLevelDetailBinding()),
    GetPage(
      name: AppRoutes.ONBOARDING,
      page: () => OnboardingPage(),
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => WelcomeController()),
          }),
    ),
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashPage(),
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => WelcomeController()),
          }),
    ),
    GetPage(
      name: AppRoutes.limitIpPage,
      page: () => LimitIpPage(),
      binding: BindingsBuilder(
        () => {Get.lazyPut(() => LimitIpController())},
      ),
    ),
    GetPage(
      name: AppRoutes.h5DownloadPage,
      page: () => H5DownloadPage(),
      binding: BindingsBuilder(
        () => {Get.lazyPut(() => H5DownloadController())},
      ),
    ),
    GetPage(
      name: AppRoutes.Electronic_Games,
      page: () => ElectronicGamesPage(),
    ),

    GetPage(
      name: AppRoutes.VENUE_LIST,
      page: () => VenueListPage(),
      binding: VenueListBinding(),
    ),
    GetPage(
      name: AppRoutes.GAME_GRID,
      page: () => GameGridPage(),
      binding: GameGridBinding(),
    ),
    GetPage(
      name: AppRoutes.My_Collection,
      page: () => MyCollectionPage(),
      binding: MyCollectionBinding(),
    ),
  ];
}
