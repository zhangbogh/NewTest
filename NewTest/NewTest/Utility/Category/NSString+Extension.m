//
//  NSString+Extension.m
//  王旭
//
//  Created by 王旭 on 14-10-18.
//  Copyright (c) 2014年 王旭. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

+ (instancetype)timeStringWithIntSecTime:(int)intSecTime {
    int hour = intSecTime / 3600;
    int min = (intSecTime - hour * 3600) / 60;
    int sec = intSecTime - hour * 3600 - min * 60;
    NSString * timeString;
    timeString = [NSString stringWithFormat:@"%02tu:%02tu:%02tu",hour,min,sec];
    return timeString;
}

+ (instancetype)timeStringWithIntMinTime:(int)intMinTime {
    int hour = intMinTime / 60;
    int min = intMinTime - hour * 60;
    NSString * timeString;
    timeString = [NSString stringWithFormat:@"%02tu:%02tu",hour,min];
    return timeString;
}


- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font
{
    return [self sizeWithFont:font maxW:MAXFLOAT];
}


- (BOOL)isIntOrFloat {
    return [self isPureFloat]||[self mj_isPureInt];
}

//判断是否为整形：

- (BOOL)isPureInt{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

//判断是否为浮点形：

- (BOOL)isPureFloat{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}





@end
