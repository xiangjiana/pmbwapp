//
//  TransferModel.m
//  Runner
//
//  Created by Tmoson on 2022/2/21.
//

#import "TransferModel.h"
#import "YYModel.h"
#import "NSString+MKAdd.h"

@implementation FlowDetailModel

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

- (NSString *)activityName {
    if (_activityName == nil) {
        _activityName = @"";
    }
    return _activityName;
}

- (NSString *)billAmount {
    if (_billAmount == nil) {
        _billAmount = @"0.00";
    }
    return _billAmount;
}

- (NSString *)completeBillAmount {
    if (_completeBillAmount == nil) {
        _completeBillAmount = @"0.00";
    }
    return _completeBillAmount;
}

- (NSString *)percentage {
    if (_percentage == nil) {
        _percentage = @"0.00%";
    }
    return _percentage;
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

@implementation TransferModel

+ (instancetype)model:(NSString *)name balance:(NSString *)balance walletId:(NSString *)walletId status:(NSString *)status vipActivityGoing:(NSString *)vipActivityGoing needMoreWater:(NSString *)needMoreWater venueIconUrlApp:(NSString *)venueIconUrlApp venueWalletIconUrl:(NSString *)venueWalletIconUrl {
    TransferModel *model = [[TransferModel alloc] init];
    model.name = name;
    model.balance = balance;
    model.walletId = walletId;
    model.status = status;
    model.vipActivityGoing = vipActivityGoing;
    model.needMoreWater = needMoreWater;
    model.venueIconUrlApp = venueIconUrlApp;
    model.venueWalletIconUrl = venueWalletIconUrl;
    return  model;
}


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

-(FlowDetailModel *)flowDetailModel {
    if (_flowDetailModel == nil) {
        _flowDetailModel = [[FlowDetailModel alloc] init];
    }
    return _flowDetailModel;
}

- (NSString *)balanceDisplayPlusK {
    return [self.balance numDisplayDec:YES];
}

- (NSString *)balanceDisplay {
    return [self.balance numDisplayDec:NO];
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
