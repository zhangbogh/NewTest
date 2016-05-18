//
//  KINGUpImgDownLabButton.m
//  ToolsApp
//
//  Created by 王旭 on 16/4/12.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import "KINGUpImgDownLabButton.h"

@implementation KINGUpImgDownLabButton

+ (instancetype)buttonWithUpImage:(UIImage *)image downTitle:(NSString *)title {
    return [[self alloc]initWithUpImage:image downTitle:title];
}

- (instancetype)initWithUpImage:(UIImage *)image downTitle:(NSString *)title {
    if (self = [self init]) {
        self.downLabel.textColor = [UIColor kdxTextCellSubTitleColor];
        self.downLabel.font = [UIFont systemFontOfSize:12];
        self.downLabel.textAlignment = NSTextAlignmentCenter;
        self.upImageView.image = image;
        self.downLabel.text = title;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self setupUI];
}
- (void)setupUI {
    
    [self.upImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(self.height * 3.0/16);
        make.height.equalTo(self).multipliedBy(3.0/8);
        make.width.equalTo(self.upImageView.mas_height);
    }];
    [self.downLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.height.equalTo(@11);
        make.top.equalTo(self.upImageView.mas_bottom).offset(6);
    }];
}

KINGLazyImageView(self, upImageView)
KINGLazyLabel(self, downLabel)
@end
