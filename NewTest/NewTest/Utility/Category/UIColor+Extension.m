//
//  UIColor+helper.m
//  Kline
//
//  Created by zhaomingxi on 14-2-9.
//  Copyright (c) 2014年 zhaomingxi. All rights reserved.
//

#import "UIColor+Extension.h"
#import "ColorModel.h"

@implementation UIColor (helper)

//MARK: 常用颜色

+(UIColor *)kdxWholeBackgroundColor {
    return [UIColor colorWithHexString:@"#f3f3f3" withAlpha:1];
}

+(UIColor *)kdxBlackBackgroundColor {
    return [UIColor colorWithHexString:@"#000000" withAlpha:0.7];
}

+(UIColor *)kdxWhitePopBackgroundColor {
    return [UIColor colorWithHexString:@"#ffffff" withAlpha:0.85];
}

+(UIColor *)kdxCellSelectedBackgroundColor {
    return [UIColor colorWithHexString:@"#eeeeee"];
}

+ (UIColor *)kdxLineColor {
    return [UIColor colorWithHexString:@"#e5e5e5"];
}//#e5e5e5




+(UIColor *)kdxTextCellTitleColor {
    return [UIColor colorWithHexString:@"333333"];
}//放弃纯黑色  333333

+(UIColor *)kdxTextCellSubTitleColor {
    return [UIColor colorWithHexString:@"7c7c7c"];
} //7c7c7c

+(UIColor *)kdxTextCellShortMessageColor {
    return [UIColor colorWithHexString:@"999999"];
}//999999

+(UIColor *)kdxTextCellTimeColor {
    return [UIColor colorWithHexString:@"aaaaaa"];
}//aaaaaa

+(UIColor *)kdxTextCellMessageColor {
    return [UIColor colorWithHexString:@"666666"];
}//666666

+(UIColor *)kdxBlueColor {
    return [UIColor colorWithHexString:@"#007fa0"];
}

+(UIColor *)kdxLightBlueColor {
    return [UIColor colorWithHexString:@"#00f5ff"]; 
}

+(UIColor *)kdxTextBlueColor {
    return [UIColor colorWithHexString:@"#8eeaff"];
}

+(UIColor *)kdxMidBlueColor {
    return [UIColor colorWithHexString:@"#007492"];
}

+(UIColor *)kdxDarkBlueColor {
    return [UIColor colorWithHexString:@"#004d66"];
}

+ (UIColor *)kdxGreenColor {
    return [UIColor colorWithHexString:@"238e23"];
}//238e23

+ (UIColor *)kdxRedColor {
    return [UIColor colorWithHexString:@"d00000"];
}//d00000

+ (UIColor *)kdxPurpleColor {
    return [UIColor colorWithHexString:@"0000ff"];
}//0000ff



+ (UIColor *)kingTextColor333333 {
    return [UIColor colorWithHexString:@"333333"];
}//333333
+ (UIColor *)kingTextColor666666 {
    return [UIColor colorWithHexString:@"666666"];
}//666666
+ (UIColor *)kingTextColor7c7c7c {
    return [UIColor colorWithHexString:@"7c7c7c"];
}//7c7c7c
+ (UIColor *)kingTextColor999999 {
    return [UIColor colorWithHexString:@"999999"];
}//999999
+ (UIColor *)kingTextColoraaaaaa {
    return [UIColor colorWithHexString:@"aaaaaa"];
}//aaaaaa



#pragma mark 16进制颜色转换
// color = #FFFFFF 或者 0xFFFFFF
+ (UIColor *) colorWithHexString: (NSString *)color withAlpha:(CGFloat)alpha
{
    unsigned int r, g, b;
    ColorModel *rgb = [self RGBWithHexString:color withAlpha:alpha];
    r = rgb.R;
    g = rgb.G;
    b = rgb.B;
    alpha = rgb.alpha;
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}

#pragma mark 16进制转换为RGB模式
+ (ColorModel *) RGBWithHexString: (NSString *)color withAlpha:(CGFloat)alpha{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return Nil;
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return Nil;
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    ColorModel *rgb = [[ColorModel alloc] init];
    rgb.R = r;
    rgb.B = b;
    rgb.G = g;
    rgb.alpha = alpha;
    return  rgb;
}

#pragma mark - color
+(UIColor *)getColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

+(UIColor *)randomColor {
    NSInteger r = random() % 256;
    NSInteger g = random() % 256;
    NSInteger b = random() % 256;
    return [UIColor getColorWithRed:r green:g blue:b alpha:1];

}



@end
