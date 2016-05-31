//
//  XXChartCorverView.m
//  NewTest
//
//  Created by 王旭 on 16/5/31.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import "XXChartCorverView.h"

@interface XXChartCorverView ()
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) NSInteger timeCount;
@end

@implementation XXChartCorverView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplayLink)];
        [self.displayLink addToRunLoop: [NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
    return self;
}
- (void)handleDisplayLink {
    self.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.99];
    [self setNeedsDisplay];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    for (int i = 0; i<5; i++) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(30, 200 / 5 * i + 50)];
        [path addLineToPoint:CGPointMake(300, 200 / 5 * i + 50)];
        [[UIColor greenColor]setStroke];
        path.lineWidth = 2;
        [path stroke];
    }

    CGRect rectClear = CGRectMake(0, 0, self.timeCount*3, 250);
    if (self.timeCount*3>=self.width) {
        [self.displayLink invalidate];
        self.displayLink = nil;
        [self removeFromSuperview];
    }
    self.timeCount++;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextClearRect(ctx, rectClear);


}


@end
