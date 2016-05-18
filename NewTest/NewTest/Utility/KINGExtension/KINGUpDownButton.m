//
//  KINGUpDownButton.m
//  ToolsApp
//
//  Created by 王旭 on 16/5/11.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import "KINGUpDownButton.h"

@interface KINGUpDownButton ()

@property (nonatomic ,weak) UILabel *upLabel;
@property (nonatomic ,weak) UIImageView *upImageView;
@property (nonatomic ,weak) UILabel *downLabel;

@end



@implementation KINGUpDownButton


+ (instancetype)buttonWithUpImage:(UIImage *)image downTitle:(NSString *)title {
    return [[self alloc]initWithUpImage:image downTitle:title];
}

+ (instancetype)buttonWithUpTitle:(NSString *)upTitle downTitle:(NSString *)downTitle {
    return [[self alloc]initWithUpTitle:upTitle downTitle:downTitle];
}

- (instancetype)initWithUpTitle:(NSString *)upTitle downTitle:(NSString *)downTitle {
    if (self = [self init]) {
        self.upLabel.textColor = [UIColor kdxBlueColor];
        self.upLabel.font = [UIFont systemFontOfSize:20];
        self.upLabel.textAlignment = NSTextAlignmentCenter;
        self.upLabel.text = upTitle;

        self.downLabel.textColor = [UIColor kdxTextCellSubTitleColor];
        self.downLabel.font = [UIFont systemFontOfSize:12];
        self.downLabel.textAlignment = NSTextAlignmentCenter;
        self.downLabel.text = downTitle;
    }
    return self;
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
    
    [self.upLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(self.height * 3.0/16);
        make.height.equalTo(self).multipliedBy(3.0/8);
//        make.width.equalTo(self.upLabel.mas_height);
    }];
    [self.upImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(self.height * 3.0/16);
        make.height.equalTo(self).multipliedBy(3.0/8);
        make.width.equalTo(self.upImageView.mas_height);
    }];
    [self.downLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.height.equalTo(@11);
        make.bottom.equalTo(self).offset(-self.height * 3.0/16);;
    }];
}
KINGLazyLabel(self, upLabel)
KINGLazyImageView(self, upImageView)
KINGLazyLabel(self, downLabel)

@end
