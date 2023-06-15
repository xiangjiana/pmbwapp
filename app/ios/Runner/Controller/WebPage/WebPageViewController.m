//
//  WebPageViewController.m
//  Runner
//
//  Created by Tmoson on 2022/8/9.
//

#import "WebPageViewController.h"
#import <WebKit/WebKit.h>
#import <Masonry/Masonry.h>
#import "WebWeakScriptMessageDelegate.h"
#import "YYModel.h"

@interface WebJSModel : NSObject<NSCopying>

@property (nonatomic, strong) NSString *method;

@end

@implementation WebJSModel

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [self yy_modelEncodeWithCoder:aCoder];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        [self yy_modelInitWithCoder:aDecoder];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    return [self yy_modelCopy];
}

- (id)mutableCopyWithZone:(NSZone *)zone{
    return [self yy_modelCopy];
}

- (id)mutableCopy{
    return [self yy_modelCopy];
}

- (id)copy{
    return [self yy_modelCopy];
}

@end

@interface WebPageViewController () <WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler>

@property (nonatomic, strong) WKWebView *webView;

@property (nonatomic, strong) NSURL *curUrl;

@property (nonatomic, strong) NSString *htmlString;

@end

@implementation WebPageViewController

- (instancetype)initWithTitle:(NSString *)title url:(NSURL *)url {
    if (self = [super init]) {
        self.titleLabel.text = title;
        self.curUrl = url;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title htmlString:(NSString *)htmlString {
    if (self = [super init]) {
        self.titleLabel.text = title;
        self.htmlString = htmlString;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setUpUI];
    
    if (self.htmlString != nil) {
        [self.webView loadHTMLString:self.htmlString baseURL:nil];
    }
    
    if (self.curUrl != nil) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:self.curUrl]];
    }
    
}

- (void)setUpUI {
    
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.hiddenNav ? kLayoutStatusBarHeight : kLayoutNavbarHeight);
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-kLayoutBottomSafeArea);
    }];
    
}

- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
    if (!navigationAction.targetFrame.isMainFrame) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    if (self.curUrl != nil) {
        NSString *absoluteURLStr = navigationAction.request.URL.absoluteString.lowercaseString;
        if ([absoluteURLStr hasPrefix:@"about:blank"]) {
            decisionHandler(WKNavigationActionPolicyCancel);
            [self backButtonClick:nil];
            return;
        }
    }
    
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    if ([message.name isEqualToString:@"FlutterBridge"]) {
        WebJSModel *model = [WebJSModel yy_modelWithJSON:message.body];
        if (model != nil) {
            NSString *value = model.method;
            if (value != nil && [value isKindOfClass:[NSString class]] && [value isEqualToString:@"back"]) {
                [self backButtonClick:nil];
            }
        }
     }
}

- (WKWebView *)webView {
    if (_webView == nil) {
        
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        
        if (@available(iOS 10.0, *)) {
            // 此结构体为我们提供了三个静态值，分别为audio、video、all。audio则代表不自动播放音频
            config.mediaTypesRequiringUserActionForPlayback = WKAudiovisualMediaTypeNone;
        }
        
        config.allowsInlineMediaPlayback = YES;
        
        WebWeakScriptMessageDelegate *msgDelegate = [[WebWeakScriptMessageDelegate alloc] initWithDelegate:self];
        WKUserContentController *userContentController = [[WKUserContentController alloc] init];
        //js 监听
        [userContentController addScriptMessageHandler:msgDelegate name:@"FlutterBridge"];
        //js 注入
        NSString* wrapperSource = @"window.FlutterBridge = webkit.messageHandlers.FlutterBridge;";
        WKUserScript* wrapperScript =
            [[WKUserScript alloc] initWithSource:wrapperSource
                                   injectionTime:WKUserScriptInjectionTimeAtDocumentStart
                                forMainFrameOnly:NO];
        [userContentController addUserScript:wrapperScript];
        config.userContentController = userContentController;
        
        _webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:config];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        _webView.backgroundColor = RGB(17, 20, 37);
        _webView.scrollView.backgroundColor = RGB(17, 20, 37);
        
        if (@available(iOS 13.0, *)) {
            _webView.scrollView.automaticallyAdjustsScrollIndicatorInsets = NO;
        }
            
        if (@available(iOS 11.0, *)) {
            _webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _webView;
}

@end
