//
//  UILabel+Extension.m
//  ToolsApp
//
//  Created by 王旭 on 16/4/5.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)



- (void) textLeftTopAlign: (NSString *)desc
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.lineSpacing = 10;// 字体的行间距
    
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont kdxTextFont],
                                 NSParagraphStyleAttributeName:paragraphStyle,
                                 NSForegroundColorAttributeName:
                                 [UIColor colorWithRed:76/255.0 green:76/255.0 blue:76/255.0 alpha:1]
                                 };
    
    self.attributedText = [[NSAttributedString alloc] initWithString:desc attributes:attributes];

}


+ (instancetype)circleLabel {
    
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.masksToBounds = YES;
    label.layer.borderColor = [UIColor lightGrayColor].CGColor;
    label.layer.borderWidth = 1;
    dispatch_async(dispatch_get_main_queue(), ^{
        
        label.layer.cornerRadius = label.frame.size.height / 2;
    });
    

    return label;
}
                             
                             

@end
