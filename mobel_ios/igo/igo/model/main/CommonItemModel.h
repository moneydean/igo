//
//  CommonItemModel.h
//  igo
//
//  Created by DingYunYu on 14/12/18.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonItemModel : NSObject

@property (strong, nonatomic) NSString *imageURL;
@property (assign, nonatomic) float imageWidth;
@property (assign, nonatomic) float imageHeight;
@property (assign, nonatomic) int favoritesCount;
@property (strong, nonatomic) NSString *itemSummary;

@end
