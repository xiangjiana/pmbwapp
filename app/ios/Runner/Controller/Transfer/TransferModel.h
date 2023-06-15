//
//  TransferModel.h
//  Runner
//
//  Created by Tmoson on 2022/2/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlowDetailModel : NSObject<NSCopying>

@property (nonatomic, copy) NSString *activityName;

@property (nonatomic, copy) NSString *billAmount;

@property (nonatomic, copy) NSString *completeBillAmount;

@property (nonatomic, copy) NSString *percentage;

@end

@interface TransferModel : NSObject<NSCopying>

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *balance;

@property (nonatomic, strong, readonly) NSString *balanceDisplay;

@property (nonatomic, strong, readonly) NSString *balanceDisplayPlusK;

@property (nonatomic, strong) NSString *walletId;

@property (nonatomic, strong) NSString *status;

@property (nonatomic, strong) NSString *vipActivityGoing;

@property (nonatomic, strong) NSString *needMoreWater;

@property (nonatomic, strong) NSString *venueIconUrlApp;

@property (nonatomic, strong) NSString *venueWalletIconUrl;

@property (nonatomic, assign) BOOL selected;

@property (nonatomic, assign) BOOL unfold;

@property (nonatomic, strong) FlowDetailModel *flowDetailModel;

@property (nonatomic, assign) CGFloat dataHeight;


+ (instancetype)model:(NSString *)name balance:(NSString *)balance walletId:(NSString *)walletId status:(NSString *)status vipActivityGoing:(NSString *)vipActivityGoing needMoreWater:(NSString *)needMoreWater venueIconUrlApp:(NSString *)venueIconUrlApp venueWalletIconUrl:(NSString *)venueWalletIconUrl;

@end

NS_ASSUME_NONNULL_END
