//
//  KINGEditDateView.m
//  ToolsApp
//
//  Created by 王旭 on 16/5/6.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import "KINGEditDateView.h"
UIView *_editDateCurrentView;

@interface KINGEditDateView ()

@property (nonatomic ,weak) UIView *baseView;
@property (nonatomic ,weak) UILabel *editLabel;
@property (nonatomic ,weak) UIDatePicker *datePicker;
@property (nonatomic ,weak) UIButton *cancelButton;
@property (nonatomic ,weak) UIButton *confirmButton;
@property (nonatomic ,weak) id<KINGEditDateViewDelegate> delegate;


@end

@implementation KINGEditDateView


+ (void)gotoEditDateViewWithCurrentView:(UIView *)currentView Delegate:(id<KINGEditDateViewDelegate>)delegate {
    KINGEditDateView *view = [[KINGEditDateView alloc]init];
    view.frame = Screen_Bounds;
    view.y = Screen_Height;
    [UIView animateWithDuration:0.4 animations:^{
        view.y = 0;
    }];
    view.backgroundColor = [UIColor kdxWholeBackgroundColor];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:view];
    view.delegate = delegate;
    _editDateCurrentView = currentView;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    [self setupUI];
    [self setupProperty];
    self.editLabel.hidden = YES;
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
        if ([self.delegate respondsToSelector:@selector(editDateView:currentView:messageOfEdited:)]) {
            [self.delegate editDateView:self currentView:_editDateCurrentView messageOfEdited:[NSDate stringWithDate:self.datePicker.date dateFormatter:DateFormatter_day]];
        }
        [UIView animateWithDuration:0.3 animations:^{
            self.y = Screen_Height;
        }completion:^(BOOL finished) {
            
            [self removeFromSuperview];
        }];
    }
    _editDateCurrentView = nil;

}

- (void)setupProperty {
    self.backgroundColor = [UIColor clearColor];
    self.baseView.backgroundColor = [UIColor kdxWholeBackgroundColor];
    self.editLabel.backgroundColor = [UIColor whiteColor];
    
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker.backgroundColor = [UIColor whiteColor];
}

- (void)setupUI {
    [self.baseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self).offset(20);
        make.bottom.equalTo(self);
    }];
    [self.editLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kdxMarginListLineLeft);
        make.right.equalTo(self).offset(kdxMarginListLineRight);
        make.top.equalTo(self).offset(2*kdxMarginListLineLeft+20);
        make.height.equalTo(@44);
    }];
    
    [self.datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(@200);
        make.bottom.equalTo(self.cancelButton.mas_top).offset(kdxMarginListLineBottom);
    }];
    KINGLazySetTowKDXButton(cancelButton, confirmButton, self)
    
//    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self).offset(kdxMarginButtonLeft);
//        make.bottom.equalTo(self.mas_centerY).offset(kdxMarginButtonBottom);
//        make.right.equalTo(self.confirmButton.mas_left).offset(-kdxMarginButtonBetween);
//        make.height.equalTo(@(kdxHeightButton));
//    }];
//    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.mas_centerX);
//        make.top.equalTo(self.cancelButton);
//        make.right.equalTo(self).offset(kdxMarginButtonRight);
//        make.bottom.equalTo(self.cancelButton);
//    }];
}
KINGLazyView(self, baseView)
KINGLazyLabel(self, editLabel)
KINGLazyAnyView(self, datePicker, UIDatePicker)
KINGLazyKDXButtonLeft(self, cancelButton, @"取消", 0)
KINGLazyKDXButtonRight(self, confirmButton, @"确认", 1)


@end
