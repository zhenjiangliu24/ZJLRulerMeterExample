//
//  ZJLRulerMeterView.m
//  ZJLRulerMeterExample
//
//  Created by ZhongZhongzhong on 16/7/10.
//  Copyright © 2016年 ZhongZhongzhong. All rights reserved.
//

#import "ZJLRulerMeterView.h"

@interface ZJLRulerMeterView()
@property (nonatomic, strong) ZJLRulerScrollView *scrollView;
@end

@implementation ZJLRulerMeterView
- (instancetype)initWithFrame:(CGRect)frame range:(NSUInteger)range currentValue:(CGFloat)rulerValue scale:(CGFloat)scale
{
    if (self = [super initWithFrame:frame]) {
        _scrollView = [[ZJLRulerScrollView alloc] initWithFrame:frame range:range currentValue:rulerValue scale:scale];
        
    }
    return self;
}
@end
