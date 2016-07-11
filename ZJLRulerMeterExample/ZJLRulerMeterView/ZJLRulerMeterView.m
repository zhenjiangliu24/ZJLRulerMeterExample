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
        _currentValue = rulerValue;
        [self addSubview:_scrollView];
        [self addRedMark];
        [self addGradientlayer];
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

- (void)addGradientlayer
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    
    gradient.colors = @[(id)[[UIColor whiteColor] colorWithAlphaComponent:1.f].CGColor,
                        (id)[[UIColor whiteColor] colorWithAlphaComponent:0.0f].CGColor,
                        (id)[[UIColor whiteColor] colorWithAlphaComponent:1.f].CGColor];
    
    gradient.locations = @[[NSNumber numberWithFloat:0.0f],
                           [NSNumber numberWithFloat:0.6f]];
    
    gradient.startPoint = CGPointMake(0, .5);
    gradient.endPoint = CGPointMake(1, .5);
    
    [self.layer addSublayer:gradient];
}

#pragma mark - scroll view delegate
- (void)scrollViewDidScroll:(ZJLRulerScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x + self.frame.size.width/2 - Horizontal_Margin;
    CGFloat currentValue = (offsetX/Line_Distance)*scrollView.scale;
    if(currentValue<0 || currentValue>scrollView.range*scrollView.scale){
        return;
    }
    scrollView.rulerValue = currentValue;
    _currentValue = currentValue;
    if(self.rulerDelegate){
        [self.rulerDelegate didSelectValueWith:scrollView];
    }
}

- (void)scrollViewDidEndDecelerating:(ZJLRulerScrollView *)scrollView
{
    [self animateToClosestPosition:scrollView];
}

- (void)scrollViewDidEndDragging:(ZJLRulerScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self animateToClosestPosition:scrollView];
}

- (void)animateToClosestPosition:(ZJLRulerScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x + self.frame.size.width/2 - Horizontal_Margin;
    CGFloat currentValue = (offsetX/Line_Distance)*scrollView.scale;
    currentValue = [self notRounding:currentValue afterPoint:1];
    CGFloat newCurrent = (currentValue/scrollView.scale) * Line_Distance + Horizontal_Margin - self.frame.size.width/2;
    [UIView animateWithDuration:0.2f animations:^{
        scrollView.contentOffset = CGPointMake(newCurrent, 0);
    }];
}



- (CGFloat)notRounding:(CGFloat)price afterPoint:(NSInteger)position {
    NSDecimalNumberHandler*roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber*ouncesDecimal;
    NSDecimalNumber*roundedOunces;
    ouncesDecimal = [[NSDecimalNumber alloc]initWithFloat:price];
    roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    return [roundedOunces floatValue];
}
@end
