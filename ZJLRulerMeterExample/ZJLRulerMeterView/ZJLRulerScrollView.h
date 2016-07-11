//
//  ZJLRulerScrollView.h
//  ZJLRulerMeterExample
//
//  Created by ZhongZhongzhong on 16/7/10.
//  Copyright © 2016年 ZhongZhongzhong. All rights reserved.
//

#import <UIKit/UIKit.h>

static const CGFloat Horizontal_Margin = 8.0f;
static const CGFloat Vertical_Margin = 20.0;
static const CGFloat Line_Distance = 8.0f;

@interface ZJLRulerScrollView : UIScrollView
@property (nonatomic, assign) CGFloat rulerValue;

- (instancetype)initWithFrame:(CGRect)frame range:(NSUInteger)range currentValue:(CGFloat)rulerValue scale:(CGFloat)scale;
@end
