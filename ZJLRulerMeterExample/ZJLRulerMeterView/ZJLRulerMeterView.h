//
//  ZJLRulerMeterView.h
//  ZJLRulerMeterExample
//
//  Created by ZhongZhongzhong on 16/7/10.
//  Copyright © 2016年 ZhongZhongzhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJLRulerScrollView.h"

@protocol ZJLRulerMeterViewDelegate <NSObject>
- (void)didSelectValueWith:(ZJLRulerScrollView *)scrollView;
@end

@interface ZJLRulerMeterView : UIView
@property (nonatomic, weak) id<ZJLRulerMeterViewDelegate> rulerDelegate;
@property (nonatomic, assign) CGFloat currentValue;

- (instancetype)initWithFrame:(CGRect)frame range:(NSUInteger)range currentValue:(CGFloat)rulerValue scale:(CGFloat)scale;
@end
