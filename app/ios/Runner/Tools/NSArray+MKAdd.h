//
//  NSArray+MKAdd.h
//  AFNetworking
//
//  Created by leishen on 2019/10/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (MKAdd)
/// 安全取数组元素（断言）
- (id)objectAssertAtIndexSecure:(NSUInteger)index;
/// 安全取数组元素
- (id)objectAtIndexSecure:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
