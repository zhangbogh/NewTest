//
//  KINGImageTitleRightTitleViewLickCell.m
//  ToolsApp
//
//  Created by 王旭 on 16/5/10.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import "KINGImageTitleRightTitleViewLickCell.h"

@interface KINGImageTitleRightTitleViewLickCell ()

@property (nonatomic ,weak) UIImageView *icon;
@property (nonatomic ,weak) UILabel *titleLabel;
@property (nonatomic ,weak) UILabel *subLabel;


@end


@implementation KINGImageTitleRightTitleViewLickCell


-(void)layoutSubviews {
    [super layoutSubviews];
    [self setupUI];
    [self setupProperty];
}

- (void)setupProperty {
    
    self.icon.image = [UIImage imageNamed:image_partner_icon_h_error];
    
    self.titleLabel.text = @"北京银行";
    self.subLabel.text = @"**** **** **** **** 999";
    
    self.titleLabel.textColor = [UIColor kdxTextCellSubTitleColor];
    self.titleLabel.font = [UIFont kdxTextCellSubTitleFont];
    
    self.subLabel.textColor = [UIColor kdxTextCellSubTitleColor];
    self.subLabel.font = [UIFont kdxTextCellSubTitleFont];
}

- (void)setupUI {
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.centerY.equalTo(self);
        make.width.equalTo(@18);
        make.height.equalTo(@18);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.icon.mas_right).offset(15);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
    }];
    [self.subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.right.equalTo(self).offset(-15);
    }];
}

KINGLazyImageView(self, icon)
KINGLazyLabel(self, titleLabel)
KINGLazyLabel(self, subLabel)
@end
