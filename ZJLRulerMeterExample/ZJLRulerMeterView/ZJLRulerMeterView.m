//
//  ZJLRulerMeterView.m
//  ZJLRulerMeterExample
//
//  Created by ZhongZhongzhong on 16/7/10.
//  Copyright © 2016年 ZhongZhongzhong. All rights reserved.
//

#import "ZJLRulerMeterView.h"

@interface ZJLRulerMeterView()<UIScrollViewDelegate>
@property (nonatomic, strong) ZJLRulerScrollView *scrollView;
@end

@implementation ZJLRulerMeterView
- (instancetype)initWithFrame:(CGRect)frame range:(NSUInteger)range currentValue:(CGFloat)rulerValue scale:(CGFloat)scale
{
    if (self = [super initWithFrame:frame]) {
        _scrollView = [[ZJLRulerScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) range:range currentValue:rulerValue scale:scale];
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_scrollView];
        [self addRedMark];
    }
    return self;
}

- (void)addRedMark
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor redColor].CGColor;
    layer.lineWidth = 1.0f;
    layer.lineCap = kCALineCapSquare;
    
    CGMutablePathRef pathLine = CGPathCreateMutable();
    CGPathMoveToPoint(pathLine, NULL, self.frame.size.width/2, self.frame.size.height-Vertical_Margin-20);
    CGPathAddLineToPoint(pathLine, NULL, self.frame.size.width/2, Vertical_Margin+7);
    
    CGPathAddLineToPoint(pathLine, NULL, self.frame.size.width/2-5, Vertical_Margin);
    CGPathAddLineToPoint(pathLine, NULL, self.frame.size.width/2+5, Vertical_Margin);
    CGPathAddLineToPoint(pathLine, NULL, self.frame.size.width/2, Vertical_Margin+7);
    
    layer.path = pathLine;
    [self.layer addSublayer:layer];
}
@end
