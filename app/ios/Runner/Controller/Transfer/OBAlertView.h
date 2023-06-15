//
//  OBAlertView.h
//  Runner
//
//  Created by Tmoson on 2022/2/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^OBAlertBlock)(void);

@interface OBAlertView : UIView

@property (nonatomic, copy) OBAlertBlock sureBlock;

@property (nonatomic, copy) OBAlertBlock cancelBlock;

+ (instancetype)createAlertTitle:(NSString *)title confirmColor:(BOOL)isPurple content:(NSString *)content cancelBlock:(nullable OBAlertBlock)cancelBlock cancelTitle:(nullable NSString *)cancelTitle sureBlock:(OBAlertBlock)sureBlock sureTitle:(NSString *)sureTitle;

+ (instancetype)createAlertTitle:(NSString *)title confirmColor:(BOOL)isPurple content:(NSString *)content sureBlock:(OBAlertBlock)sureBlock sureTitle:(NSString *)sureTitle;

@end

NS_ASSUME_NONNULL_END
