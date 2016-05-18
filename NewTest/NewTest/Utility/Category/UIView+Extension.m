//
//  UIView+Extension.m
//  王旭
//
//  Created by 王旭 on 14-10-18.
//  Copyright (c) 2014年 王旭. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (CGRect)frameInsetFromEdge:(CGFloat)left :(CGFloat)top :(CGFloat)right :(CGFloat)bottom {
    return CGRectMake(left, top, self.width - left - right, self.height - top - bottom);
}

+ (instancetype)viewWithUpImage:(UIImage *)image downTitle:(NSString *)title {
    return [[self alloc]initWithUpImage:image downTitle:title];
}

- (instancetype)initWithUpImage:(UIImage *)image downTitle:(NSString *)title {
    if (self = [self init]) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = image;
        [self addSubview:imageView];
        UILabel *label = [[UILabel alloc]init];
        label.text = title;
        [self addSubview:label];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:12];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self);
                make.top.equalTo(self).offset(3.0/16*self.height);
                make.bottom.equalTo(self).multipliedBy(0.6);
                make.width.equalTo(imageView.mas_height);
            }];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self);
                make.right.equalTo(self);
                make.bottom.equalTo(self);
                make.top.equalTo(imageView.mas_bottom);
            }];
        });  
    }
    return self;
}

+ (instancetype)viewForTableFooterView {
    UIView *view = [[UIView alloc]initWithFrame:Screen_Bounds];
//    UIView *cellShadow = [[UIView alloc]initWithFrame:CGRectMake(0, 0, view.width, 3)];
//    [view addSubview:cellShadow];
    view.backgroundColor = [UIColor kdxWholeBackgroundColor];
//    cellShadow.backgroundColor = [UIColor colorWithWhite:240/255.0 alpha:1];
    return view;
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}
@end
