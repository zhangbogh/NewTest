//
//  KINGUpDownLabCircleButton.h
//  ToolsApp
//
//  Created by 王旭 on 16/4/14.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KINGUpDownLabCircleButton : UIButton

@property (nonatomic ,weak) UILabel *upLabel;
@property (nonatomic ,weak) UILabel *downLabel;
@property (nonatomic ,strong) UIColor *bgColorNormal;//默认clearColor
@property (nonatomic ,strong) UIColor *bgColorHighLighted;//默认为kdxblue

+ (instancetype)buttonWithUpTitle:(NSString *)upTitle downTitle:(NSString *)downTitle;

- (instancetype)initWithUpTitle:(NSString *)upTitle downTitle:(NSString *)downTitle;

@end
