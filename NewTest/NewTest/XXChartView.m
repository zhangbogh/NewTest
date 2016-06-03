//
//  XXChartView.m
//  NewTest
//
//  Created by 王旭 on 16/5/31.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import "XXChartView.h"
#import "XXChartCorverView.h"

@interface XXChartView ()
@property (nonatomic, strong) NSArray *values;
@property (nonatomic, assign) CGFloat marginX;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) NSInteger Vcount;
@property (nonatomic ,weak) XXChartCorverView *baseChartCorverView;
@property (nonatomic ,weak) XXChartCorverView *chartCorverView;



@end

@implementation XXChartView


- (instancetype)init
{
    self = [super init];
    if (self) {
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i<20; i++) {
            int j = random() % 100 + 30;
            NSNumber *number = [NSNumber numberWithInt:j];
            [array addObject:number];
        }
        self.values = array;
        self.marginX = 20;
        self.height = 200;
        self.Vcount = 5;
        XXChartCorverView *baseChartCorverView = [[XXChartCorverView alloc]initWithAnimation:NO];
        [self addSubview:baseChartCorverView];
        self.baseChartCorverView = baseChartCorverView;
        
        XXChartCorverView *chartCorverView = [[XXChartCorverView alloc]initWithAnimation:YES];
        [self addSubview:chartCorverView];
        self.chartCorverView = chartCorverView;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.baseChartCorverView.frame = self.bounds;
    self.baseChartCorverView.backgroundColor = [UIColor clearColor];
//    [self.superview bringSubviewToFront:self];
    [self.superview sendSubviewToBack:self.baseChartCorverView];
    
    self.chartCorverView.frame = self.bounds;

}
- (void)drawRect:(CGRect)rect {
//    for (int i = 0; i<self.Vcount; i++) {
//        UIBezierPath *path = [UIBezierPath bezierPath];
//        [path moveToPoint:CGPointMake(30, self.height / self.Vcount * i + 50)];
//        [path addLineToPoint:CGPointMake(300, self.height / self.Vcount * i + 50)];
//        [[UIColor greenColor]setStroke];
//        path.lineWidth = 2;
//        [path stroke];
//    }
    

    UIBezierPath *linePath = [UIBezierPath bezierPath];

    [self.values enumerateObjectsUsingBlock:^(NSNumber *number, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) {
            [linePath moveToPoint:CGPointMake(30 + 2.5, self.height - number.integerValue + 2.5)];
        }else {
            [linePath addLineToPoint:CGPointMake(32.5 + idx * self.marginX , self.height - number.integerValue + 2.5)];
        }
    }];
    linePath.lineJoinStyle = kCGLineJoinRound;
    [[UIColor blueColor]set];
    [linePath stroke];
    
    [linePath addLineToPoint:CGPointMake(32.5 + (self.values.count - 1) * self.marginX , self.height)];
    [linePath addLineToPoint:CGPointMake(32.5, self.height)];
    [[UIColor colorWithRed:0 green:0 blue:0.9 alpha:0.5]set];
    [linePath fill];
    
    [self.values enumerateObjectsUsingBlock:^(NSNumber *number, NSUInteger idx, BOOL * _Nonnull stop) {
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(30 + idx * self.marginX, self.height - number.integerValue, 5, 5)];
        [[UIColor redColor]set];
        [path fill];
    }];
    
    
}

//XXLazyAnyView(self.superview, baseChartCorverView, XXChartCorverView)
//
//XXLazyAnyView(self, chartCorverView, XXChartCorverView)



















// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect0:(CGRect)rect {
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(125, 125) radius:100 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [path addLineToPoint:CGPointMake(125, 125)];
    // fill:如果当前路径不是一个封闭路径,默认就会帮我们关闭路径
    [[UIColor greenColor]setStroke];
    [[UIColor redColor]setFill];
    [path stroke];
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 150, 150) cornerRadius:75];
    [[UIColor greenColor]setStroke];
    [[UIColor redColor]setFill];
    [path1 stroke];
    
    UIBezierPath *path2 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 150, 100)];
    [[UIColor greenColor]setStroke];
    [[UIColor redColor]setFill];
    path2.lineWidth = 5;
    [path2 stroke];
    [path2 fill];

//    CGContextAddPath(ctx, path.CGPath);
//    CGContextAddPath(ctx, path1.CGPath);
//    CGContextAddPath(ctx, path2.CGPath);
//        [[UIColor greenColor]setStroke];
//        [[UIColor redColor]setFill];
//    
//    CGContextDrawPath(ctx, kCGPathEOFillStroke);
//    CGContextStrokePath(ctx);
//    CGContextFillPath(ctx);
//    CGContextEOFillPath(ctx);

    
    UIBezierPath *path3 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 250, 150, 150) cornerRadius:75];
//    [[UIColor purpleColor]setFill];
//    CGContextAddPath(ctx, path3.CGPath);
//
//        CGContextFillPath(ctx);
    [path3 fill];


}


@end
