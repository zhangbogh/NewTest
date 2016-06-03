//
//  KINGTest5ViewController.m
//  NewTest
//
//  Created by 王旭 on 16/5/16.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import "KINGTest5ViewController.h"
#import "XXChartView.h"
#import "XXChartCorverView.h"

@interface KINGTest5ViewController ()
@property (nonatomic ,weak) XXChartView *chartView;
//@property (nonatomic ,weak) XXChartCorverView *chartCorverView;
@end

@implementation KINGTest5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.chartView.frame = CGRectMake(0, 64, self.view.width, self.view.height - 64);
//    self.chartCorverView.frame = CGRectMake(0, 64, self.view.width, self.view.height - 64);
    self.chartView.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
XXLazyAnyView(self.view, chartView, XXChartView)
//XXLazyAnyView(self.view, chartCorverView, XXChartCorverView)

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
