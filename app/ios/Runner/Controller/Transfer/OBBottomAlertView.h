//
//  OBBottomAlertView.h
//  Runner
//
//  Created by Tmoson on 2022/2/22.
//

#import <UIKit/UIKit.h>
#import "TransferModel.h"
#import "OBChannelManager.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^OBTransferBlock)(TransferModel *model);

@interface OBBottomAlertView : UIView

- (instancetype)initWith:(NSMutableArray *)array selId:(NSString *)selId isTransferOut:(BOOL)isTransferOut callBack:(nonnull OBTransferBlock)callBack;

- (void)resetArray:(NSMutableArray *)array;

@end

NS_ASSUME_NONNULL_END
