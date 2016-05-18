//
//  UIColor+helper.h
//  Kline
//
//  Created by zhaomingxi on 14-2-9.
//  Copyright (c) 2014年 zhaomingxi. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ColorModel;
@interface UIColor (helper)

+ (UIColor *) colorWithHexString: (NSString *)color withAlpha:(CGFloat)alpha;
+ (ColorModel *) RGBWithHexString: (NSString *)color withAlpha:(CGFloat)alpha;

#pragma mark - color
+(UIColor *)getColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

+(UIColor *)randomColor;


#pragma mark - 康得新常用颜色
+ (UIColor *)kdxWholeBackgroundColor;        //整体背景       #f3f3f3

+ (UIColor *)kdxBlackBackgroundColor;        //黑色大背景     #000000;透明度：70%

+ (UIColor *)kdxWhitePopBackgroundColor;     //白色弹窗       #ffffff;透明度：85%

+ (UIColor *)kdxCellSelectedBackgroundColor;     //cell被选中       #eeeeee;

+ (UIColor *)kdxLineColor;                      //#e5e5e5



+ (UIColor *)kdxTextCellTitleColor;          //放弃纯黑色  333333

+ (UIColor *)kdxTextCellSubTitleColor;       //7c7c7c

+ (UIColor *)kdxTextCellShortMessageColor;   //999999

+ (UIColor *)kdxTextCellTimeColor;           //aaaaaa

+ (UIColor *)kdxTextCellMessageColor;        //666666


+ (UIColor *)kdxBlueColor;

+ (UIColor *)kdxLightBlueColor;

+ (UIColor *)kdxTextBlueColor;

+ (UIColor *)kdxMidBlueColor;

+ (UIColor *)kdxDarkBlueColor;

+ (UIColor *)kdxGreenColor;     //238e23

+ (UIColor *)kdxRedColor;       //d00000

+ (UIColor *)kdxPurpleColor;    //0000ff


+ (UIColor *)kingTextColor333333;          //333333
+ (UIColor *)kingTextColor666666;          //666666
+ (UIColor *)kingTextColor7c7c7c;          //7c7c7c
+ (UIColor *)kingTextColor999999;          //999999
+ (UIColor *)kingTextColoraaaaaa;          //aaaaaa


@end
