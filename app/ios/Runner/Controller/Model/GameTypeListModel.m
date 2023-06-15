//
//  GameTypeListModel.m
//  Runner
//
//  Created by Tmoson on 2022/9/19.
//

#import "GameTypeListModel.h"

@implementation GameModel

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

+ (nullable NSArray<NSString *> *)modelPropertyBlacklist {
    return @[@"selected"];
}

@end

@implementation GameTypeListModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"venueList" : [GameModel class]};
}

+ (nullable NSArray<NSString *> *)modelPropertyBlacklist {
    return @[@"selected"];
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

@implementation GameDataListModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"list" : [GameTypeListModel class]};
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

@implementation DyGameModel

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

@implementation GameDyListModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"list" : [DyGameModel class]};
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
