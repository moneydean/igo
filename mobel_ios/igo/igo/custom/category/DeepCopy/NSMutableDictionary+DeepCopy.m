//
//  NSMutableDictionary+DeepCopy.m
//  NetVote
//
//  Created by maijiahao on 14-9-24.
//  Copyright (c) 2014年 Lin Dongpeng. All rights reserved.
//

#import "NSMutableDictionary+DeepCopy.h"

@implementation NSMutableDictionary (DeepCopy)

-(NSMutableDictionary *)mutableDeepCopy
{
    NSMutableDictionary *ret = [NSMutableDictionary dictionaryWithCapacity:[self count]];
    NSArray *keys = [self allKeys];
    for (id key in keys) {
        id oneValue = [self valueForKey:key];
        id oneCopy = nil;
        
        if ([oneValue respondsToSelector:@selector(mutableDeepCopy)]) {
            oneCopy = [oneValue mutableDeepCopy];
        }else if ([oneValue respondsToSelector:@selector(mutableCopy)]) {
            oneCopy = [oneValue mutableCopy];
        }
        if (oneCopy == nil) {
            oneCopy = [oneValue copy];
        }
        [ret setValue:oneCopy forKey:key];
    }
    return ret;
}

@end
