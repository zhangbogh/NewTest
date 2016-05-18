
/**
 *  页面、手机设备相关宏定义
 */

#ifndef ViewDefine_h
#define ViewDefine_h

#define DeviceSystemVersion [[[UIDevice currentDevice] systemVersion] doubleValue]
#define KIOS7 (DeviceSystemVersion >= 7.0)
#define KIOS9 (DeviceSystemVersion >= 9.0)

#define Screen_Bounds           [[UIScreen mainScreen] bounds]
#define Screen_Size             Screen_Bounds.size
#define Screen_Width            Screen_Size.width
#define Screen_Height           Screen_Size.height
#define Screen_scale            [UIScreen mainScreen].scale

#define Screen_subTableHeight   (Screen_Height - 64)

#define SubTableViewFrame       CGRectMake(0,0,Screen_Width,Screen_subTableHeight)

#define Screen_Center           [[UIScreen mainScreen] center]

#define isBigScreen             [UIScreen mainScreen].bounds.size.height > 700
#define isSize4_0               [UIScreen mainScreen].bounds.size.width < 350
#define isSize5_5               [UIScreen mainScreen].bounds.size.width > 400

#define lazySize(minValue)      (int)(isSize5_5 ? (1.3 * minValue) :(isSize4_0 ? minValue : (1.2 * minValue)))



#define kdxMarginListLine           5
#define kdxMarginListLineTop        5
#define kdxMarginListLineLeft       5
#define kdxMarginListLineRight      -5
#define kdxMarginListLineBottom     -5


#define kdxMarginListFontLeft       15
#define kdxMarginListFontRight      -15

#define kdxMarginButtonBottom       -8
#define kdxMarginButtonBetween      1
#define kdxMarginButtonLeft         8
#define kdxMarginButtonRight        -8
#define kdxHeightButton             (isBigScreen ? 50 : 38)


#define kdxHeightCellNomal          44
#define kdxHeightLoginCell          (isBigScreen ? 50 : 44)
#define kdxHeightFooterView         10
#define kdxHeightCellBig            lazySize(78) //自己暂时定的



#define kdxTableViewFrame       CGRectInset(SubTableViewFrame, kdxMarginListLineLeft, kdxMarginListLineLeft)




#endif /* ViewDefine_h */
