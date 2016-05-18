//
//  KINGSimpleItemViewLikeCell.m
//  ToolsApp
//
//  Created by 王旭 on 16/5/5.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import "KINGSimpleItemViewLikeCell.h"

@interface KINGSimpleItemViewLikeCell ()

@property (nonatomic ,weak) UILabel *leftTitleLabel;
@property (nonatomic ,weak) UILabel *messageLabel;
@property (nonatomic ,weak) UIView *line;


@end



@implementation KINGSimpleItemViewLikeCell


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
    self.leftTitleLabel.textColor = [UIColor kdxTextCellShortMessageColor];
    self.leftTitleLabel.font = [UIFont kdxTextCellSubTitleFont];
    self.messageLabel.textColor = [UIColor kdxTextCellTitleColor];
    self.messageLabel.font = [UIFont kdxTextCellSubTitleFont];
    
    
}

- (void)setupUI {
    [self.leftTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kdxMarginListFontLeft);
        make.centerY.equalTo(self);
        make.height.equalTo(self);
        make.width.equalTo(@60);
    }];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftTitleLabel.mas_right).offset(kdxMarginListFontLeft);
        make.centerY.equalTo(self);
        make.height.equalTo(self);
        make.right.equalTo(self);
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
KINGLazyView(self, line)


@end
