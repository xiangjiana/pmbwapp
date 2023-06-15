//
//  GameTypeListModel.h
//  Runner
//
//  Created by Tmoson on 2022/9/19.
//

#import "YYModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameModel : NSObject<NSCopying>

@property (nonatomic, strong) NSString *venueCode;

@property (nonatomic, strong) NSString *venueName;

@property (nonatomic, strong) NSString *venueType;

@property (nonatomic, strong) NSString *venueTypeName;

@property (nonatomic, strong) NSString *isOb;

@property (nonatomic, strong) NSString *status;

@property (nonatomic, strong) NSString *currencyTypes;

@property (nonatomic, strong) NSString *languageTypes;

@property (nonatomic, strong) NSString *venueIconUrlApp;

@property (nonatomic, strong) NSString *venueTransferIconUrlApp;

@property (nonatomic, strong) NSString *walletNames;

@property (nonatomic, assign) BOOL selected;

@end

@interface GameTypeListModel : NSObject<NSCopying>

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *venueTypeCode;

@property (nonatomic, strong) NSMutableArray <GameModel *>*venueList;

@property (nonatomic, assign) BOOL selected;

@end

@interface GameDataListModel : NSObject<NSCopying>

@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) NSMutableArray <GameTypeListModel *>*list;

@end

@interface DyGameModel : NSObject<NSCopying>

@property (nonatomic, strong) NSString *gameId;

@property (nonatomic, strong) NSString *venueCode;

@property (nonatomic, strong) NSString *gameName;

@property (nonatomic, strong) NSString *accessInfo;

@property (nonatomic, strong) NSString *iconStatus;

@property (nonatomic, strong) NSString *supportTerminals;

@property (nonatomic, strong) NSString *iconUrl;

@property (nonatomic, strong) NSString *description;

@property (nonatomic, strong) NSString *remark;

@property (nonatomic, strong) NSString *status;

@property (nonatomic, strong) NSString *createdBy;

@property (nonatomic, strong) NSString *createdAt;

@property (nonatomic, strong) NSString *updatedBy;

@property (nonatomic, strong) NSString *updatedAt;

@end

@interface GameDyListModel : NSObject<NSCopying>

@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) NSMutableArray <DyGameModel *>*list;

@end

NS_ASSUME_NONNULL_END
