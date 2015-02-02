//
//  HPParseDataToObject.h
//  papm
//
//  Created by dean on 13-11-19.
//  Copyright (c) 2013年 pingan. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@protocol FDDPParsePbToObjectProtocal;

@interface FDDParsePbToObject : NSObject

+ (id) fromDataToObject:(id)data className:(Class)className;
+ (id) fromObjectToData:(id)object;

@end

@protocol FDDPParsePbToObjectProtocal <NSObject>

@optional
- (Class)arrayTypeMapping:(NSString *)propertyname;
- (NSString *)propertyMapping:(NSString *)propertyname;

@end
