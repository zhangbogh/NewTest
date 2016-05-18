//
//  KINGUpDownButton.h
//  ToolsApp
//
//  Created by 王旭 on 16/5/11.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KINGUpDownButton : UIButton
+ (instancetype)buttonWithUpImage:(UIImage *)image downTitle:(NSString *)title;

- (instancetype)initWithUpImage:(UIImage *)image downTitle:(NSString *)title;


+ (instancetype)buttonWithUpTitle:(NSString *)upTitle downTitle:(NSString *)downTitle;

- (instancetype)initWithUpTitle:(NSString *)upTitle downTitle:(NSString *)downTitle;

@end
