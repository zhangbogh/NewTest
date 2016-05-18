//
//  KINGEditStringView.h
//  ToolsApp
//
//  Created by 王旭 on 16/5/5.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KINGEditStringView;
@protocol KINGEditStringViewDelegate <NSObject>

- (void)editStringView:(KINGEditStringView *)editStringView currentView:(UIView *)currentView messageOfEdited:(NSString *)message;

@end

@interface KINGEditStringView : UIView

+ (void)gotoEditStringViewWithCurrentView:(UIView *)currentView Delegate:(id<KINGEditStringViewDelegate>)delegate;

@end
