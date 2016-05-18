//
//  KINGUpDownLabCircleButton.m
//  ToolsApp
//
//  Created by 王旭 on 16/4/14.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import "KINGUpDownLabCircleButton.h"

@interface KINGUpDownLabCircleButton ()
@property (nonatomic ,weak) UIView *midLine;
@end

@implementation KINGUpDownLabCircleButton

+ (instancetype)buttonWithUpTitle:(NSString *)upTitle downTitle:(NSString *)downTitle {
    return [[self alloc]initWithUpTitle:upTitle downTitle:downTitle];
}

- (instancetype)initWithUpTitle:(NSString *)upTitle downTitle:(NSString *)downTitle {
    if (self = [self init]) {
        self.bgColorNormal = [UIColor clearColor];
        self.bgColorHighLighted = [UIColor kdxBlueColor];
        self.upLabel.text = upTitle;
        self.downLabel.text = downTitle;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setupUI];
            [self setupProperty];
        });
    }
    return self;
}

- (void)setupProperty {
    
    self.upLabel.textColor = [UIColor kdxTextCellSubTitleColor];
    self.upLabel.font = [UIFont systemFontOfSize:self.width*0.3];
    
    self.downLabel.textColor = [UIColor kdxTextCellSubTitleColor];
    self.downLabel.font = [UIFont systemFontOfSize:self.width*0.3];
    
    self.midLine.backgroundColor = [UIColor lightGrayColor];
    
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 1;
    

    [self setBackgroundImage:[UIImage imageWithColor:self.bgColorNormal] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageWithColor:[UIColor kdxBlueColor]] forState:UIControlStateHighlighted];

}

- (void)setupUI {
    
    [self.midLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.height.equalTo(@1);
        make.width.equalTo(self);
    }];
    [self.upLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self.mas_centerY);
        make.width.equalTo(self).multipliedBy(0.5);
    }];
    [self.downLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.mas_centerY);
        make.bottom.equalTo(self);
        make.width.equalTo(self).multipliedBy(0.5);
    }];
}

KINGLazyLabel(self, upLabel)
KINGLazyLabel(self, downLabel)
KINGLazyView(self, midLine)
@end
