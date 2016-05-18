//
//  KINGEditDateView.h
//  ToolsApp
//
//  Created by 王旭 on 16/5/6.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KINGEditDateView;


@protocol KINGEditDateViewDelegate <NSObject>


- (void)editDateView:(KINGEditDateView *)editDateView currentView:(UIView *)currentView messageOfEdited:(NSString *)message;

@end

@interface KINGEditDateView : UIView

+ (void)gotoEditDateViewWithCurrentView:(UIView *)currentView Delegate:(id<KINGEditDateViewDelegate>)delegate;

@end

