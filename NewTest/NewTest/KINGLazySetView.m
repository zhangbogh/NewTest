//
//  KINGLazySetView.m
//  XXKitDemo
//
//  Created by 王旭 on 16/5/17.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import "KINGLazySetView.h"
#define KINGLazyView(superView,viewName)        KINGLazyAnyView(superView, viewName, UIView)
#define KINGLazyLabel(superView,viewName)       KINGLazyAnyView(superView, viewName, UILabel)
#define KINGLazyButton(superView,viewName)      KINGLazyAnyView(superView, viewName, UIButton)
#define KINGLazyImageView(superView,viewName)   KINGLazyAnyView(superView, viewName, UIImageView)
#define KINGLazyTextField(superView,viewName)   KINGLazyAnyView(superView, viewName, UITextField)
#define KINGLazyTextView(superView,viewName)    KINGLazyAnyView(superView, viewName, UITextView)
#define KINGLazyTabelView(superView,viewName)    KINGLazyAnyView(superView, viewName, UITabelView)
@interface KINGLazySetView ()
@property (nonatomic ,weak) UIView *testview;
@property (nonatomic ,weak) UILabel *label;
@property (nonatomic ,weak) UIButton *button;
@property (nonatomic ,weak) UIImageView *imageView;
@property (nonatomic ,weak) UITextField *UITextField;
@property (nonatomic ,weak) UITextView *textView;
@property (nonatomic ,weak) UITableView *tabelView;
@end

@implementation KINGLazySetView

- (void)viewDidLoad {
    [super viewDidLoad];
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
