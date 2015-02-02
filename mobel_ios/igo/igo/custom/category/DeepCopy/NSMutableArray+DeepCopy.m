//
//  NSMutableArray+DeepCopy.m
//  NetVote
//
//  Created by maijiahao on 14-9-24.
//  Copyright (c) 2014年 Lin Dongpeng. All rights reserved.
//

#import "NSMutableArray+DeepCopy.h"

@implementation NSMutableArray (DeepCopy)

-(NSMutableArray *)mutableDeepCopy
{
    NSMutableArray *ret = [[NSMutableArray alloc] initWithCapacity:[self count]];
    for (id value in self)
    {
        id oneCopy = nil;
        if ([value respondsToSelector:@selector(mutableDeepCopy)])
            oneCopy = [value mutableDeepCopy];
        else if ([value respondsToSelector:@selector(mutableCopy)])
            oneCopy = [value mutableCopy];
        if (oneCopy == nil)
            oneCopy = [value copy];
        [ret addObject: oneCopy];
    }
    return ret;
}

@end
