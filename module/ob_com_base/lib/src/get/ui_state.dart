enum UIActionEvent { A, B, C, D, E, F, G }

abstract class UIState {}

class UIInitial extends UIState {
  final bool isLoading;

  UIInitial(this.isLoading);
}

class UIIdle extends UIState {}

class UILoading extends UIState {}

class UIToast extends UIState {
  final String msg;

  UIToast(this.msg);
}

class UIAction extends UIState {
  final UIActionEvent event;
  final dynamic data;
  final dynamic data2;
  final dynamic data3;

  UIAction({
    required this.event,
    required this.data,
    required this.data2,
    required this.data3,
  });
}
