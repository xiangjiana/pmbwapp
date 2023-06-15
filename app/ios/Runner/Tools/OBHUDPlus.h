//
//  OBHUDPlus.h
//  Runner
//
//  Created by Tmoson on 2022/2/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OBHUDPlus : NSObject

+ (void)showMessage:(NSString *)text;

+ (void)showLoading:(nullable NSString *)text;

+ (void)dismissLoading;

@end

NS_ASSUME_NONNULL_END
