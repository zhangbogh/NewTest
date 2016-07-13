//
//  XXChartCorverView.m
//  NewTest
//
//  Created by 王旭 on 16/5/31.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import "XXChartCorverView.h"

@interface XXChartCorverView ()
@property (nonatomic ,assign) BOOL animation;
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) NSInteger timeCount;
@end

@implementation XXChartCorverView


- (instancetype)initWithAnimation:(BOOL)animation {
    _animation = animation;
    if (self = [self init]) {
        self.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.99999];
        if (animation) {
            self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplayLink)];
            [self.displayLink addToRunLoop: [NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        }
    }
    return self;
}

- (void)handleDisplayLink {
    [self setNeedsDisplay];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    //画轴线
    [self.axisColor setStroke];
    CGFloat xAxisX = 0.1*width;
    CGFloat xAxisY = 0.8*height;
    CGFloat xAxisWidth = 0.8*width;
    UIBezierPath *xAxis = [UIBezierPath bezierPath];
    [xAxis moveToPoint:CGPointMake(xAxisX , xAxisY)];
    [xAxis addLineToPoint:CGPointMake(xAxisX + xAxisWidth, xAxisY)];
    xAxis.lineWidth = 1;
    [xAxis stroke];
    
    CGFloat yAxisX = 0.15*width;
    CGFloat yAxisY = 0.05*height;
    CGFloat yAxisHeight = 0.9*width;
    UIBezierPath *yAxis = [UIBezierPath bezierPath];
    [yAxis moveToPoint:CGPointMake(yAxisX, yAxisY)];
    [yAxis addLineToPoint:CGPointMake(yAxisX, yAxisY + yAxisHeight)];
    yAxis.lineWidth = 1;
    [yAxis stroke];
    
    CGFloat yTittleMargin = (xAxisY - yAxisY)/(self.yTittleCount + 1);
    for (int i = 0; i < self.yTittleCount; i++) {
        //绘制背景横线
        [self.backLineColor setStroke];//设置背景网格颜色
        CGFloat x = yAxisX;
        CGFloat y = yTittleMargin * (i + 1) + yAxisY;
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(x, y)];
        [path addLineToPoint:CGPointMake(xAxisX + xAxisWidth, y)];
        path.lineWidth = 1;
        [path stroke];
    }
    
    
    CGFloat margin = 10;
    CGFloat xTittleMargin = (xAxisX + xAxisWidth - yAxisX - 2 * margin)/(self.xTittles.count - 1);
    
    [self.xTittles enumerateObjectsUsingBlock:^(NSString *xTittle, NSUInteger idx, BOOL * _Nonnull stop) {
        
        //绘制背景纵线
        [self.backLineColor set];
        CGFloat x = yAxisX + margin + xTittleMargin * idx;
        CGFloat backLineY = (xAxisY - yAxisY)/(self.yTittleCount + 1) + yAxisY - margin;
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(x, backLineY)];
        [path addLineToPoint:CGPointMake(x, xAxisY)];
        path.lineWidth = 1;
        [path stroke];
    }];
    
}


@end
