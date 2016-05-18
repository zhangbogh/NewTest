//
//  KINGUpImgDownLabButton.h
//  ToolsApp
//
//  Created by 王旭 on 16/4/12.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KINGUpImgDownLabButton : UIButton

@property (nonatomic ,weak) UIImageView *upImageView;
@property (nonatomic ,weak) UILabel *downLabel;
+ (instancetype)buttonWithUpImage:(UIImage *)image downTitle:(NSString *)title;

- (instancetype)initWithUpImage:(UIImage *)image downTitle:(NSString *)title;

@end
