//
//  KINGKeyboardView.m
//  密码输入test
//
//  Created by 王旭 on 16/4/6.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import "KINGKeyboardView.h"
#import "UIView+Extension.h"
#define KeyboardBtnCount 12

@interface KINGKeyboardView ()
// 所有数字按钮的数组
@property (nonatomic, strong) NSMutableArray *numBtns;
@property (nonatomic ,assign) NSInteger numberCount;
@property (nonatomic ,weak) UIButton *okButton;
@end



@implementation KINGKeyboardView




#pragma mark - LazyLoad

- (void)setNumberCount:(NSInteger )numberCount {
    _numberCount = numberCount;
    if (numberCount == self.maxNumberCount) {
        for (UIButton *button in self.numBtns) {
            button.userInteractionEnabled = NO;
        }
        self.okButton.userInteractionEnabled = YES;
        [self.okButton setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"#007fa0"]] forState:UIControlStateNormal];

    }else {

        self.okButton.userInteractionEnabled = NO;
        [self.okButton setBackgroundImage:[UIImage imageWithColor:[UIColor lightGrayColor]] forState:UIControlStateNormal];

    }
}


- (NSMutableArray *)numBtns
{
    if (_numBtns == nil) {
        _numBtns = [NSMutableArray array];
    }
    return _numBtns;
}

#pragma mark - LifeCircle

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor kdxWholeBackgroundColor];
        /** 添加所有按键 */
        [self setupAllBtns];
        self.maxNumberCount = 6;
        self.numberCount = 0;
    }
    return self;
}

/** 添加所有按键 */
- (void)setupAllBtns
{
    for (int i = 0; i < KeyboardBtnCount; i++) {
        // 创建按钮
        UIButton *btn = [[UIButton alloc]init];
        [self addSubview:btn];
        // 按钮音效监听
        //        [btn addTarget:self action:@selector(playTock) forControlEvents:UIControlEventTouchDown];
        // 按钮公共属性
        [btn setBackgroundImage:[UIImage imageNamed:@"trade.bundle/number_bg"] forState:UIControlStateNormal];
//        [btn setBackgroundImage:[UIImage imageNamed:@"trade.bundle/yuan"] forState:UIControlStateHighlighted];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        
        if (i == 9) {  // 确定按钮
            [btn setTitle:@"确定" forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:Screen_Width * 0.046875];

            [btn setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor colorWithHexString:@"#94e2f3"] forState:UIControlStateHighlighted];
            [btn setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"#007fa0"]] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"#004d66"]] forState:UIControlStateHighlighted];
            btn.layer.cornerRadius = 5;
            btn.layer.masksToBounds = YES;
            [btn addTarget:self action:@selector(okBtnClick) forControlEvents:UIControlEventTouchUpInside];
            
            self.okButton = btn;
            
        } else if (i == 10) {  // 0 按钮
            [btn setTitle:@"0" forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:Screen_Width * 0.06875];
            btn.tag = 0;
            [btn addTarget:self action:@selector(numBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.numBtns addObject:btn];
        } else if (i == 11) {  // 删除按钮
            [btn setTitle:@"删除" forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:Screen_Width * 0.046875];
            [btn addTarget:self action:@selector(deleteBtnClick) forControlEvents:UIControlEventTouchUpInside];
        } else {  // 其他数字按钮
            [btn setTitle:[NSString stringWithFormat:@"%d", i + 1] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:Screen_Width * 0.06875];
            btn.tag = i + 1;
            [btn addTarget:self action:@selector(numBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.numBtns addObject:btn];
        }
    }
}

#pragma mark - Layout

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 定义总列数
    NSInteger totalCol = 3;
    
    // 定义间距
    CGFloat pad = Screen_Width * 0.015625;
    
    // 定义x y w h
    CGFloat x;
    CGFloat y;
    CGFloat w = Screen_Width * 0.3125;
    CGFloat h = Screen_Width * 0.14375;
    
    // 列数 行数
    NSInteger row;
    NSInteger col;
    for (int i = 0; i < KeyboardBtnCount; i++) {
        row = i / totalCol;
        col = i % totalCol;
        x = pad + col * (w + pad);
        y = row * (h + pad) + pad;
        UIButton *btn = self.subviews[i];
        btn.frame = CGRectMake(x, y, w, h);
    }
}

#pragma mark - Private

/** 删除按钮点击 */
- (void)deleteBtnClick
{
    if ([self.delegate respondsToSelector:@selector(tradeKeyboardDeleteBtnClick)]) {
        [self.delegate tradeKeyboardDeleteBtnClick];
    }
    if (self.numberCount > 0) {
        self.numberCount -= 1;
    }
    for (UIButton *button in self.numBtns) {
        button.userInteractionEnabled = YES;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:KINGNumKeyboardDeleteButtonClick object:self];
}

/** 确定按钮点击 */
- (void)okBtnClick
{
    if ([self.delegate respondsToSelector:@selector(tradeKeyboardLeftBtnClick)]) {
        [self.delegate tradeKeyboardLeftBtnClick];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:KINGNumKeyboardLeftButtonClick object:self];
}

/** 数字按钮点击 */
- (void)numBtnClick:(UIButton *)numBtn
{
    if ([self.delegate respondsToSelector:@selector(tradeKeyboard:numBtnClick:)]) {
        [self.delegate tradeKeyboard:self numBtnClick:numBtn.tag];
    }
    if (self.numberCount < self.maxNumberCount) {
        self.numberCount += 1;
    }
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    userInfo[KINGNumKeyboardNumberKey] = @(numBtn.tag);
    [[NSNotificationCenter defaultCenter] postNotificationName:KINGNumKeyboardNumberButtonClick object:self userInfo:userInfo];
    
}

/** 播放系统音效 */
//- (void)playTock
//{
//    ZCAudioTool *tool = [[ZCAudioTool alloc] initSystemSoundWithName:@"Tock" SoundType:@"caf"];
//    [tool play];
//}


@end
