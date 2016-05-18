//
//  KINGEditStringMoreLinsView.h
//  ToolsApp
//
//  Created by 王旭 on 16/5/10.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KINGEditStringMoreLinesView;
@protocol KINGEditStringMoreLinesViewDelegate <NSObject>

- (void)editStringMoreLinesView:(KINGEditStringMoreLinesView *)editStringMoreLinesView currentView:(UIView *)currentView messageOfEdited:(NSString *)message;

@end

@interface KINGEditStringMoreLinesView : UIView


+ (void)gotoEditStringMoreLinesViewWithCurrentView:(UIView *)currentView currentMessage:(NSString *)currentMessage Delegate:(id<KINGEditStringMoreLinesViewDelegate>)delegate;
@end
