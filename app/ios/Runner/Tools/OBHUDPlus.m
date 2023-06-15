//
//  OBHUDPlus.m
//  Runner
//
//  Created by Tmoson on 2022/2/23.
//

#import "OBHUDPlus.h"

@implementation OBHUDPlus

+ (void)showMessage:(NSString *)text {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"OBProgressHUDKey" object:nil userInfo:@{@"type" : @"message",@"text" : text}];
}

+ (void)showLoading:(NSString *)text {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"OBProgressHUDKey" object:nil userInfo:@{@"type" : @"loading",@"text" : text ?: @""}];
}

+ (void)dismissLoading {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"OBProgressHUDKey" object:nil userInfo:@{@"type" : @"dismiss",@"text" : @""}];
}

@end
