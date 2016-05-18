//
//  KINGLazySetView.h
//  XXKitDemo
//
//  Created by 王旭 on 16/5/17.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import <UIKit/UIKit.h>
#pragma mark - 设置cell被选择背景颜色
//设置cell被选择背景颜色
#define KINGCellSetSelectedColor     cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds];\
cell.selectedBackgroundView.backgroundColor = [UIColor kdxCellSelectedBackgroundColor];

#pragma mark - 未开发功能提示
//MARK: -- 未开发功能提示
//未开发功能提示
#define KINGNotificationWorkLater       [[NSNotificationCenter defaultCenter]postNotificationName:Notification_ShowAlert object:@"此功能还在开发中,敬请期待"];



//MARK: 快速跳转到某个控制器  moda出来的
#define KINGNavPresentToViewController(UIViewController) \
UIViewController *VC = [[UIViewController alloc]initWithIsFromHomeView:YES];\
UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:VC];\
[self presentViewController:nav animated:YES completion:nil];

#pragma mark - tableView 继承baseViewController的控制器  快速设置tableView
//tableView 继承baseViewController的控制器  快速设置tableView
#define KINGSubTableViewInitialze \
self.tableView.frame = kdxTableViewFrame;\
self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;\
self.tableView.showsVerticalScrollIndicator = NO;\
self.tableView.delegate = self;\
self.tableView.dataSource = self;\
self.tableView.backgroundColor = [UIColor kdxWholeBackgroundColor];

//tableView 继承baseViewController的控制器  快速设置tableView

#define KINGLazySetTableView \
self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;\
self.tableView.showsVerticalScrollIndicator = NO;\
self.tableView.delegate = self;\
self.tableView.dataSource = self;\
self.tableView.backgroundColor = [UIColor kdxWholeBackgroundColor];

//MARK:设置cell阴影
#define KINGCellShadowSet \
cell.layer.shadowOffset = CGSizeMake(0, 1);\
cell.layer.shadowColor = [UIColor grayColor].CGColor;\
cell.layer.shadowRadius = 1;\
cell.layer.shadowOpacity = .5f;\
CGRect shadowFrame = cell.layer.bounds;\
CGPathRef shadowPath = [UIBezierPath\
bezierPathWithRect:shadowFrame].CGPath;\
cell.layer.shadowPath = shadowPath;

#pragma mark - 快速设置kdx按钮自动布局
//设置单个kdx按钮位置
#define KINGLazySetOneKDXButton(buttonName,superView) \
[self.buttonName mas_makeConstraints:^(MASConstraintMaker *make) {\
make.left.equalTo(superView).offset(kdxMarginButtonLeft);\
make.right.equalTo(superView).offset(kdxMarginButtonRight);\
make.bottom.equalTo(superView).offset(kdxMarginButtonBottom);\
make.height.equalTo(@(kdxHeightButton));\
}];


//同时设置两个kdx按钮位置
#define KINGLazySetTowKDXButton(leftName,rightName,superView) \
[self.leftName mas_makeConstraints:^(MASConstraintMaker *make) {\
make.left.equalTo(superView).offset(kdxMarginButtonLeft);\
make.bottom.equalTo(superView).offset(kdxMarginButtonBottom);\
make.right.equalTo(self.rightName.mas_left).offset(-kdxMarginButtonBetween);\
make.height.equalTo(@(kdxHeightButton));\
}];\
[self.rightName mas_makeConstraints:^(MASConstraintMaker *make) {\
make.left.equalTo(superView.mas_centerX);\
make.top.equalTo(self.leftName);\
make.right.equalTo(superView).offset(kdxMarginButtonRight);\
make.bottom.equalTo(self.leftName);\
}];

#pragma mark - 懒加载控件快捷方法
//懒加载控件
//leftButtonItem
#define KINGLazyLeftItemWithImage(imageName,mothed) \
UIButton * leftImageButton = [[UIButton alloc]init];\
leftImageButton.frame = CGRectMake(0,0,35,35);\
[leftImageButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];\
[leftImageButton addTarget:self action:@selector(mothed) forControlEvents:UIControlEventTouchUpInside];\
UIBarButtonItem*leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftImageButton];\
self.navigationItem.leftBarButtonItem = leftItem;


//rightButtonItem

#define KINGLazyRightItemWithImage(imageName,mothed) \
UIButton * rightImageButton = [[UIButton alloc]init];\
rightImageButton.frame = CGRectMake(0,0,35,35);\
[rightImageButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];\
[rightImageButton addTarget:self action:@selector(mothed) forControlEvents:UIControlEventTouchUpInside];\
UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightImageButton];\
self.navigationItem.rightBarButtonItem = rightItem;



//rightButtonItem
#define KINGLazyRightItemWithTitle(title,mothed) \
UIButton * rightTitleButton = [[UIButton alloc]init];\
[rightTitleButton setTitle:title forState:UIControlStateNormal];\
[rightTitleButton addTarget:self action:@selector(mothed) forControlEvents:UIControlEventTouchUpInside];\
rightTitleButton.frame = CGRectMake(0, 0, 20 * title.length, 30);\
rightTitleButton.titleLabel.textAlignment = NSTextAlignmentRight;\
rightTitleButton.titleLabel.font = [UIFont kdxButtonFont];\
UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightTitleButton];\
self.navigationItem.rightBarButtonItem = rightItem;\




