//
//  WKWebViewController.swift
//  WebView
//
//  Created by leishen on 2022/1/27.
//

import UIKit
import WebKit

class WKWebViewController: UIViewController {
    
    
    var arguments: [AnyHashable : Any]?
    
    var gameCode: String?
    
    var gameType: String?
    
    var titleItem: UILabel?
    
    var titleLeft: String?
    
    var reset: Bool = false
    
    var dyGame: Bool = false
    
    var navigationBarHeight: CGFloat = 44.0;
    
    convenience init(arguments: [AnyHashable : Any]?) {
        self.init()
        
        self.navigationBarHeight = self.navigationController?.navigationBar.frame.size.height ?? 44.0
        self.arguments = arguments
        
        
        if let gameType = arguments?["gameType"] as? String{
            self.gameType = gameType
            resetLoadingImage()
            dyGame = (gameType == "dy")
        }
        
        if let gameCode = arguments?["gameCode"] as? String{
            self.gameCode = gameCode
        }
        
        if let title = arguments?["title"] as? String{
            self.titleLeft = title
            self.titleItem?.text = title
        }
        
        
        if let urlStr = arguments?["url"] as? String, let url = URL(string: urlStr) {
            self.load(request: URLRequest(url: url))
        }
        
        if dyGame {

            dyListContentView.dySetArguments(self.arguments)
            dyListContentView.isHidden = false
            
        }
    }
    
    public lazy var webView: WKWebView = {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        if #available(iOS 10.0, *) {
            // 此结构体为我们提供了三个静态值，分别为audio、video、all。audio则代表不自动播放音频
            config.mediaTypesRequiringUserActionForPlayback = []
        }
        else{
            // 必须用户操作才播放?
            config.mediaPlaybackRequiresUserAction = false
            // 必须用户操作才播放?
            config.requiresUserActionForMediaPlayback = false
        }
        let msgDelegate = WebWeakScriptMessageDelegate(delegate: self)
        let userContentController = WKUserContentController()
        //js 监听
        userContentController.add(msgDelegate, name: "APPBridge")
        //js 注入
        let wrapperSource = "window.APPBridge = webkit.messageHandlers.APPBridge;"
        let wrapperScript = WKUserScript(source: wrapperSource, injectionTime: .atDocumentStart, forMainFrameOnly: false)
        userContentController.addUserScript(wrapperScript)
        config.userContentController = userContentController
        
