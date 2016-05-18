//
//  KINGSimpleItemViewLikeCell2.m
//  ToolsApp
//
//  Created by 王旭 on 16/5/9.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import "KINGSimpleItemViewLikeCell2.h"

@interface KINGSimpleItemViewLikeCell2 ()

@property (nonatomic ,weak) UILabel *leftTitleLabel;
@property (nonatomic ,weak) UILabel *messageLabel;
@property (nonatomic ,weak) UIImageView *arraw;
@property (nonatomic ,weak) UIView *line;

@end

@implementation KINGSimpleItemViewLikeCell2


- (void)setTitle:(NSString *)title {
    _title = title;
    self.leftTitleLabel.text = title;
}
- (void)setMessage:(NSString *)message {
    _message = message;
    self.messageLabel.text = message;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self setupUI];
    [self setupProperty];
}

- (void)setupProperty {
    self.line.backgroundColor = [UIColor kdxLineColor];
    self.leftTitleLabel.textColor = [UIColor kdxTextCellTitleColor];
    self.leftTitleLabel.font = [UIFont kdxTextCellSubTitleFont];
    self.messageLabel.textColor = [UIColor kdxTextCellShortMessageColor];
    self.messageLabel.font = [UIFont kdxTextCellSubTitleFont];
    self.arraw.image = [UIImage imageNamed:image_ico_arrowr];
    
}

- (void)setupUI {
    [self.leftTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kdxMarginListFontLeft);
        make.centerY.equalTo(self);
        make.height.equalTo(self);
//        make.width.equalTo(@60);
    }];
    [self.arraw mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(kdxMarginListFontRight);
        make.centerY.equalTo(self);
        make.height.equalTo(@11);
        make.width.equalTo(@7);
    }];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.leftTitleLabel.mas_right).offset(kdxMarginListFontLeft);
        make.centerY.equalTo(self);
        make.height.equalTo(self);
        make.right.equalTo(self.arraw).offset(kdxMarginListFontRight);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kdxMarginListFontLeft);
        make.right.equalTo(self);
        make.bottom.equalTo(self.mas_bottom);
        make.height.equalTo(@1);
    }];
}

KINGLazyLabel(self, leftTitleLabel)
KINGLazyLabel(self, messageLabel)
KINGLazyImageView(self, arraw)
KINGLazyView(self, line)



@end
