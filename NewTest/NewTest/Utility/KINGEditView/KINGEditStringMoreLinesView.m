//
//  KINGEditStringMoreLinsView.m
//  ToolsApp
//
//  Created by 王旭 on 16/5/10.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import "KINGEditStringMoreLinesView.h"
UIView *_editStringMoreLinesCurrentView;



@interface KINGEditStringMoreLinesView ()

@property (nonatomic ,weak) UIView *baseView;
@property (nonatomic ,weak) UITextView *editTextView;
@property (nonatomic ,weak) UIButton *cancelButton;
@property (nonatomic ,weak) UIButton *confirmButton;
@property (nonatomic ,weak) id<KINGEditStringMoreLinesViewDelegate> delegate;

@end

@implementation KINGEditStringMoreLinesView

+ (void)gotoEditStringMoreLinesViewWithCurrentView:(UIView *)currentView currentMessage:(NSString *)currentMessage Delegate:(id<KINGEditStringMoreLinesViewDelegate>)delegate {
    
    KINGEditStringMoreLinesView *view = [[KINGEditStringMoreLinesView alloc]init];
    view.frame = Screen_Bounds;
    view.y = Screen_Height;
    [UIView animateWithDuration:0.4 animations:^{
        view.y = 0;
    }];
    view.backgroundColor = [UIColor kdxWholeBackgroundColor];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:view];
    [view setupUI];
    [view setupProperty];
    view.delegate = delegate;
    view.editTextView.text = currentMessage;
    _editStringMoreLinesCurrentView = currentView;
}


- (void)buttonClick:(UIButton *)button {
    [self endEditing:YES];
    KDXLog(@"点击了按钮%@,tag值是%tu",button.currentTitle,button.tag);
    if (button.tag == 0) {
        [UIView animateWithDuration:0.3 animations:^{
            self.y = Screen_Height;
        }completion:^(BOOL finished) {
            
            [self removeFromSuperview];
        }];
    }else {
        if ([self.delegate respondsToSelector:@selector(editStringMoreLinesView:currentView:messageOfEdited:)]) {
            [self.delegate editStringMoreLinesView:self currentView:_editStringMoreLinesCurrentView messageOfEdited:self.editTextView.text];
        }
        [UIView animateWithDuration:0.3 animations:^{
            self.y = Screen_Height;
        }completion:^(BOOL finished) {
            
            [self removeFromSuperview];
        }];
    }
    _editStringMoreLinesCurrentView = nil;
}

- (void)setupProperty {
    self.backgroundColor = [UIColor clearColor];
    self.baseView.backgroundColor = [UIColor kdxWholeBackgroundColor];
    self.editTextView.backgroundColor = [UIColor whiteColor];
    
    CGRect frame = [self.editTextView frame];
    frame.size.width = 10.0f;
    [self.editTextView becomeFirstResponder];
}

- (void)setupUI {
    [self.baseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self).offset(20);
        make.bottom.equalTo(self);
    }];
    [self.editTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kdxMarginListLineLeft);
        make.right.equalTo(self).offset(kdxMarginListLineRight);
        make.top.equalTo(self).offset(2*kdxMarginListLineLeft+20);
        make.height.equalTo(@120);
    }];
    
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kdxMarginButtonLeft);
        make.bottom.equalTo(self.mas_centerY).offset(kdxMarginButtonBottom);
        make.right.equalTo(self.confirmButton.mas_left).offset(-kdxMarginButtonBetween);
        make.height.equalTo(@(kdxHeightButton));
    }];
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_centerX);
        make.top.equalTo(self.cancelButton);
        make.right.equalTo(self).offset(kdxMarginButtonRight);
        make.bottom.equalTo(self.cancelButton);
    }];
}
KINGLazyView(self, baseView)
KINGLazyAnyView(self, editTextView, UITextView)
KINGLazyKDXButtonLeft(self, cancelButton, @"取消", 0)
KINGLazyKDXButtonRight(self, confirmButton, @"确认", 1)

@end