        let view = WKWebView(frame: .zero, configuration: config)
        view.uiDelegate = self
        view.navigationDelegate = self
        view.backgroundColor = UIColor(hex:0x171E24)
        view.scrollView.backgroundColor = UIColor(hex:0x171E24)
        if #available(iOS 13.0, *) {
            view.scrollView.automaticallyAdjustsScrollIndicatorInsets = false
        }
        else if #available(iOS 11.0, *) {
            view.scrollView.contentInsetAdjustmentBehavior = .never
        }
        else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        return view
    }()
    
    public lazy var loadingImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    public lazy var loadingContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex:0x171E24)
        view.addSubview(loadingImageView)
        return view
    }()
    
    private lazy var dyListContentView: GameDYListView = {
        let view : GameDYListView  = GameDYListView.init()
        view.delegate = self
        view.isHidden = true
        return view
    }()
    
    private lazy var depositFlowItem: UIButton = {
        let view = UIButton(type: .custom)
        view.addTarget(self, action: #selector(depositFlow(sender:)), for: .touchUpInside)
        view.imageView?.tintColor = UIColor.white.withAlphaComponent(0.6)
        let comRunningWater = DrawImageTools.drawFlutterImageBase(forSwift:"assets/images/icon/com_running_water.png")
        view.fitImage(image: comRunningWater, oriSize: CGSize(width: 40, height: navigationBarHeight))
        view.isHidden = true
        return view
    }()
    
    private lazy var closeItem: UIButton = {
        let viewItem = UIButton(type: .custom)
        viewItem.isEnabled = false
        viewItem.frame = CGRect(x: 0, y: 0, width: 56, height: navigationBarHeight)
        viewItem.imageView?.tintColor = UIColor.white.withAlphaComponent(0.6)
        viewItem.addTarget(self, action: #selector(closeAction(sender:)), for: .touchUpInside)
        let comCloseWhite = DrawImageTools.drawFlutterImageBase(forSwift: "assets/images/com_close_white.png")
        viewItem.fitImage(image: comCloseWhite, oriSize: CGSize(width: 56, height: navigationBarHeight))
        return viewItem
    }()
    
    private lazy var topStackView: UIStackView = {
        let rightItems = buildBarButton()
        let stackView = UIStackView(arrangedSubviews: rightItems)
        stackView.distribution = .fillEqually
        let width : CGFloat = CGFloat(rightItems.count) * 40.0
        stackView.frame = CGRect(x: self.view.bounds.width - width - 16 , y: 0, width: width, height: navigationBarHeight)
        return stackView
    }()
    
    private lazy var topNavView: UIView = {
        
        var height = navigationBarHeight + 1 + 52
        let view = UIView.init(frame: CGRect(x: 0, y: WindowPlus.topHeight(), width: self.view.bounds.width, height: height))
        view.backgroundColor = UIColor(hex:0x171E24)
        

        view.addSubview(self.closeItem)
        
        let titleTextLabel = UILabel(frame: CGRect(x: 56, y: 0, width: 130, height: navigationBarHeight))
        titleTextLabel.text = self.titleLeft
        titleTextLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleTextLabel.textColor = .white
        titleItem = titleTextLabel
        view.addSubview(titleTextLabel)
        
        view.addSubview(topStackView)
        
        view.addSubview(listView)
        
        view.addSubview(progressView)
        
        return view
    }()
    
    public lazy var progressView: UIProgressView = {
        var y = navigationBarHeight - 1 + 52
        let view = UIProgressView.init(frame: CGRect(x: 0, y: y, width: self.view.bounds.width, height: 1))
        view.backgroundColor = UIColor.clear
        view.progressTintColor = UIColor(hex: 0x3BC117)
        view.trackTintColor = UIColor.clear
        let transform = CGAffineTransform(scaleX: 1.0, y: 0.5)
        view.transform = transform;
        return view
    }()
    
    public lazy var listView: GameTypeListView = {
        let view : GameTypeListView  = GameTypeListView.init(frame: CGRect(x: 0 , y: navigationBarHeight, width: self.view.bounds.width, height: 52 + 24 + 90))
        view.delegate = self
        return view
    }()
    
    public lazy var dargdownButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "home_more_down"), for: .normal)
        btn.backgroundColor = UIColor(hex:0x171E24).withAlphaComponent(0.3)
        btn.addTarget(self, action: #selector(closefullScreen(sender:)), for: .touchUpInside)
        if #available(iOS 11.0, *) {
            btn.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        } else {
            // Fallback on earlier versions
        }
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    public var openDrawerClosures:(()->Void)?
    
    public var refreshClosures:(()->Void)?
    
    public var transferClosures:(()->Void)?
    
    public func load(request: URLRequest) {
        reset = false
        webView.load(request)
    }
    
    public func resetRightBarButtonItems(depositFlowHide: Bool) {
        if depositFlowHide {
            depositFlowItem.isHidden = true
            topStackView.removeArrangedSubview(depositFlowItem)
        }else {
            depositFlowItem.isHidden = false
            if topStackView.arrangedSubviews.contains(depositFlowItem) == false {
                topStackView.insertArrangedSubview(depositFlowItem, at: 1)
            }
        }
        
        
        let widthStack : CGFloat = CGFloat(topStackView.arrangedSubviews.count) * 40.0
        let frame = topStackView.frame;
        topStackView.frame = CGRect(x: self.view.bounds.width - widthStack - 16 , y: 0, width: widthStack, height: frame.height)
    }
    
    public func resetLoadingImage() {
        let image = gameType?.overPageImage()
        if (image != nil) {
            loadingImageView.image = image
            loadingImageView.frame = CGRect.init(x: 0, y: 0, width: loadingContentView.frame.size.width, height: loadingContentView.frame.size.width * image!.size.height / image!.size.width)
            self.loadingContentView.isHidden = false
        }
    }
    
    public func reload(){
        if let urlStr = self.arguments?["url"] as? String, let url = URL(string: urlStr) {
            self.load(request: URLRequest(url: url))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = ""
        modalPresentationStyle = .fullScreen
        view.backgroundColor = UIColor(hex: 0x151E25)
        navigationController?.view.backgroundColor = UIColor(hex: 0x151E25)
        navigationItem.leftItemsSupplementBackButton = false
        setNavigationStyle()
        
        view.addSubview(webView)
        webView.frame = webViewRect(for: view.bounds)

        view.addSubview(loadingContentView)
        loadingContentView.frame = webViewRect(for: view.bounds)
        
        view.addSubview(dyListContentView)
        dyListContentView.frame = webViewRect(for: view.bounds)
        
        view.addSubview(dargdownButton)
        dargdownButton.frame = dargdownButtonRect(for: view.bounds)
        
        view.addSubview(topNavView)
        
        registerNotification()
        
        resetLoadingImage()
        
        
        if self.gameType == "dy" {
            self.arguments?["url"] = "blank"
        }
        OBChannelManager.instance().sendEventToFlutter(with: "gameUtilInit", arguments: self.arguments)
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0, execute: {
            self.closeItem.isEnabled = true
        })
        
        OBChannelManager.instance().sendEventToFlutter(with: OBEventIdentifier_eventIdentifierGameTypeList, arguments: ["type":"get"])
                
        if self.gameType == "dy" {
            weak var weakself = self
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2, execute: {
                if let stackView = weakself?.topStackView {
                    for view in stackView.arrangedSubviews {
                        if let btn = view as? UIButton {
                            btn.isEnabled = true
                        }
                    }
                }
            })

            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
                weakself?.fullScreen(sender: nil)
            })
        }
        
    }
    
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(showTransferDialogListen(notification:)), name: NSNotification.Name(rawValue: OBEventIdentifier_showTransferDialogEvent), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(eventGetWaterInfoListen(notification:)), name: NSNotification.Name(rawValue: OBEventIdentifier_eventGetWaterInfo), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showRunWaterListen(notification:)), name: NSNotification.Name(rawValue: OBEventIdentifier_is_show_run_water), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(webViewPageEventReloadListen(notification:)), name: NSNotification.Name(rawValue: OBEventIdentifier_webViewPageEvent_reload), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(webViewPageEventSeturlListen(notification:)), name: NSNotification.Name(rawValue: OBEventIdentifier_webViewPageEvent_seturl), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(eventIdentifierGameTypeListListen(notification:)), name: NSNotification.Name(rawValue: OBEventIdentifier_eventIdentifierGameTypeList), object: nil)
    }

    func deleteNotification() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: OBEventIdentifier_showTransferDialogEvent), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: OBEventIdentifier_eventGetWaterInfo), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: OBEventIdentifier_is_show_run_water), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: OBEventIdentifier_webViewPageEvent_reload), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: OBEventIdentifier_webViewPageEvent_seturl), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: OBEventIdentifier_eventIdentifierGameTypeList), object: nil)
    }
    
    @objc func showTransferDialogListen(notification : NSNotification) {
        if let dict = notification.object as? NSDictionary {
            if let type = dict["type"] as? String {
                if type == "getNative" {
                    let alertView = TransferAlertView(gameCode: dict["gameCode"] as? String ?? "", walletAmount: dict["centerAmount"] as? String ?? "", args: dict as! [AnyHashable : Any]) {
                        
                    }
                    self.view.addSubview(alertView)
                }
            }
        }
    }
    
    @objc func eventGetWaterInfoListen(notification : NSNotification) {
        if let dict = notification.object as? NSDictionary {
            if let gameCode = dict["gameCode"] as? String, let _ = dict["depositFlow"] as? String{
                let waterInfoView = WaterInfoAlertView.init(gameCode: gameCode, dict: dict as! [AnyHashable : Any])
                self.view.addSubview(waterInfoView);
            }
        }
    }
    
    @objc func showRunWaterListen(notification : NSNotification) {
        if let dict = notification.object as? NSDictionary {
            if let isHide = dict["isHide"] as? Bool {
                self.resetRightBarButtonItems(depositFlowHide: isHide)
            }
        }
    }
    
    @objc func webViewPageEventReloadListen(notification : NSNotification) {
        self.reload()
    }
    
    @objc func webViewPageEventSeturlListen(notification : NSNotification) {
        if let args = notification.object as? NSDictionary {
            OBProgressHUD.dismissLoading()
            
            self.arguments = args as? [AnyHashable : Any]
            
            if let gameType = args["gameType"] as? String{
                self.gameType = gameType
                self.resetLoadingImage()
                dyGame = (gameType == "dy")
            }
            
            if let gameCode = args["gameCode"] as? String{
                self.gameCode = gameCode
            }

            if let title = args["title"] as? String{
                self.titleLeft = title
                self.titleItem?.text = title
            }
            if let isScrollEnabled = args["isScrollEnabled"] as? Bool {
                // 真人滚动时有BUG
                self.webView.scrollView.isScrollEnabled = isScrollEnabled
            }

            if let urlStr = args["url"] as? String, let url = URL(string: urlStr) {
                if (urlStr.count > 0) {
                    self.load(request: URLRequest(url: url))
                }
            }
  
        }
    }
    
    @objc func eventIdentifierGameTypeListListen(notification : NSNotification) {
        
        if let dict = notification.object as? NSDictionary {
            
            let data = dict["data"]
            listView.filldAnyDatas(data as Any)
            listView.curGameCode = gameCode ?? ""
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        webView.removeObserver(self, forKeyPath: "estimatedProgress", context: nil)
    }
    
    deinit {
        deleteNotification()
        
        OBChannelManager.instance().sendEventToFlutter(with: "gameUtilDestory", arguments: nil)
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    private func setNavigationStyle(){

        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor(hex:0x171E24)
            self.navigationController?.navigationBar.standardAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = appearance;
        } else {
            self.navigationController?.navigationBar.barTintColor = UIColor(hex:0x171E24)
        }
    }
    
    private func buildBarButton() -> [UIButton]{
        
        let transferItem = UIButton(type: .custom)
        transferItem.isEnabled = false
        transferItem.addTarget(self, action: #selector(transfer(sender:)), for: .touchUpInside)
        transferItem.imageView?.tintColor = UIColor.white.withAlphaComponent(0.6)
        let comAccount = DrawImageTools.drawFlutterImageBase(forSwift: ("assets/images/com_account.png"))
        transferItem.fitImage(image: comAccount, oriSize: CGSize(width: 40, height: navigationBarHeight))
        
        let refreshItem = UIButton(type: .custom)
        refreshItem.isEnabled = false
        refreshItem.addTarget(self, action: #selector(refreshAction(sender:)), for: .touchUpInside)
        refreshItem.imageView?.tintColor = UIColor.white.withAlphaComponent(0.6)
        let comRefresh = DrawImageTools.drawFlutterImageBase(forSwift: ("assets/images/com_refresh.png"))
        refreshItem.fitImage(image: comRefresh, oriSize: CGSize(width: 40, height: navigationBarHeight))
        
        let fullSrceenItem = UIButton(type: .custom)
        fullSrceenItem.isEnabled = false
        fullSrceenItem.addTarget(self, action: #selector(fullScreen(sender:)), for: .touchUpInside)
        fullSrceenItem.imageView?.tintColor = UIColor.white.withAlphaComponent(0.6)
        let comFullscreen = DrawImageTools.drawFlutterImageBase(forSwift: ("assets/images/com_fullscreen.png"))
        fullSrceenItem.fitImage(image: comFullscreen, oriSize: CGSize(width: 40, height: navigationBarHeight))
     
        return [transferItem,refreshItem,fullSrceenItem]
    }
    
    private func hideDargButton(){
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseInOut]) {
            self.topNavView.transform = .identity
            self.dargdownButton.transform = .init(translationX: 0, y: -124)
        } completion: { finish in
            
        }
    }
    
    private func showDragButton(){
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseInOut]) {
            self.topNavView.transform = .init(translationX: 0, y: -(self.topNavView.frame.size.height + 300))
            self.dargdownButton.transform = .identity
        } completion: { finish in
            
        }
    }
    
    private func webViewRect(for bounds: CGRect) -> CGRect {
        if #available(iOS 11.0, *) {
            let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
            var top = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
            if top == 0 {top = 20}
            return .init(x: 0, y: top, width: bounds.width, height: bounds.height - top - bottom)
        } else {
            return .init(x: 0, y: 0, width: bounds.width, height: bounds.height)
        }
    }
    
    private func dargdownButtonRect(for bounds: CGRect) -> CGRect {
        if #available(iOS 11.0, *) {
            var top = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
            if top == 0 {top = 20}
            return .init(x: (bounds.width - 24) * 0.5, y: top, width: 40, height: 24)
        } else {
            return .init(x: (bounds.width - 24) * 0.5, y: 0, width: 40, height: 24)
        }
    }
    
    @objc private func openDrawer(sender: UIButton?) {
//        openDrawerClosures?()
    }
    
    @objc private func fullScreen(sender: UIButton?) {
        self.showDragButton()
    }
    
    @objc private func closefullScreen(sender: UIButton?) {
        self.hideDargButton()
    }
    
    @objc private func transfer(sender: UIButton?) {
        let transferVC = TransferViewController()
        transferVC.title = NSLocalizedString("home_icon_transfer", comment: "")
        self.navigationController?.pushViewController(transferVC, animated: true)
    }
    
    @objc private func depositFlow(sender: UIButton?) {
        OBChannelManager.instance().sendEventToFlutter(with: OBEventIdentifier_eventGetWaterInfo, arguments: ["gameCode" : gameCode ?? "","depositFlow" : "depositFlow"])
    }
    
    @objc private func refreshAction(sender: UIButton?) {
        
        sender?.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.3, execute: {
            sender?.isEnabled = true
        })
        
        self.webView.resignFirstResponder()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.45, execute: {
            if sender != nil {
                OBChannelManager.instance().sendEventToFlutter(with: "onClickReload", arguments: self.arguments);
            }
        })
        
    }
    
    @objc private func closeAction(sender: UIButton?) {
        
        let alertView = OBAlertView.createAlertTitle(NSLocalizedString("alert", comment: ""), confirmColor:false, content: NSLocalizedString("confirm_exit_game", comment: ""), cancel: {
            
        }, cancelTitle: NSLocalizedString("cancel", comment: ""), sureBlock: {
            if self.navigationController?.viewControllers.isEmpty == false {
                self.navigationController?.popViewController(animated: true)
                OBChannelManager.instance().sendEventToFlutter(with: "gameUtilDestory", arguments: nil)
            }else{
                self.dismiss(animated: true) {
                    OBChannelManager.instance().sendEventToFlutter(with: "gameUtilDestory", arguments: nil)
                }
            }
        }, sureTitle: NSLocalizedString("confirm", comment: ""))
        
        self.view .addSubview(alertView)
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
          progressView.isHidden = false
          let float = (change?[NSKeyValueChangeKey.newKey] as! NSNumber).floatValue
            
            if reset == true {
                if float > progressView.progress {
                    progressView.progress = float
                }
            }else {
                progressView.progress = float
            }
            
            if reset == false {
                reset = true
            }
        
            if float == 1 {
                weak var weakself = self
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2, execute: {
                    weakself?.progressView.isHidden = true
                })
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
                    weakself?.fullScreen(sender: nil)
                })
            }
            if (webView.url != nil && float >= 0.99) {
                weak var weakself = self
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
                    weakself?.loadingContentView.isHidden = true
                })
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2, execute: {
                    if let stackView = weakself?.topStackView {
                        for view in stackView.arrangedSubviews {
                            if let btn = view as? UIButton {
                                btn.isEnabled = true
                            }
                        }
                    }
                })
            }
        }else{
          super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
      }
    
    func gameUtilDestory() -> Void {
        OBChannelManager.instance().sendEventToFlutter(with: "gameUtilDestory", arguments: nil)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

extension WKWebViewController: WKUIDelegate {
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame?.isMainFrame != true || navigationAction.targetFrame == nil {
            if gameCode == "hash" {
                let webVC = WebPageViewController.init(title: "" , url: navigationAction.request.url!)
                self.navigationController?.pushViewController(webVC, animated: true)

            } else {
                webView.load(navigationAction.request)
            }
        }
        return nil
    }

}

