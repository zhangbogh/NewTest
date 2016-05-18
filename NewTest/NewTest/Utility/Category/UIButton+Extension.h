//
//  UIButton+Extension.h
//  ToolsApp
//
//  Created by 王旭 on 16/3/29.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)


//MARK: 康得新常用按钮

+(instancetype)kdxSingleButtonWithTitle:(NSString *)title;

+(instancetype)kdxLeftButtonWithTitle:(NSString *)title;

+(instancetype)kdxRightButtonWithTitle:(NSString *)title;

+(instancetype)buttonWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;




@end
