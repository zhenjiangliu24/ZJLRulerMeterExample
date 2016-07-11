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
    
    for (int i = 0; i <= _range; i++) {
        UILabel *rule = [[UILabel alloc] init];
        rule.textColor = [UIColor blackColor];
        rule.text = [NSString stringWithFormat:@"%.0f",i * _scale];
        CGSize textSize = [rule.text sizeWithAttributes:@{ NSFontAttributeName : rule.font }];
        if (i % 10 == 0) {
            CGPathMoveToPoint(pathRef2, NULL, Horizontal_Margin + Line_Distance * i , Vertical_Margin);
            CGPathAddLineToPoint(pathRef2, NULL, Horizontal_Margin + Line_Distance * i, self.rulerHeight - Vertical_Margin - textSize.height);
            rule.frame = CGRectMake(Horizontal_Margin + Line_Distance * i - textSize.width / 2, self.rulerHeight - Vertical_Margin - textSize.height, 0, 0);
            [rule sizeToFit];
            [self addSubview:rule];
        }
        else if (i % 5 == 0) {
            CGPathMoveToPoint(pathRef1, NULL, Horizontal_Margin + Line_Distance * i , Vertical_Margin + 10);
            CGPathAddLineToPoint(pathRef1, NULL, Horizontal_Margin + Line_Distance * i, self.rulerHeight - Vertical_Margin - textSize.height - 10);
        }
        else
        {
            CGPathMoveToPoint(pathRef1, NULL, Horizontal_Margin + Line_Distance * i , Vertical_Margin + 20);
            CGPathAddLineToPoint(pathRef1, NULL, Horizontal_Margin + Line_Distance * i, self.rulerHeight - Vertical_Margin - textSize.height - 20);
        }
    }
    
    shapeLayer1.path = pathRef1;
    shapeLayer2.path = pathRef2;
    
    [self.layer addSublayer:shapeLayer1];
    [self.layer addSublayer:shapeLayer2];
    
    UIEdgeInsets edge = UIEdgeInsetsMake(0, self.rulerWidth / 2.f - Horizontal_Margin, 0, self.rulerWidth / 2.f - Horizontal_Margin);
    self.contentInset = edge;
    self.contentOffset = CGPointMake(Line_Distance * (self.rulerValue / _scale) - self.rulerWidth + (self.rulerWidth / 2.f + Horizontal_Margin), 0);
    self.contentSize = CGSizeMake(_range*Line_Distance+Horizontal_Margin*2, _rulerHeight);
}
@end