extension WKWebViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "APPBridge" {
            if let dict = message.body as? NSDictionary {
                
                if let urlStr = dict["url"] as? String, let url = URL(string: urlStr) {
                    let webVC = WebPageViewController.init(title: "" , url: url)
                    self.navigationController?.pushViewController(webVC, animated: true)
                }
            }
        }
    }
}

extension WKWebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        if let urlStr = navigationAction.request.url?.absoluteString as String? {
            if (urlStr.lowercased().hasPrefix("http://finishtoback") || urlStr.lowercased().hasPrefix("https://finishtoback")) {
                decisionHandler(.cancel)
                gameUtilDestory()
                return
            }
            
            // 真人
            if gameCode == "zr", urlStr.lowercased().hasPrefix("https://appback.com") {
                decisionHandler(.cancel)
                gameUtilDestory()
                return
            }
            
            //wgb 斗鸡 左侧导航栏-真人，点击斗鸡，在B端中点击关闭-继续 返回黑屏 加载 https://transfer.gamefowlboxing.live/null
            if gameCode == "wgb", urlStr.lowercased().hasPrefix("https://transfer.gamefowlboxing.live/null") {
                decisionHandler(.cancel)
                gameUtilDestory()
                return
            }
            
            if urlStr.lowercased().hasPrefix("pasteorderaction") {
                decisionHandler(.cancel)
                return
            }
            
        }
        decisionHandler(.allow)
    }
    
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        
        let type = DeviceUtils.deviceType()
        if (type == .iPhone_XS_Max || type == .IPhone_6P) {
            if webView.url != nil {
                webView.reload()
            }
        }
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        OBChannelManager.instance().sendEventToFlutter(with: "gameWebLoadUrlError", arguments: ["gameCode": gameCode ?? "","url" : webView.url ?? ""])
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        print("context===\(webView.value(forKeyPath: "document"))")
        
    }
  
}

