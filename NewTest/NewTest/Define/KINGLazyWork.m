//
//  KINGViewController.m
//  KINGLazyWork
//
//  Created by 王旭 on 16/3/31.
//  Copyright © 2016年 wangxu. All rights reserved.
//


//MARK:这个文件仅仅是用于宏实验 验证代码用的
#import "KINGLazyWork.h"

@interface KINGLazyWork ()
@property (nonatomic,weak)UIButton *button;
@property (nonatomic,weak)UIView *secendView;
@property (nonatomic,weak)UILabel *thirdView;
@property (nonatomic,weak)UIView *fourView;

@end

@implementation KINGLazyWork

- (void)viewDidLoad {
    if (1) {
        [_button removeAllTargets];
    }
    [super viewDidLoad];
    
//CGRectSubTableViewFrame CGRectMake(0,0,Screen_Width,Screen_subTableHeight)
    
    
    NSString *str = @"fdjsjflsdkjfls";
    CGRectMake(0, 0, 20 * str.length, 20);
    self.navigationController.automaticallyAdjustsScrollViewInsets = NO;
    _button.tintColor = [UIColor darkGrayColor];
    _button.titleLabel.textAlignment = NSTextAlignmentRight;
    self.fourView.frame = CGRectMake(100, 100, 100, 100);
    [UIImage imageWithCIImage:[CIImage imageWithColor:[UIColor redColor].CIColor]];
    self.button.backgroundColor = [UIColor redColor];
    [_button removeAllTargets];
    UIButton * button = [[UIButton alloc]init];
    [button setTitle:@"fasong" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(mothed) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightItem;
#pragma mark - tableView的初始化设置
//    self.tableView.frame = kdxTableViewFrame;
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.tableView.showsVerticalScrollIndicator = NO;
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//    self.tableView.backgroundColor = [UIColor kdxWholeBackgroundColor];
    

}
- (void)mothed{
}
- (void)setupUI {
    
#pragma mark:kdx左右按钮自动布局
//    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.left.equalTo(self.view.mas_left).offset(kdxMarginButtonLeft);
//        make.bottom.equalTo(self.view.mas_bottom).offset(kdxMarginButtonBottom);
//        make.right.equalTo(self.confirmButton.mas_left).offset(-kdxMarginButtonBetween);
//        make.height.equalTo(@(kdxHeightButton));
//    }];
//
//    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.left.equalTo(self.view.mas_centerX);
//        make.top.equalTo(self.cancelButton);
//        make.right.equalTo(self.view).offset(kdxMarginButtonBottom);
//        make.bottom.equalTo(self.cancelButton);
//    }];

}


#pragma mark:kdx左右按钮

//-(UIButton *)cancelButton {
//    if (_cancelButton == nil) {
//        UIButton *button = [UIButton kdxLeftButtonWithTitle:@"取消"];
//        _cancelButton = button;
//        [_cancelButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:_cancelButton];
//    }
//    return _cancelButton;
//}
//-(UIButton *)confirmButton {
//    if (_confirmButton == nil) {
//        UIButton *button = [UIButton kdxRightButtonWithTitle:@"确定"];
//        _confirmButton = button;
//        [_confirmButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:_confirmButton];
//    }
//    return _confirmButton;
//}





- (UIButton *)button {
    if (_button == nil) {
        UIButton *button = [[UIButton alloc]init];
        [button setTitle:@"按钮" forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageWithCIImage:[CIImage imageWithColor:[UIColor redColor].CIColor]] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageWithCIImage:[CIImage imageWithColor:[[UIColor redColor] CIColor]]] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 1;
        [self.view addSubview:button];
        _button = button;
    }
    return _button;
}
- (UIButton *)button1 {
    if (_button == nil) {
        UIButton *button = [[UIButton alloc]init];
        [self.view addSubview:button];
        [button setTitle:@"按钮" forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"图片1"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"图片2"] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 1;
        _button = button;
    }
    return _button;
}

- (void) buttonClick:(UIButton *)button {
    
}

- (UIView *)secendView {
    if (_secendView == nil) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor redColor];
        view.layer.cornerRadius = 5;
        [view.layer masksToBounds];
        [self.view addSubview:view];
        _secendView = view;
    }
    return _secendView;
}
-(UILabel *)thirdView {
    if (_thirdView == nil) {
        UILabel *view = [[UILabel alloc]init];
        view.backgroundColor = [UIColor redColor];
        view.layer.cornerRadius = 5;
        [view.layer masksToBounds];
        [self.view addSubview:view];
        _thirdView = view;
    }
    return _thirdView;
}






@end
