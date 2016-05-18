//
//  KINGEditNumberView.h
//  ToolsApp
//
//  Created by 王旭 on 16/5/6.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KINGEditNumberView;

@protocol KINGEditNumberViewDelegate <NSObject>


- (void)editNumberView:(KINGEditNumberView *)editNumberView currentView:(UIView *)currentView messageOfEdited:(NSString *)message;

@end



@interface KINGEditNumberView : UIView


+ (void)gotoEditNumberViewWithCurrentView:(UIView *)currentView Delegate:(id<KINGEditNumberViewDelegate>)delegate;

@end



