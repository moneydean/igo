//
//  NSObject+FDDNSObjectCatagory.m
//  NetVote
//
//  Created by DingYunYu on 14-9-30.
//  Copyright (c) 2014年 Lin Dongpeng. All rights reserved.
//

#import "NSObject+FDDNSObjectCatagory.h"
#import "FDDParsePbToObject.h"

@implementation NSObject (FDDNSObjectCatagory)

-(BOOL)hasAttribute:(NSString *)attName
{
    BOOL flag = NO;
    u_int count;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int  i = 0; i < count ; i++) {
        const char *propertyName = ivar_getName(ivars[i]);
        NSString *strName = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
        if ([[strName substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"_"]) {
            strName = [strName substringFromIndex:1];
        }
        if([attName isEqualToString:strName]) {
            flag = YES;
        }
    }
    return  flag;
}

-(void)descriptionJsonFormat
{
    NSString *jsonString = [[FDDParsePbToObject fromObjectToData:self] JSONString];
    NSLog(@"\njsonString=%@\n",jsonString);
}

@end
