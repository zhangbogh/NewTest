//
//  KINGEditView.m
//  ToolsApp
//
//  Created by 王旭 on 16/5/5.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import "KINGEditStringView.h"
UIView *_editStringCurrentView;

@interface KINGEditStringView ()

@property (nonatomic ,weak) UIView *baseView;
@property (nonatomic ,weak) UITextField *editTextField;
@property (nonatomic ,weak) UIButton *cancelButton;
@property (nonatomic ,weak) UIButton *confirmButton;
@property (nonatomic ,weak) id<KINGEditStringViewDelegate> delegate;

@end

@implementation KINGEditStringView


+ (void)gotoEditStringViewWithCurrentView:(UIView *)currentView Delegate:(id<KINGEditStringViewDelegate>)delegate {
    KINGEditStringView *view = [[KINGEditStringView alloc]init];
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
    _editStringCurrentView = currentView;
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
        if ([self.delegate respondsToSelector:@selector(editStringView:currentView:messageOfEdited:)]) {
            [self.delegate editStringView:self currentView:_editStringCurrentView messageOfEdited:self.editTextField.text];
        }
        [UIView animateWithDuration:0.3 animations:^{
            self.y = Screen_Height;
        }completion:^(BOOL finished) {
            
            [self removeFromSuperview];
        }];
    }
    _editStringCurrentView = nil;
}

- (void)setupProperty {
    self.backgroundColor = [UIColor clearColor];
    self.baseView.backgroundColor = [UIColor kdxWholeBackgroundColor];
    self.editTextField.backgroundColor = [UIColor whiteColor];
    
    CGRect frame = [self.editTextField frame];
    frame.size.width = 10.0f;
    UIView *leftview = [[UIView alloc] initWithFrame:frame];
    self.editTextField.leftViewMode = UITextFieldViewModeAlways;
    self.editTextField.leftView = leftview;
    self.editTextField.placeholder = @"请输入内容";
    [self.editTextField becomeFirstResponder];
}

- (void)setupUI {
    [self.baseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self).offset(20);
        make.bottom.equalTo(self);
    }];
    [self.editTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kdxMarginListLineLeft);
        make.right.equalTo(self).offset(kdxMarginListLineRight);
        make.top.equalTo(self).offset(2*kdxMarginListLineLeft+20);
        make.height.equalTo(@44);
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
KINGLazyTextField(self, editTextField)
KINGLazyKDXButtonLeft(self, cancelButton, @"取消", 0)
KINGLazyKDXButtonRight(self, confirmButton, @"确认", 1)

@end
