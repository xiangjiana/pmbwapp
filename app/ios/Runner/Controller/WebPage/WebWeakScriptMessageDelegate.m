//
//  WebWeakScriptMessageDelegate.m
//  Runner
//
//  Created by Tmoson on 2022/9/21.
//

#import "WebWeakScriptMessageDelegate.h"

@implementation WebWeakScriptMessageDelegate

- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate {
    self = [super init];
    if (self) {
        _scriptDelegate = scriptDelegate;
    }
    return self;
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    [self.scriptDelegate userContentController:userContentController didReceiveScriptMessage:message];
}

@end
