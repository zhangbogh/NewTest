//
//  KINGEditSwichView.h
//  ToolsApp
//
//  Created by 王旭 on 16/5/9.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KINGEditSwichView;


@protocol KINGEditSwichViewDelegate <NSObject>


- (void)editSwichView:(KINGEditSwichView *)editSwichView currentView:(UIView *)currentView messageOfEdited:(NSString *)message;

@end

@interface KINGEditSwichView : UIView

+ (void)gotoEditSwichViewWithCurrentView:(UIView *)currentView Swiches:(NSArray *)swiches Delegate:(id<KINGEditSwichViewDelegate>)delegate;

@end
