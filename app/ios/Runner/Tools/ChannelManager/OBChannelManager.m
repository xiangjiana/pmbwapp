//
//  OBChannelManager.m
//  Runner
//
//  Created by Tmoson on 2022/2/20.
//

#import "OBChannelManager.h"
#import "OBCommonParams.h"

static NSDictionary<NSString*, id>* wrapResult(NSDictionary *result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = @{
        @"code": (error.code ? error.code : [NSNull null]),
        @"message": (error.message ? error.message : [NSNull null]),
        @"details": (error.details ? error.details : [NSNull null]),
        };
  }
  return @{
      @"result": (result ? result : [NSNull null]),
      @"error": errorDict,
      };
}

OBChannelEventIdentifier const OBEventIdentifier_eventsyncwalletamount = @"eventsyncwalletamount";
OBChannelEventIdentifier const OBEventIdentifier_autoTransfer = @"OBEventIdentifier_autoTransfer";
OBChannelEventIdentifier const OBEventIdentifier_walletList = @"OBEventIdentifier_walletList";
OBChannelEventIdentifier const OBEventIdentifier_transferAction = @"OBEventIdentifier_transferAction";
OBChannelEventIdentifier const OBEventIdentifier_recycleAll = @"OBEventIdentifier_recycleAll";
OBChannelEventIdentifier const OBEventIdentifier_eventGetWaterInfo = @"eventGetWaterInfo";
OBChannelEventIdentifier const OBEventIdentifier_showTransferDialogEvent = @"showTransferDialogEvent";
OBChannelEventIdentifier const OBEventIdentifier_eventDialogTransferAction = @"eventDialogTransferAction";
OBChannelEventIdentifier const OBEventIdentifier_backUntilNativeEvent = @"backUntilNativeEvent";
OBChannelEventIdentifier const OBEventIdentifier_is_show_run_water = @"is_show_run_water";
OBChannelEventIdentifier const OBEventIdentifier_webViewPageEvent_reload = @"webViewPageEvent_reload";
OBChannelEventIdentifier const OBEventIdentifier_webViewPageEvent_seturl = @"webViewPageEvent_seturl";
OBChannelEventIdentifier const OBEventIdentifier_eventIdentifierGameTypeList = @"eventIdentifierGameTypeList";
OBChannelEventIdentifier const OBEventIdentifier_syncNativeLanguages = @"syncNativeLanguages";
OBChannelEventIdentifier const OBEventIdentifier_customerServiceUrl = @"customerServiceUrl";
OBChannelEventIdentifier const OBEventIdentifier_eventIdentifierDyGameList = @"eventIdentifierDyGameList";

@interface OBChannelManager ()

@property(nonatomic, strong) NSMutableDictionary<NSString*,NSMutableArray<FBEventListener>*>* listenersTable;

@property(nonatomic, retain) id<FlutterBinaryMessenger> binaryMessenger;

@property(nonatomic, retain) FlutterBasicMessageChannel* channel;

@end


@implementation OBChannelManager

+ (instancetype)instance{
    static id _instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [self.class new];
    });
    
    return _instance;
}

- (void)setUp:(id<FlutterBinaryMessenger>)binaryMessenger {
    _binaryMessenger = binaryMessenger;
    _channel = [FlutterBasicMessageChannel messageChannelWithName:@"game.ob.flutter.pigeon.sendEvent" binaryMessenger:binaryMessenger];
    __weak __typeof(self)weakSelf = self;
    [_channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
      OBCommonParams *input = [OBCommonParams fromMap:message];
      FlutterError *error;
        __strong __typeof(weakSelf)strongSelf = weakSelf;
      [strongSelf sendEventToNative:input error:&error];
      callback(wrapResult(nil, error));
    }];
}

- (void)obRegistry:(FlutterViewController *)registrar {
    _registrar = registrar;
}

- (NSMutableDictionary<NSString *,NSMutableArray<FBEventListener> *> *)listenersTable {
    if (_listenersTable == nil) {
        _listenersTable = [NSMutableDictionary dictionary];
    }
    return _listenersTable;
}

//flutter端将会调用此方法给native发送信息,所以这里将是接收事件的逻辑
- (void)sendEventToNative:(nonnull OBCommonParams *)input error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {

    NSString* key = input.key;
    NSDictionary* args = input.arguments;

    assert(key != nil);

    //如果arg是null，那么就生成一个空的字典传过去，避免null造成的崩溃
    if(args == nil){
        args = [NSDictionary dictionary];
    }

    //从总事件表中找到和key对应的事件监听者列表
    NSMutableArray* listeners = self.listenersTable[key];

    if(listeners == nil) return;

    for (FBEventListener listener in listeners) {
        listener(key,args);
    }
}

- (FBVoidCallback)addEventListener:(FBEventListener)listener
                           forName:(NSString *)key{
    assert(key != nil && listener != nil);

    NSMutableArray<FBEventListener>* listeners = self.listenersTable[key];
    if(listeners == nil){
        listeners = [[NSMutableArray alloc] init];
        self.listenersTable[key] = listeners;
    }

    [listeners addObject:listener];

    return ^{
        [listeners removeObject:listener];
    };
}

- (void)sendEventToFlutterWith:(NSString*)key arguments:(nullable NSDictionary*)arguments {
    OBCommonParams* params = [[OBCommonParams alloc] init];
    params.key = key;
    params.arguments = arguments;
    [_channel sendMessage:[params toMap] reply:^(id reply) {
        
    }];
}

@end
