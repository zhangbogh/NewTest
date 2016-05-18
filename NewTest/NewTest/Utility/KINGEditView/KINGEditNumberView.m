//
//  KINGEditNumberView.m
//  ToolsApp
//
//  Created by 王旭 on 16/5/6.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import "KINGEditNumberView.h"
#import "KINGKeyboardView.h"

UIView *_editNumberCurrentView;
@interface KINGEditNumberView ()<KINGKeyboardDelegate>

@property (nonatomic ,weak) UIView *baseView;
@property (nonatomic ,weak) UIButton *closeButton;
@property (nonatomic ,weak) UILabel *titleLabel;
@property (nonatomic ,weak) KINGKeyboardView *keyboardView;
@property (nonatomic ,weak) UILabel *showNumberLabel;
@property (nonatomic ,strong) NSMutableArray *numbers;
@property (nonatomic ,copy) NSString *resultNumberString;
@property (nonatomic ,copy) NSString *showNumberString;

@property (nonatomic ,weak) id<KINGEditNumberViewDelegate> delegate;


@end


@implementation KINGEditNumberView

+ (void)gotoEditNumberViewWithCurrentView:(UIView *)currentView Delegate:(id<KINGEditNumberViewDelegate>)delegate {
    KINGEditNumberView *view = [[KINGEditNumberView alloc]init];
    view.frame = Screen_Bounds;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:view];
    view.delegate = delegate;
    _editNumberCurrentView = currentView;
    view.y = Screen_Height;
    [UIView animateWithDuration:0.4 animations:^{
        view.y = 0;
    }];
    view.numbers = [NSMutableArray arrayWithCapacity:11];
    view.resultNumberString = [NSString string];
    view.showNumberString = @"  ";
}




#pragma mark - keyboardDelegate
/** 数字按钮点击 */
- (void)tradeKeyboard:(KINGKeyboardView *)keyboard numBtnClick:(NSInteger)num {
    NSString *newNumString = [NSString stringWithFormat:@"%tu",num];
    [self.numbers addObject:newNumString];
    
    self.resultNumberString = [NSString stringWithFormat:@"%@%tu",self.resultNumberString,num];
    self.showNumberString = [NSString stringWithFormat:@"%@ %tu",self.showNumberString,num];

    self.showNumberLabel.text = self.showNumberString;
}
/** 删除按钮点击 */
- (void)tradeKeyboardDeleteBtnClick {
    if (self.numbers.count == 0) {
        return;
    }
    [self.numbers removeLastObject];
    self.resultNumberString = [self.resultNumberString substringToIndex:self.resultNumberString.length - 1];
    self.showNumberString = [self.showNumberString substringToIndex:self.showNumberString.length - 2];

    self.showNumberLabel.text = self.showNumberString;

}
/** 确定按钮点击 */
- (void)tradeKeyboardLeftBtnClick {
    
    if ([self.delegate respondsToSelector:@selector(editNumberView:currentView:messageOfEdited:)]) {
        [self.delegate editNumberView:self currentView:_editNumberCurrentView messageOfEdited:self.resultNumberString];
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.y = Screen_Height;
    }completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
    _editNumberCurrentView = nil;
}

- (void)closeButtonClick:(UIButton *)button {
    [self removeFromSuperview];
    _editNumberCurrentView = nil;

}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupProperty];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self setupUI];
//    [self setupProperty];
}

- (void)setupProperty {
    
    self.backgroundColor = [UIColor clearColor];
    self.baseView.backgroundColor = [UIColor kdxWholeBackgroundColor];
    [self.closeButton setImage:[UIImage imageNamed:image_close ] forState:UIControlStateNormal];
    [self.closeButton addTarget:self action:@selector(closeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.titleLabel.text = @"请输入号码";
    self.showNumberLabel.backgroundColor = [UIColor whiteColor];
    self.showNumberLabel.font = [UIFont systemFontOfSize:20];
    self.keyboardView.delegate = self;
    self.keyboardView.maxNumberCount = 11;
    self.closeButton.hidden = YES;
    
}

- (void)setupUI {
    
    [self.baseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(self).offset(-20);//(@(Screen_Height * 2 / 3));
    }];
    
    [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.baseView).offset(15);
        make.left.equalTo(self).offset(15);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.closeButton.mas_bottom).offset(15);
        make.left.equalTo(self.closeButton);
        make.height.equalTo(@20);
    }];
    
    [self.showNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(15);
        make.left.equalTo(self.titleLabel);
        make.right.equalTo(self).offset(-15);
        make.height.equalTo(@(49));
    }];
    
    [self.keyboardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(@(Screen_Width * 0.65));
    }];
}

KINGLazyView(self, baseView)
KINGLazyButton(self, closeButton)
KINGLazyLabel(self, titleLabel)
KINGLazyAnyView(self, keyboardView, KINGKeyboardView)
KINGLazyLabel(self, showNumberLabel)


@end
