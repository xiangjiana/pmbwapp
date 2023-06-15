//
//  TransferAlertView.h
//  Runner
//
//  Created by Tmoson on 2022/2/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^OBTransferAlertBlock)(void);

@interface TransferAlertView : UIView

- (instancetype)initGameCode:(NSString *)gameCode walletAmount:(NSString *)walletAmount args:(NSDictionary *)args SureBlock:(OBTransferAlertBlock)sureBlock;

@end

NS_ASSUME_NONNULL_END
