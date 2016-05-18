//
//  KINGTableViewCell.m
//  ToolsApp
//
//  Created by 王旭 on 16/4/11.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import "KINGTableViewCell.h"

@interface KINGTableViewCell ()

@property (nonatomic ,weak) UIView *line;

@end

@implementation KINGTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.leftLabel.font = [UIFont kdxCellTitleFont];
        self.rightLabel.textColor = [UIColor lightGrayColor];
        self.rightLabel.font = [UIFont kdxCellSubTitleFont];
        self.line.backgroundColor = [UIColor kdxWholeBackgroundColor];

        dispatch_async(dispatch_get_main_queue(), ^{
//            if (self.leftImageView.image == nil) {
//                self.leftImageView.hidden = YES;
//            }
//            if (self.rightImageView.image == nil) {
//                self.rightImageView.hidden = YES;
//            }
             [self setupUI];
            switch (self.rightLabel.textAlignment) {
                case NSTextAlignmentLeft:
                    [self changeToLeft];
                    break;
                case NSTextAlignmentRight:
                    [self changeToRight];
                    break;
                default:
                    [self changeToRight];
                    break;
            }
        });
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self setupUI];
}

- (void)changeToLeft {
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftLabel.mas_right).offset(kdxMarginListFontLeft);
    }];
}
- (void)changeToRight {
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(kdxMarginListFontRight);
    }];
}



- (void)setupUI {
    
    
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kdxMarginListLineLeft);
        make.top.equalTo(self.contentView).offset(kdxMarginListLineTop);
        make.height.equalTo(@(self.contentView.height - 2 * kdxMarginListLineTop));
        make.width.equalTo(self.leftImageView.mas_height);
    }];
    
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kdxMarginListFontLeft);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(self.contentView);
    }];
    
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(kdxMarginListLineRight);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@30);
        make.width.equalTo(@30);
    }];
    
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftLabel.mas_right).offset(kdxMarginListFontLeft);
        make.top.equalTo(self.contentView);
        make.height.equalTo(self.contentView);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.height.equalTo(@1);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
    }];
    
    
}

KINGLazyLabel(self.contentView, leftLabel)
KINGLazyLabel(self.contentView, rightLabel)
KINGLazyImageView(self.contentView, leftImageView)
KINGLazyImageView(self.contentView, rightImageView)
KINGLazyView(self.contentView, line)


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
