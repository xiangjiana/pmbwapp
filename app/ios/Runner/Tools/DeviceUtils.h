//
//  DeviceUtils.h
//  Runner
//
//  Created by Tmoson on 2022/3/1.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger,DeviceType) {
    
    Unknown = 0,
    Simulator,
    IPhone_5,
    IPhone_5C,
    IPhone_5S,
    IPhone_SE,
    IPhone_6,
    IPhone_6P,
    IPhone_6s,
    IPhone_6s_P,
    IPhone_7,
    IPhone_7P,
    IPhone_8,
    IPhone_8P,
    IPhone_X,
    iPhone_XR,
    iPhone_XS,
    iPhone_XS_Max,
};

@interface DeviceUtils : NSObject

+ (DeviceType)deviceType;

@end

NS_ASSUME_NONNULL_END
