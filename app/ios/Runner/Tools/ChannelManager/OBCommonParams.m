//
//  OBCommonParams.m
//  Runner
//
//  Created by Tmoson on 2022/2/20.
//

#import "OBCommonParams.h"

@implementation OBCommonParams

+ (OBCommonParams*)fromMap:(NSDictionary*)dict {
    OBCommonParams* result = [[OBCommonParams alloc] init];
    result.pageName = dict[@"pageName"];
    if ((NSNull *)result.pageName == [NSNull null]) {
        result.pageName = nil;
    }
    result.uniqueId = dict[@"uniqueId"];
    if ((NSNull *)result.uniqueId == [NSNull null]) {
        result.uniqueId = nil;
    }
    result.arguments = dict[@"arguments"];
    if ((NSNull *)result.arguments == [NSNull null]) {
        result.arguments = nil;
    }
    result.opaque = dict[@"opaque"];
    if ((NSNull *)result.opaque == [NSNull null]) {
        result.opaque = nil;
    }
    result.key = dict[@"key"];
    if ((NSNull *)result.key == [NSNull null]) {
        result.key = nil;
    }
    return result;
}

- (NSDictionary*)toMap {
    return [NSDictionary dictionaryWithObjectsAndKeys:(self.pageName ? self.pageName : [NSNull null]), @"pageName", (self.uniqueId ? self.uniqueId : [NSNull null]), @"uniqueId", (self.arguments ? self.arguments : [NSNull null]), @"arguments", (self.opaque ? self.opaque : [NSNull null]), @"opaque", (self.key ? self.key : [NSNull null]), @"key", nil];
}

@end
