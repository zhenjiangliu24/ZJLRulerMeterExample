//
//  ViewController.m
//  ZJLRulerMeterExample
//
//  Created by ZhongZhongzhong on 16/7/10.
//  Copyright © 2016年 ZhongZhongzhong. All rights reserved.
//

#import "ViewController.h"
#import "ZJLRulerMeterView/ZJLRulerMeterView.h"

@interface ViewController ()
@property (nonatomic, strong) ZJLRulerMeterView *meterView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.meterView = [[ZJLRulerMeterView alloc] initWithFrame:CGRectMake(20, 20, self.view.frame.size.width-40, 200) range:20 currentValue:0 scale:0.1];
    [self.view addSubview:self.meterView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
