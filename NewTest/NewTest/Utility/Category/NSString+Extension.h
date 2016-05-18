//
//  NSString+Extension.h
//  王旭
//
//  Created by 王旭 on 14-10-18.
//  Copyright (c) 2014年 王旭. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)

+ (instancetype)timeStringWithIntSecTime:(int)intSecTime;
+ (instancetype)timeStringWithIntMinTime:(int)intMinTime;


- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;
- (CGSize)sizeWithFont:(UIFont *)font;


- (BOOL)isIntOrFloat;
@end
