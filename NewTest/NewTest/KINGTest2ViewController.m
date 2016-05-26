//
//  KINGTest2ViewController.m
//  NewTest
//
//  Created by 王旭 on 16/5/16.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import "KINGTest2ViewController.h"
#import <XXLazyKitHeader.h>
@interface KINGTest2ViewController ()
@property (nonatomic ,weak) XXButtonLikeCell *button;
@end

@implementation KINGTest2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.button.frame = CGRectMake(100, 100, 200, 50);
    [self.button addTarget:self action:@selector(buttonClick:) messageSide:XXButtonLikeCellMessageSideRight Title:@"试试主要看箭头" Tag:0];
    self.button.accessoryType = XXButtonLikeCellAccessoryIndicator;
    
    // Do any additional setup after loading the view.
}
- (void)buttonClick:(UIButton *)button {
    KDXLog(@"点击了按钮%@,tag值是%tu",button.currentTitle,button.tag);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

XXLazyAnyView(self.view, button, XXButtonLikeCell)

@end
