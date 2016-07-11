//
//  ZJLRulerScrollView.m
//  ZJLRulerMeterExample
//
//  Created by ZhongZhongzhong on 16/7/10.
//  Copyright © 2016年 ZhongZhongzhong. All rights reserved.
//

#import "ZJLRulerScrollView.h"

@interface ZJLRulerScrollView()
@property (nonatomic, assign) NSUInteger range;//total length of the rule
@property (nonatomic, assign) CGFloat scale;//minimal scale in the ruler
@property (nonatomic, assign) CGFloat rulerWidth;
@property (nonatomic, assign) CGFloat rulerHeight;

@end

@implementation ZJLRulerScrollView
- (instancetype)initWithFrame:(CGRect)frame range:(NSUInteger)range currentValue:(CGFloat)rulerValue scale:(CGFloat)scale
{
    if(self = [super initWithFrame:frame]){
        _range = range;
        _rulerValue = rulerValue;
        _rulerWidth = frame.size.width;
        _rulerHeight = frame.size.height;
        _scale = scale;
    }
    return self;
}

- (void)setRulerValue:(CGFloat)rulerValue
{
    _rulerValue = rulerValue;
}

- (void)drawRuler
{
    CGMutablePathRef pathRef1 = CGPathCreateMutable();
    CGMutablePathRef pathRef2 = CGPathCreateMutable();
    
    CAShapeLayer *shapeLayer1 = [CAShapeLayer layer];
    shapeLayer1.strokeColor = [UIColor lightGrayColor].CGColor;
    shapeLayer1.fillColor = [UIColor clearColor].CGColor;
    shapeLayer1.lineWidth = 1.f;
    shapeLayer1.lineCap = kCALineCapButt;
    
    CAShapeLayer *shapeLayer2 = [CAShapeLayer layer];
    shapeLayer2.strokeColor = [UIColor grayColor].CGColor;
    shapeLayer2.fillColor = [UIColor clearColor].CGColor;
    shapeLayer2.lineWidth = 1.f;
    shapeLayer2.lineCap = kCALineCapButt;
    
    
}
@end