//懒加载 单个 kdx按钮
#define KINGLazyKDXButtonSingle(superView,buttonName,title,tagNum) \
-(UIButton *)buttonName {\
if (_##buttonName == nil) {\
UIButton *button = [UIButton kdxSingleButtonWithTitle:title];\
button.tag = tagNum;\
[button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];\
[superView addSubview:button];\
_##buttonName = button;}\
return _##buttonName;}


//懒加载  左侧  kdx按钮
#define KINGLazyKDXButtonLeft(superView,buttonName,title,tagNum) \
-(UIButton *)buttonName {\
if (_##buttonName == nil) {\
UIButton *button = [UIButton kdxLeftButtonWithTitle:title];\
[button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];\
button.tag = tagNum;\
_##buttonName = button;\
[superView addSubview:button];}\
return _##buttonName;}


//懒加载  右侧  kdx按钮
#define KINGLazyKDXButtonRight(superView,buttonName,title,tagNum) \
-(UIButton *)buttonName {\
if (_##buttonName == nil) {\
UIButton *button = [UIButton kdxRightButtonWithTitle:title];\
button.tag = tagNum;\
[button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];\
[superView addSubview:button];\
_##buttonName = button;}\
return _##buttonName;}


//以背景图片懒加载按钮
#define KINGLazyButtonWithImage(superView,buttonName,title,imageName1,imageName2,tagNum) \
- (UIButton *)buttonName {\
if (_##buttonName == nil) {\
UIButton *button = [[UIButton alloc]init];\
[button setTitle:title forState:UIControlStateNormal];\
[button setBackgroundImage:[UIImage imageNamed:imageName1] forState:UIControlStateNormal];\
[button setBackgroundImage:[UIImage imageNamed:imageName2] forState:UIControlStateHighlighted];\
[button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];\
button.tag = tagNum;\
[superView addSubview:button];\
_##buttonName = button;}\
return _##buttonName;}

//以背景颜色懒加载按钮
#define KINGLazyButtonWithColor(superView,buttonName,title,color1,color2,tagNum) \
- (UIButton *)buttonName {\
if (_##buttonName == nil) {\
UIButton *button = [[UIButton alloc]init];\
[button setTitle:title forState:UIControlStateNormal];\
UIColor *color = color1 == nil ? [UIColor blueColor] : color1;\
button.backgroundColor = color;\
[button addTarget:self action:@selector(kingColorChange##buttonName:) forControlEvents:UIControlEventTouchUpInside];\
[button addTarget:self action:@selector(kingColorChange##buttonName:) forControlEvents:UIControlEventTouchDown];\
[button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];\
button.tag = tagNum;\
[superView addSubview:button];\
_##buttonName = button;}\
return _##buttonName;}\
- (void)kingColorChange##buttonName:(UIButton *)button {\
static int i = 0; i++;\
UIColor *colorPre = color1 == nil ? [UIColor blueColor] : color1;\
UIColor *colorAfter = color2 == nil ? [UIColor greenColor] : color2;\
button.backgroundColor = i % 2 == 0 ? colorPre : colorAfter;}

//通用创建 各类 view 方法
#define KINGLazyViewWithRadiusAndColor(superView,viewName,class,color,radius) \
-(class *)viewName {\
if (_##viewName == nil) {\
class *view = [[class alloc]init];\
if (color != nil) {\
view.backgroundColor = color;\
}\
view.layer.cornerRadius = radius;\
view.layer.masksToBounds = YES;\
[superView addSubview:view];\
_##viewName = view;}\
return _##viewName;}


#define KINGLazyLabelWithRadiusAndColor(superView,viewName,txtColor,bgColor,radius) \
-(UILabel *)viewName {\
if (_##viewName == nil) {\
UILabel *view = [[UILabel alloc]init];\
if (txtColor != nil) {\
view.textColor = txtColor;\
}\
if (bgColor != nil) {\
view.backgroundColor = bgColor;\
}\
view.textAlignment = NSTextAlignmentCenter;\
view.layer.cornerRadius = radius;\
view.layer.masksToBounds = YES;\
[superView addSubview:view];\
_##viewName = view;}\
return _##viewName;}


#define KINGLazyAnyView(superView,viewName,class)  \
-(class *)viewName {\
if (_##viewName == nil) {\
class *view = [[class alloc]init];\
[superView addSubview:view];\
_##viewName = view;}\
return _##viewName;}


//常用系统 view 创建

#define KINGLazyView(superView,viewName)        KINGLazyAnyView(superView, viewName, UIView)
#define KINGLazyLabel(superView,viewName)       KINGLazyAnyView(superView, viewName, UILabel)
#define KINGLazyButton(superView,viewName)      KINGLazyAnyView(superView, viewName, UIButton)
#define KINGLazyImageView(superView,viewName)   KINGLazyAnyView(superView, viewName, UIImageView)
#define KINGLazyTextField(superView,viewName)   KINGLazyAnyView(superView, viewName, UITextField)
#define KINGLazyTextView(superView,viewName)    KINGLazyAnyView(superView, viewName, UITextView)
#define KINGLazyTabelView(superView,viewName)    KINGLazyAnyView(superView, viewName, UITabelView)

@interface KINGLazySetView : UIViewController

@end
