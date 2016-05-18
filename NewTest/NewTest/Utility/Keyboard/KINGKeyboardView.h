//
//  KINGKeyboardView.h
//  密码输入test
//
//  Created by 王旭 on 16/4/6.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import <UIKit/UIKit.h>

//提供通知和代理两种方式调用键盘
static NSString *KINGNumKeyboardDeleteButtonClick = @"KINGNumKeyboardDeleteButtonClick";
static NSString *KINGNumKeyboardLeftButtonClick = @"KINGNumKeyboardLeftButtonClick";
static NSString *KINGNumKeyboardNumberButtonClick = @"KINGNumKeyboardNumberButtonClick";
static NSString *KINGNumKeyboardNumberKey = @"KINGNumKeyboardNumberKey";

@class KINGKeyboardView;

@protocol KINGKeyboardDelegate <NSObject>

@optional
/** 数字按钮点击 */
- (void)tradeKeyboard:(KINGKeyboardView *)keyboard numBtnClick:(NSInteger)num;
/** 删除按钮点击 */
- (void)tradeKeyboardDeleteBtnClick;
/** 确定按钮点击 */
- (void)tradeKeyboardLeftBtnClick;
@end









@interface KINGKeyboardView : UIView


@property (nonatomic, weak) id<KINGKeyboardDelegate> delegate;
@property (nonatomic ,assign) NSInteger maxNumberCount;




@end
