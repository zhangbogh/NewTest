//
//  NSDate+Extension.h
//  王旭
//
//  Created by 王旭 on 14-10-18.
//  Copyright (c) 2014年 王旭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)
/**
 *  判断某个时间是否为今年
 */
- (BOOL)isThisYear;
/**
 *  判断某个时间是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  判断某个时间是否为今天
 */
- (BOOL)isToday;

/**
 *  字串转时间
 *
 *  @param string        时间字串
 *  @param dateFormatter 时间格式（Define定义了部分常用格式）
 *
 *  @return 时间
 */
+(NSDate *)dateWithString:(NSString *)dateString dateFormatter:(NSString *)dateFormatterString;
/**
 *  时间转字串
 *
 *  @param date                时间
 *  @param dateFormatterString 时间格式（Define定义了部分常用格式）
 *
 *  @return 时间字串
 */
+(NSString *)stringWithDate:(NSDate *)date dateFormatter:(NSString *)dateFormatterString;
@end
