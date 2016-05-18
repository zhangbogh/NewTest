//
//  UIFont+Extension.h
//  ToolsApp
//
//  Created by 王旭 on 16/3/31.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Extension)

//MARK: 康得新常用字符大小设置


+ (UIFont *)kdxTitleForChineseFont;                 //标题:32px

+ (UIFont *)kdxTitleForEnglishOrNumberFont;         //标题:30px 英文和数字

+ (UIFont *)kdxSubTitleFont;                //标题：28px 例如：清空列表 ，下层标题、菜单

+ (UIFont *)kdxLittleTitleFont;                     //小标题：返回字体大小：24px

+ (UIFont *)kdxTextFont;                            //文字内容:26px

+ (UIFont *)kdxPopTitleFont;                        //弹窗标题：28px；

+ (UIFont *)kdxPopTextFont;                         //弹窗内容：26px

+ (UIFont *)kdxListTitleFont;                        //列表文字大小

+ (UIFont *)kdxButtonFont;
//cell主标题字体大小
+ (UIFont *)kdxCellTitleFont;
//cell子标题字体大小
+ (UIFont *)kdxCellSubTitleFont;

+ (UIFont *)kdxTextCellTitleFont;          //333333     32px

+ (UIFont *)kdxTextCellSubTitleFont;       //7c7c7c     28px

+ (UIFont *)kdxTextCellShortMessageFont;   //999999     24px

+ (UIFont *)kdxTextCellTimeFont;           //aaaaaa     24px

+ (UIFont *)kdxTextCellMessageFont;        //666666     24px



+ (UIFont *)kingTextFont10;
+ (UIFont *)kingTextFont11;
+ (UIFont *)kingTextFont12;
+ (UIFont *)kingTextFont13;
+ (UIFont *)kingTextFont14;
+ (UIFont *)kingTextFont15;
+ (UIFont *)kingTextFont16;
+ (UIFont *)kingTextFont17;
+ (UIFont *)kingTextFont18;
+ (UIFont *)kingTextFont20;
+ (UIFont *)kingTextFont26;






@end
