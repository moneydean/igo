//
//  SearchRecommendModel.h
//  igo
//
//  Created by DingYunYu on 14/12/26.
//  Copyright (c) 2014年 DingYunYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchRecommendModel : NSObject

@property (strong, nonatomic) NSString *itemImageURL;
@property (strong, nonatomic) NSString *itemtTitle;
@property (strong, nonatomic) NSMutableArray *itemChildrensTitle;

@end
