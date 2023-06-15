//
//  OBCommonParams.h
//  Runner
//
//  Created by Tmoson on 2022/2/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OBCommonParams : NSObject
@property(nonatomic, copy, nullable) NSString * pageName;
@property(nonatomic, copy, nullable) NSString * uniqueId;
@property(nonatomic, strong, nullable) NSDictionary * arguments;
@property(nonatomic, strong, nullable) NSNumber * opaque;
@property(nonatomic, copy, nullable) NSString * key;

+ (OBCommonParams *)fromMap:(NSDictionary *)dict;

- (NSDictionary*)toMap;

@end

NS_ASSUME_NONNULL_END