extension WKWebViewController : GameDYListViewDelegate {
    func dyListAction(_ arguments: Any) {
        
        if ((arguments as? [AnyHashable : Any]) != nil) {
            
            self.arguments = arguments as! [AnyHashable : Any]
            dyListContentView.isHidden = true
            self.arguments?["type"] = "get"
            
            OBProgressHUD.showLoading(text: "Loading...")
            OBChannelManager.instance().sendEventToFlutter(with: OBEventIdentifier_webViewPageEvent_seturl, arguments: self.arguments)
        }

    }
    
    func dyListback() {
        gameUtilDestory()
    }
    
    func dyListTap() {
        fullScreen(sender: nil)
    }
}

extension WKWebViewController : GameTypeListViewDelegate {
    func typeListAction(_ listModel: GameModel) {
        

        if (self.arguments != nil) {
            self.arguments?["gameType"] = listModel.venueType
            self.arguments?["gameCode"] = listModel.venueCode
            
            self.gameType = listModel.venueType
            self.gameCode = listModel.venueCode
            
            self.resetLoadingImage()
            
            self.arguments?["url"] = ""

            self.arguments?["title"] = listModel.venueName
            self.titleLeft = listModel.venueName
            self.titleItem?.text = self.titleLeft
            
            self.listView.gameSkip = false
            
            if listModel.venueType == "dy" {
                
                dyListContentView.dySetArguments(self.arguments)
                dyListContentView.isHidden = false
              
                return
            }
            
            dyListContentView.isHidden = true
            self.arguments?["type"] = "get"
            
            OBProgressHUD.showLoading(text: "Loading...")
            OBChannelManager.instance().sendEventToFlutter(with: OBEventIdentifier_webViewPageEvent_seturl, arguments: self.arguments)
        }
        
        
    }
    
