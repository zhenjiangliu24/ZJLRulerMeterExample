//
//  ViewController.m
//  ZJLRulerMeterExample
//
//  Created by ZhongZhongzhong on 16/7/10.
//  Copyright © 2016年 ZhongZhongzhong. All rights reserved.
//

#import "ViewController.h"
#import "ZJLRulerMeterView/ZJLRulerMeterView.h"

@interface ViewController ()<ZJLRulerMeterViewDelegate>
@property (nonatomic, strong) ZJLRulerMeterView *meterView;
@property (nonatomic, strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.meterView = [[ZJLRulerMeterView alloc] initWithFrame:CGRectMake(20, 20, self.view.frame.size.width-40, 200) range:200 currentValue:0 scale:0.1];
    self.meterView.backgroundColor = [UIColor yellowColor];
    self.meterView.rulerDelegate = self;
    [self.view addSubview:self.meterView];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 50, 250, 100, 30)];
    self.label.text = [NSString stringWithFormat:@"Current:%.1f",self.meterView.currentValue];
    self.label.font = [UIFont systemFontOfSize:14.0];
    self.label.textColor = [UIColor blackColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    
}

- (void)didSelectValueWith:(ZJLRulerScrollView *)scrollView
{
    self.label.text = [NSString stringWithFormat:@"Current:%.1f",self.meterView.currentValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
