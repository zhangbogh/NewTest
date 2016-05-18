//
//  KINGHistogramView.h
//  ToolsApp
//
//  Created by 王旭 on 16/4/12.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KINGHistogramView : UIView
@property (nonatomic,strong) NSArray * dataArray;
@property (nonatomic ,copy) NSString *title;//默认没有标题
@property (nonatomic ,strong) UIColor *showColor;//默认颜色为kdx浅蓝

@end
