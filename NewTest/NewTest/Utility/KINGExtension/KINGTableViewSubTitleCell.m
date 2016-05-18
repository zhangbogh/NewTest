//
//  KINGTableViewSubTitleCell.m
//  ToolsApp
//
//  Created by 王旭 on 16/4/12.
//  Copyright © 2016年 新网聚联. All rights reserved.
//  主要用在勋章

#import "KINGTableViewSubTitleCell.h"

@interface KINGTableViewSubTitleCell ()

@property (nonatomic ,weak) UIView *line;

@end


@implementation KINGTableViewSubTitleCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self setupUI];
    self.leftLabel.textColor = [UIColor kdxBlueColor];
    self.leftSubLabel.textColor = [UIColor kdxTextCellMessageColor];
    self.rightLabel.textColor = [UIColor kdxTextCellTimeColor];
    
    self.leftLabel.font = [UIFont systemFontOfSize:18];
    self.leftSubLabel.font = [UIFont systemFontOfSize:13];
    self.rightLabel.font = [UIFont systemFontOfSize:13];
    
    self.line.backgroundColor = [UIColor kdxWholeBackgroundColor];
}


- (void)setupUI {
    
    
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kdxMarginListFontLeft);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@46);
        make.width.equalTo(@46);
    }];
    
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftImageView.mas_right).offset(kdxMarginListFontLeft);
        make.bottom.equalTo(self.contentView.mas_centerY).offset(-4);
        make.height.equalTo(@(18));
    }];
    
    [self.leftSubLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftLabel);
        make.top.equalTo(self.leftLabel.mas_bottom).offset(8);
        make.height.equalTo(@(13));
    }];
    
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(kdxMarginListLineRight);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@(self.rightImageView.image.size.height));
        make.width.equalTo(@(self.rightImageView.image.size.width));
//        make.height.equalTo(@30);
//        make.width.equalTo(@30);
    }];
    
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.rightImageView.mas_left).offset(kdxMarginListLineRight);
        make.top.equalTo(self.leftSubLabel);
        make.height.equalTo(self.leftSubLabel);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.height.equalTo(@1);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
    }];
    
    
}

KINGLazyLabel(self.contentView, leftLabel)
KINGLazyLabel(self.contentView, leftSubLabel)
KINGLazyLabel(self.contentView, rightLabel)
KINGLazyImageView(self.contentView, leftImageView)
KINGLazyImageView(self.contentView, rightImageView)
KINGLazyView(self.contentView, line)


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