    func typeListFrame(_ frame: CGRect) {
        let tf = topNavView.frame;
        topNavView.frame = CGRect(x: tf.origin.x, y: tf.origin.y, width: tf.size.width, height: navigationBarHeight + frame.size.height + 1)
    }
}


extension UIBarButtonItem {
    convenience init(image: UIImage?, target: Any?, action: Selector?) {
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        if let target = target, let action = action {
            button.addTarget(target, action: action, for: .touchUpInside)
        }
        self.init(customView: button)
    }
    
    convenience init(title: String?, font: UIFont?, target: Any?, action: Selector?) {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = font
        if let target = target, let action = action {
            button.addTarget(target, action: action, for: .touchUpInside)
        }
        self.init(customView: button)
    }
}

extension UIButton {
    func fitImage(image: UIImage?, oriSize: CGSize) -> Void {
        self.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        self.setImage(image?.withRenderingMode(.alwaysTemplate), for: .disabled)
        let cSize = image?.size ?? CGSize.zero
        let clr = (oriSize.width - cSize.width / 3) * 0.5;
        let ctb = (oriSize.height - cSize.height / 3) * 0.5;
        self.imageEdgeInsets = UIEdgeInsets(top: ctb, left: clr, bottom: ctb, right: clr)
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")
       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(hex: Int) {
       self.init(red: (hex >> 16) & 0xFF, green: (hex >> 8) & 0xFF,blue: hex & 0xFF)
   }
}

extension String {
    func overPageImage() -> UIImage? {
        var name = ""
        switch self {
        case "zr":
            name = "cg_jump_zhenren"
        case "dj":
            name = "cg_jump_dianjing"
        case "ty":
            name = "cg_jump_tiyu"
        case "by":
            name = "cg_jump_buyu"
        case "qp":
            name = "cg_jump_qipai"
        case "qkl":
            name = "cg_jump_qukuailian"
        case "cp":
            name = "cg_jump_caipiao"
        case "dy":
            name = "cg_jump_dianzi"
        default:
            name = ""
        }
        
        if name != "" {
            return DrawImageTools.drawFlutterImageBase(forSwift: ("assets/images/venue/" + name + ".png"))
        } else {
            return nil
        }
        
    }
}
