import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

CancelFunc showToast(String msg) {
  if (!Store.isIpLimited) {
    if (null != BaseX.instance.toastCallback) {
      return BaseX.instance.toastCallback!.showToast(msg);
    } else {
      ToastManager.showText(msg);
    }
  }
  return () => ToastManager.dismiss();
}

void dismissAll() {
  if (null != BaseX.instance.toastCallback) {
    BaseX.instance.toastCallback!.dismissAll();
    return;
  }

  ToastManager.dismiss();
}

void dismissLoading() {
  if (null != BaseX.instance.toastCallback) {
    BaseX.instance.toastCallback!.dismissLoading();
    return;
  }

  ToastManager.dismiss();
}

CancelFunc showLoading({String? msg}) {
  if (null != BaseX.instance.toastCallback) {
    return BaseX.instance.toastCallback!.showLoading(msg: msg);
  }

  ToastManager.showLoading(status: msg ?? "loading...");
  return () => ToastManager.dismiss();
}

CancelFunc showGaLoading() {
  ToastManager.showGataLoading(const GataLoading());
  return () => ToastManager.dismiss();
}

CancelFunc showSuccess(String msg) {
  if (null != BaseX.instance.toastCallback) {
    return BaseX.instance.toastCallback!.showSuccess(msg);
  }

  ToastManager.showSuccess(message: msg);
  return () => ToastManager.dismiss();
}

CancelFunc showError(String msg) {
  if (null != BaseX.instance.toastCallback) {
    return BaseX.instance.toastCallback!.showError(msg);
  }

  ToastManager.showError(message: msg);
  return () => ToastManager.dismiss();
}
