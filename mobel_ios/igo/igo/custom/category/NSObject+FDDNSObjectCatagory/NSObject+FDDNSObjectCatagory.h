//
//  NSObject+FDDNSObjectCatagory.h
//  NetVote
//
//  Created by DingYunYu on 14-9-30.
//  Copyright (c) 2014年 Lin Dongpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (FDDNSObjectCatagory)

-(BOOL)hasAttribute:(NSString *)attName;

-(void)descriptionJsonFormat;

@end
