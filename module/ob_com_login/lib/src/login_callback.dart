// ignore_for_file: non_constant_identifier_names



abstract class LoginCallback {
  ///login_controller.dart
  void WelcomeManager_init();

  void OBChannelManager_systemInfo();

  void WelcomeManager_getConfigStartPagePost();

  ///login_mixin.dart
  void AgentTools_resetAgentPayPasswordKey();

  void HomeGameManager_refreshAllData();

  void HomeGameManager_startRefreshTimer();

  void HomeWidgetAutoRefreshManager_startRefreshTimer();

  void MineController_refreshInfo();

  void Store_init();

  void Constants_init();

  void gotoHomePage();

  void gotoMinePage();

  void initClientConfig();

  void initActivityType();

  void initHelpAllInfo();

  void onPausePatrolRequest();

  void onRestorePatrolRequest();

  ///login_repository.dart
  String Env_merchantId();

  ///ob账户体系注册成功
  void onObRegister(String username, String registerReference, String invitationCode, String friendInvitationCode);

  ///ob账户体系登录成功
  void onObLoginSuccess(String obToken);

  ///ob账户体系登录失败
  void onObLoginFailed(int code, String msg);

  ///抢登录,重新登录，维护操作，跳转到登录界面
  void rollBackOperation();
}
