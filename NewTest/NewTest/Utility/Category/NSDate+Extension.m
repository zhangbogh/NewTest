//
//  NSDate+Extension.m
//  王旭
//
//  Created by 王旭 on 14-10-18.
//  Copyright (c) 2014年 王旭. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

/**
 *  判断某个时间是否为今年
 */
- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 获得某个时间的年月日时分秒
    NSDateComponents *dateCmps = [calendar components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *nowCmps = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    return dateCmps.year == nowCmps.year;
}

/**
 *  判断某个时间是否为昨天
 */
- (BOOL)isYesterday
{
    NSDate *now = [NSDate date];
    
    // date ==  2014-04-30 10:05:28 --> 2014-04-30 00:00:00
    // now == 2014-05-01 09:22:10 --> 2014-05-01 00:00:00
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    // 2014-04-30
    NSString *dateStr = [fmt stringFromDate:self];
    // 2014-10-18
    NSString *nowStr = [fmt stringFromDate:now];
    
    // 2014-10-30 00:00:00
    NSDate *date = [fmt dateFromString:dateStr];
    // 2014-10-18 00:00:00
    now = [fmt dateFromString:nowStr];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:date toDate:now options:0];
    
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
}

/**
 *  判断某个时间是否为今天
 */
- (BOOL)isToday
{
    NSDate *now = [NSDate date];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateStr = [fmt stringFromDate:self];
    NSString *nowStr = [fmt stringFromDate:now];
    
    return [dateStr isEqualToString:nowStr];
}

+(NSDate *)dateWithString:(NSString *)dateString dateFormatter:(NSString *)dateFormatterString{
    NSDateFormatter * dateFormatter = [[self class]getDateFormatter:dateFormatterString];
    NSDate * date = [dateFormatter dateFromString:dateString];
    return date;
}
+(NSString *)stringWithDate:(NSDate *)date dateFormatter:(NSString *)dateFormatterString{
    NSDateFormatter * dateFormatter = [[self class]getDateFormatter:dateFormatterString];
    NSString * dateString = [dateFormatter stringFromDate:date];
    return dateString;
}
+(NSDateFormatter *)getDateFormatter:(NSString *)formatter{
    /** formatter
     G:公元时代，例如AD公元
     yy:年的后2位
     yyyy:完整年
     MM:月，显示为1-12
     MMM:月，显示为英文月份简写,如Jan
     MMMM:月，显示为英文月份全称，如Janualy
     dd:日，2位数表示，如02
     d:日，1-2位显示，如2
     EEE:简写星期几，如Sun
     EEEE:全写星期几，如Sunday
     aa:上下午，AM/PM
     H:时，24小时制，0-23
     K：时，12小时制，0-11
     m:分，1-2位
     mm:分，2位
     s:秒，1-2位
     ss:秒，2位
     S:毫秒
     */
    NSDateFormatter * dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:formatter];
    return dateFormatter;
}

@end
