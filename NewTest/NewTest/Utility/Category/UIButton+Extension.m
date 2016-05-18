//
//  UIButton+Extension.m
//  ToolsApp
//
//  Created by 王旭 on 16/3/29.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import "UIButton+Extension.h"
#import <YYKit.h>
#import "ResourceDefine.h"
#import "UIColor+Extension.h"
#import "UIFont+Extension.h"


@implementation UIButton (Extension)


+ (instancetype)buttonWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    // 设置尺寸
    
    CGSize size = btn.currentBackgroundImage.size;
    btn.size = CGSizeMake(size.width / Screen_scale, size.height / Screen_scale);
    return btn;
}


+(instancetype)kdxSingleButtonWithTitle:(NSString *)title {
    
    UIButton *button = [UIButton kdxButtonWithTitle:title];
    button.layer.borderColor = [UIColor colorWithRed:142/255.0 green:215/255.0 blue:232/255.0 alpha:1].CGColor;
    button.layer.borderWidth = 1;
    
    return button;
}

+(instancetype)kdxLeftButtonWithTitle:(NSString *)title {
    
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:[UIFont buttonFontSize]];
    [button setTitleColor:[UIColor colorWithHexString:@"#007fa0"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"#13b7dd" withAlpha:0.2]] forState:UIControlStateHighlighted];
    button.layer.borderColor = [UIColor colorWithHexString:@"#007fa0"].CGColor;
    button.layer.borderWidth = 1;
    return button;
}

+(instancetype)kdxRightButtonWithTitle:(NSString *)title {
    
    UIButton *button = [UIButton kdxButtonWithTitle:title];
    return button;
}



+(instancetype)kdxButtonWithTitle:(NSString *)title {
    
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:[UIFont buttonFontSize]];
    [button setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexString:@"#94e2f3"] forState:UIControlStateHighlighted];
    [button setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"#007fa0"]] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"#004d66"]] forState:UIControlStateHighlighted];
    return button;
}


//+(instancetype)kdxButtonWithTitle:(NSString *)title size:(CGSize)size {
//    UIButton *button = [UIButton kdxButtonWithTitle:title];
//    button.size = size;
//    return button;
//}

@end
