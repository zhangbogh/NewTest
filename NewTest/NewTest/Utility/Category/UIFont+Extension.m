//
//  UIFont+Extension.m
//  ToolsApp
//
//  Created by 王旭 on 16/3/31.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import "UIFont+Extension.h"

@implementation UIFont (Extension)
+ (UIFont *)kdxTextCellTitleFont {
    return [UIFont systemFontOfSize:kdxFontSizeTextCellTitle];
} //333333     32px

+ (UIFont *)kdxTextCellSubTitleFont {
    return [UIFont systemFontOfSize:kdxFontSizeTextCellSubTitle];

} //7c7c7c     28px

+ (UIFont *)kdxTextCellShortMessageFont {
    return [UIFont systemFontOfSize:kdxFontSizeTextCellShortMessage];

} //999999     24px

+ (UIFont *)kdxTextCellTimeFont {
    return [UIFont systemFontOfSize:kdxFontSizeTextCellTime];

} //aaaaaa     24px

+ (UIFont *)kdxTextCellMessageFont {
    return [UIFont systemFontOfSize:kdxFontSizeTextCellMessage];

} //666666     24px


//cell主标题字体大小
+ (UIFont *)kdxCellTitleFont {
    return [UIFont systemFontOfSize:16];
}
//cell子标题字体大小
+ (UIFont *)kdxCellSubTitleFont {
    return [UIFont systemFontOfSize:14];
}

//标题:32px
+ (UIFont *)kdxTitleForChineseFont {
    return [UIFont systemFontOfSize:16];
}


//标题:30px 英文和数字
+ (UIFont *)kdxTitleForEnglishOrNumberFont {
    return [UIFont systemFontOfSize:15];
}


//标题：28px 例如：清空列表 ，下层标题、菜单
+ (UIFont *)kdxSubTitleFont {
    return [UIFont systemFontOfSize:14];
};


//文字内容:26px
+ (UIFont *)kdxTextFont {
    return [UIFont systemFontOfSize:13];
}


//小标题：返回字体大小：24px
+ (UIFont *)kdxLittleTitleFont {
    return [UIFont systemFontOfSize:12];
}


//弹窗标题：28px；
+ (UIFont *)kdxPopTitleFont {
    return [UIFont systemFontOfSize:14];
}

//弹窗内容：26px
+ (UIFont *)kdxPopTextFont {
    return [UIFont systemFontOfSize:13];
}

+ (UIFont *)kdxListTitleFont {
    return [UIFont systemFontOfSize:13];
}//列表文字大小26px

+ (UIFont *)kdxButtonFont {
    return [UIFont systemFontOfSize:13];
}




+ (UIFont *)kingTextFont10 {
    return [UIFont systemFontOfSize:10];
}
+ (UIFont *)kingTextFont11 {
    return [UIFont systemFontOfSize:11];
}
+ (UIFont *)kingTextFont12 {
    return [UIFont systemFontOfSize:12];
}
+ (UIFont *)kingTextFont13 {
    return [UIFont systemFontOfSize:13];
}
+ (UIFont *)kingTextFont14 {
    return [UIFont systemFontOfSize:14];
}
+ (UIFont *)kingTextFont15 {
    return [UIFont systemFontOfSize:15];
}
+ (UIFont *)kingTextFont16 {
    return [UIFont systemFontOfSize:16];
}
+ (UIFont *)kingTextFont17 {
    return [UIFont systemFontOfSize:17];
}
+ (UIFont *)kingTextFont18 {
    return [UIFont systemFontOfSize:18];
}
+ (UIFont *)kingTextFont20 {
    return [UIFont systemFontOfSize:20];
}
+ (UIFont *)kingTextFont26 {
    return [UIFont systemFontOfSize:26];
}
@end
