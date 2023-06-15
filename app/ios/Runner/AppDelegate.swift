import UIKit
import Flutter
import IQKeyboardManager

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        let result = super.application(application, didFinishLaunchingWithOptions: launchOptions)
        if let controller = self.window.rootViewController as? FlutterViewController {
            OBChannelManager.instance().obRegistry(controller)
            let nav = UINavigationController(rootViewController: controller)
            nav.setNavigationBarHidden(true, animated: false)
            self.window.rootViewController = nav
            OBChannelManager.instance().setUp(controller as! FlutterBinaryMessenger)
        }
        
        
        registerListeners()
        registerNotification()
        
        IQKeyboardManager.shared().isEnableAutoToolbar = false

        return result
    }
    
    
    open func registerListeners() {
        OBChannelManager.instance().addEventListener({ key, args in
            
            if let curSymbol = args["symbol"] as? String, curSymbol.count > 0 {
                LanguageManager.instance().curSymbol = curSymbol
            }
            if let controller = self.window.rootViewController as? UINavigationController {
                let vc = WKWebViewController(arguments: args)
                vc.modalPresentationStyle = .fullScreen
                if #available(iOS 13.0, *) {
                    vc.isModalInPresentation = true
                }
                controller.pushViewController(vc, animated: true)
            }
        }, forName: "openNativeGamePageEvent")
        
        OBChannelManager.instance().addEventListener({ key, args in
            if let message = args["message"] as? String {
                let alertView = OBAlertView.createAlertTitle(args["title"] as? String ?? NSLocalizedString("alert", comment: ""), confirmColor:false, content: message, sureBlock: {
//                    OBChannelManager.instance().sendEventToFlutter(with: "gameUtilDestory", arguments: nil)
//                    if let controller = self.window.rootViewController as? UINavigationController {
//                        controller.popToRootViewController(animated: true)
//                    }
                }, sureTitle: args["confirmText"] as? String ?? NSLocalizedString("alert_know", comment: ""))
                
                self.window?.addSubview(alertView)
                OBProgressHUD.dismissLoading()
            }
        }, forName: "openNativeLoginGameErrorEvent")
        
        OBChannelManager.instance().addEventListener({ key, args in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: OBEventIdentifier_webViewPageEvent_seturl), object: args)
        }, forName: OBEventIdentifier_webViewPageEvent_seturl)

        OBChannelManager.instance().addEventListener({ key, args in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: OBEventIdentifier_webViewPageEvent_reload), object: args)
        }, forName: OBEventIdentifier_webViewPageEvent_reload)

        OBChannelManager.instance().addEventListener({ key, args in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: OBEventIdentifier_is_show_run_water), object: args)
        }, forName: OBEventIdentifier_is_show_run_water)
        
        OBChannelManager.instance().addEventListener({ key, args in
            OBChannelManager.instance().sendEventToFlutter(with: "gameUtilDestory", arguments: nil)
            if let controller = self.window.rootViewController as? UINavigationController {
                controller.popToRootViewController(animated: true)
            }
        }, forName: OBEventIdentifier_backUntilNativeEvent)
        
        OBChannelManager.instance().addEventListener({ key, args in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: OBEventIdentifier_autoTransfer), object: args)
        }, forName: OBEventIdentifier_autoTransfer)
        
        OBChannelManager.instance().addEventListener({ key, args in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: OBEventIdentifier_walletList), object: args)
        }, forName: OBEventIdentifier_walletList)
        
        OBChannelManager.instance().addEventListener({ key, args in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: OBEventIdentifier_transferAction), object: args)
        }, forName: OBEventIdentifier_transferAction)
        
        OBChannelManager.instance().addEventListener({ key, args in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: OBEventIdentifier_recycleAll), object: args)
        }, forName: OBEventIdentifier_recycleAll)
        
        OBChannelManager.instance().addEventListener({ key, args in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: OBEventIdentifier_eventGetWaterInfo), object: args)
        }, forName: OBEventIdentifier_eventGetWaterInfo)
        
        OBChannelManager.instance().addEventListener({ key, args in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: OBEventIdentifier_showTransferDialogEvent), object: args)
        }, forName: OBEventIdentifier_showTransferDialogEvent)
        
        OBChannelManager.instance().addEventListener({ key, args in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: OBEventIdentifier_eventDialogTransferAction), object: args)
        }, forName: OBEventIdentifier_eventDialogTransferAction)
        
        OBChannelManager.instance().addEventListener({ key, args in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: OBEventIdentifier_eventIdentifierGameTypeList), object: args)
        }, forName: OBEventIdentifier_eventIdentifierGameTypeList)
        
        OBChannelManager.instance().addEventListener({ key, args in
            if let message = args["message"] as? String{
                OBProgressHUD.showMessage(text: message)
            }
        }, forName: "show_native_toast")

        OBChannelManager.instance().addEventListener({ key, args in
            let message = args["message"] as? String ?? ""
            OBProgressHUD.showLoading(text: message)
        }, forName: "show_native_loading")

        OBChannelManager.instance().addEventListener({ key, args in
            OBProgressHUD.dismissLoading()
        }, forName: "dismiss_native_loading")
        
        OBChannelManager.instance().addEventListener({ key, args in
            if let languages = args["languages"] as? String{
                let code = self.languagesMapString(lang: languages)
                LanguageManager.saveLanguage(byName: code)
            }
        }, forName: OBEventIdentifier_syncNativeLanguages)
        
        OBChannelManager.instance().addEventListener({ key, args in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: OBEventIdentifier_customerServiceUrl), object: args)
        }, forName: OBEventIdentifier_customerServiceUrl)
        
        OBChannelManager.instance().addEventListener({ key, args in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: OBEventIdentifier_eventIdentifierDyGameList), object: args)
        }, forName: OBEventIdentifier_eventIdentifierDyGameList)
        
        
   
    }
    
    open func registerNotification() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "OBProgressHUDKey"), object: nil, queue: nil) { noti in
            if let user = noti.userInfo as NSDictionary? {
                if let type = user["type"] as? String{
                    let text = user["text"] as? String ?? "";
                    if type == "message" {
                        OBProgressHUD.showMessage(text: text)
                    }else if type == "loading" {
                        OBProgressHUD.showLoading(text: text)
                    }else if type == "dismiss" {
                        OBProgressHUD.dismissLoading()
                    }
                }
            }
            
        }
    }
    
    open func languagesMapString(lang code: String) -> String {
        
        var res = "en"
        switch code {
        case "zh":
            res = "zh-Hans"
        case "en":
            res = "en"
        case "th":
            res = "th"
        case "vi":
            res = "vi"
        case "ms":
            res = "ms"
        default:
            res = "en"
        }
        
        return res
    }
}

