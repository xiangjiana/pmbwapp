//
//  NSArray+MKAdd.m
//  AFNetworking
//
//  Created by leishen on 2019/10/7.
//

#import "NSArray+MKAdd.h"

@implementation NSArray (MKAdd)
- (id)objectAssertAtIndexSecure:(NSUInteger)index {
    //注释掉 NSAssert2 就可以防止崩溃 加上好调试看哪里越界
    NSAssert2(index < [self count], @"MK: index %ld beyond bounds [0 .. %ld]", index, self.count - 1);
    return [self objectAtIndexSecure:index];
}

- (id)objectAtIndexSecure:(NSUInteger)index {
    
    if(index >= [self count]) {
        return nil;
    }
    
    id value = [self objectAtIndex:index];
    if(value == [NSNull null]) {
        return nil;
    }
    
    return value;
}

@end
