//
//  FDDCustomPickerView.h
//  NetVote
//
//  Created by DingYunYu on 14-8-14.
//  Copyright (c) 2014年 Lin Dongpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIPickerViewPressOkBtnDelegate;

@interface FDDCustomPickerView : UIPickerView

@property (assign, nonatomic) id<UIPickerViewPressOkBtnDelegate> pressOkDelegate;

- (void)AfterAddSubViewCreateAddtionView;

- (void)showCustomPickerView;

- (void)hiddenCustomPickerView;

@end

@protocol UIPickerViewPressOkBtnDelegate <NSObject>

@optional
- (void)pickerView:(FDDCustomPickerView *)pickerView pressOkBtnBySelectRow:(NSInteger)row inComponent:(NSInteger)component;

@end
