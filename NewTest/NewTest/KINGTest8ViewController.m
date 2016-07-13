//
//  KINGTest8ViewController.m
//  NewTest
//
//  Created by 王旭 on 16/5/16.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import "KINGTest8ViewController.h"
#import <POP.h>

@interface KINGTest8ViewController ()
@property (nonatomic ,weak) UIView *testView;
@end

@implementation KINGTest8ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.testView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.testView.backgroundColor = [UIColor redColor];
    
    
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
