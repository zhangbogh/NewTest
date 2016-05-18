//
//  UIView+Extension.h
//  王旭
//
//  Created by 王旭 on 14-10-18.
//  Copyright (c) 2014年 王旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;


- (CGRect)frameInsetFromEdge:(CGFloat)left :(CGFloat)top :(CGFloat)right :(CGFloat)bottom;

+ (instancetype)viewWithUpImage:(UIImage *)image downTitle:(NSString *)title;

- (instancetype)initWithUpImage:(UIImage *)image downTitle:(NSString *)title;

+ (instancetype)viewForTableFooterView;
@end
