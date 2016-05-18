//
//  KINGInputView.m
//  密码输入test
//
//  Created by 王旭 on 16/4/6.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import "KINGInputView.h"
#import "KINGKeyboardView.h"
#import "UIView+Extension.h"

#define KINGInputViewNumCount 6

@interface  KINGInputView ()
/** 数字数组 */
@property (nonatomic, strong) NSMutableArray *nums;

@end
@implementation KINGInputView

#pragma mark - LazyLoad

- (NSMutableArray *)nums
{
    if (_nums == nil) {
        _nums = [NSMutableArray array];
    }
    return _nums;
}

#pragma mark - LifeCircle

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        /** 注册keyboard通知 */
        [self setupKeyboardNote];
    }
    return self;
}

/** 注册keyboard通知 */
- (void)setupKeyboardNote
{
    // 删除通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(delete) name:KINGNumKeyboardDeleteButtonClick object:nil];
    
    // 确定通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ok) name:KINGNumKeyboardLeftButtonClick object:nil];
    
    // 数字通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(number:) name:KINGNumKeyboardNumberButtonClick object:nil];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark - Private

// 删除
- (void)delete
{
    [self.nums removeLastObject];
    [self setNeedsDisplay];
}

// 数字
- (void)number:(NSNotification *)note
{
    if (self.nums.count >= KINGInputViewNumCount) return;
    NSDictionary *userInfo = note.userInfo;
    NSNumber *numObj = userInfo[KINGNumKeyboardNumberKey];
    [self.nums addObject:numObj];
    [self setNeedsDisplay];
}


// 确定
- (void)ok
{
    
}


- (void)drawRect:(CGRect)rect
{
    // 画图
    UIImage *field = [UIImage imageNamed:@"trade.bundle/password_in"];
    CGFloat marginUp = 0;
    CGFloat x = marginUp;
    CGFloat y = marginUp;
    CGFloat w = self.bounds.size.width;
    CGFloat h = w / KINGInputViewNumCount;

    [field drawInRect:CGRectMake(x, y, w, h)];
    

    
    // 画点
    UIImage *pointImage = [UIImage imageNamed:@"trade.bundle/yuan"];
    CGFloat pointW = self.bounds.size.width * 0.05;
    CGFloat pointH = pointW;
    CGFloat pointY =  h / 2 - pointW / 2;
    CGFloat pointX;

    int count = (int)self.nums.count;
//    count = 3;
    for (int i = 0; i < count; i++) {
        pointX = h * i + h / 2 - pointW / 2;
        [pointImage drawInRect:CGRectMake(pointX, pointY, pointW, pointH)];
    }

    
    // ok按钮状态
//    BOOL statue = NO;
//    if (self.nums.count == ZCTradeInputViewNumCount) {
//        statue = YES;
//    } else {
//        statue = NO;
//    }
//    self.okBtn.enabled = statue;
}


@end
