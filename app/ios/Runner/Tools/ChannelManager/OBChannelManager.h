//
//  OBChannelManager.h
//  Runner
//
//  Created by Tmoson on 2022/2/20.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSString * OBChannelEventIdentifier;

extern OBChannelEventIdentifier const OBEventIdentifier_eventsyncwalletamount;
extern OBChannelEventIdentifier const OBEventIdentifier_autoTransfer;
extern OBChannelEventIdentifier const OBEventIdentifier_walletList;
extern OBChannelEventIdentifier const OBEventIdentifier_transferAction;
extern OBChannelEventIdentifier const OBEventIdentifier_recycleAll;
extern OBChannelEventIdentifier const OBEventIdentifier_eventGetWaterInfo;
extern OBChannelEventIdentifier const OBEventIdentifier_showTransferDialogEvent;
extern OBChannelEventIdentifier const OBEventIdentifier_eventDialogTransferAction;
extern OBChannelEventIdentifier const OBEventIdentifier_backUntilNativeEvent;
extern OBChannelEventIdentifier const OBEventIdentifier_is_show_run_water;
extern OBChannelEventIdentifier const OBEventIdentifier_webViewPageEvent_reload;
extern OBChannelEventIdentifier const OBEventIdentifier_webViewPageEvent_seturl;
extern OBChannelEventIdentifier const OBEventIdentifier_eventIdentifierGameTypeList;
extern OBChannelEventIdentifier const OBEventIdentifier_syncNativeLanguages;
extern OBChannelEventIdentifier const OBEventIdentifier_customerServiceUrl;
extern OBChannelEventIdentifier const OBEventIdentifier_eventIdentifierDyGameList;

typedef void (^FBEventListener) (NSString *name ,
                                 NSDictionary *arguments);
typedef void (^FBVoidCallback)(void);

@interface OBChannelManager : NSObject

@property(readonly, strong, nonatomic) FlutterViewController *registrar;

+ (instancetype)instance;

- (void)setUp:(id<FlutterBinaryMessenger>)binaryMessenger;

- (void)obRegistry:(FlutterViewController *)registrar;

- (FBVoidCallback)addEventListener:(FBEventListener)listener forName:(NSString *)key;

- (void)sendEventToFlutterWith:(NSString*)key arguments:(nullable NSDictionary*)arguments;

@end

NS_ASSUME_NONNULL_END
