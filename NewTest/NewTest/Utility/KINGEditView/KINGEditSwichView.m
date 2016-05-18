//
//  KINGEditSwichView.m
//  ToolsApp
//
//  Created by 王旭 on 16/5/9.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import "KINGEditSwichView.h"
UIView *_editSwichCurrentView;

@interface KINGEditSwichView ()

@property (nonatomic ,weak) UIView *baseView;
@property (nonatomic ,strong) NSArray *swiches;
@property (nonatomic ,weak) id<KINGEditSwichViewDelegate> delegate;


@end


@implementation KINGEditSwichView

+ (void)gotoEditSwichViewWithCurrentView:(UIView *)currentView Swiches:(NSArray *)swiches Delegate:(id<KINGEditSwichViewDelegate>)delegate {
    KINGEditSwichView *view = [[KINGEditSwichView alloc]init];
    view.backgroundColor = [UIColor kdxWholeBackgroundColor];
    view.swiches = swiches;
    view.frame = Screen_Bounds;
    view.y = Screen_Height;
    [UIView animateWithDuration:0.4 animations:^{
        view.y = 0;
    }];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:view];
    view.delegate = delegate;
    _editSwichCurrentView = currentView;
}

- (void)setSwiches:(NSArray *)swiches {
    [self setupUI];
    [self setupProperty];
    NSInteger count = swiches.count;
    for (int i = 0; i < count; i++) {
        NSString *swich = swiches[i];
        UIButton *button = [UIButton kdxRightButtonWithTitle:swich];
        CGFloat width = Screen_Width / 2;
        CGFloat height = 44;
        CGFloat x = Screen_Width / 4;
        CGFloat y = (i - (count + 1) / 2) * (height + 20) + Screen_Height / 2;
        button.frame = CGRectMake(x, y, width, height);
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}


- (void)buttonClick:(UIButton *)button {
    [self endEditing:YES];
    if ([self.delegate respondsToSelector:@selector(editSwichView:currentView:messageOfEdited:)]) {
        [self.delegate editSwichView:self currentView:_editSwichCurrentView messageOfEdited:button.titleLabel.text];
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.y = Screen_Height;
    }completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
    _editSwichCurrentView = nil;
}
- (void)setupProperty {
    self.backgroundColor = [UIColor clearColor];
    self.baseView.backgroundColor = [UIColor kdxWholeBackgroundColor];

}

- (void)setupUI {
    [self.baseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self).offset(20);
        make.bottom.equalTo(self);
    }];
}
KINGLazyView(self, baseView)
@end
