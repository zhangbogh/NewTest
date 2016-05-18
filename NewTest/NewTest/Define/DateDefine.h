//
//  DateDefine.h
//  ToolsApp
//
//  Created by 李静波 on 15/12/1.
//  Copyright © 2015年 李静波. All rights reserved.
//

#ifndef DateDefine_h
#define DateDefine_h


#define identityId0                         16//补货员
#define identityId1                         2//合伙人
#define identityId2                         1050//维修工程师
#define kCurrentIdentityId                   @"kCurrentIdentityId"
#define CurrentIdentityId                   [[NSUserDefaults standardUserDefaults] integerForKey:kCurrentIdentityId]
#define isIdentityId0                       [[NSUserDefaults standardUserDefaults] integerForKey:kCurrentIdentityId] == identityId0
#define isIdentityId1                       [[NSUserDefaults standardUserDefaults] integerForKey:kCurrentIdentityId] == identityId1
#define isIdentityId2                       [[NSUserDefaults standardUserDefaults] integerForKey:kCurrentIdentityId] == identityId2

#define kIdentityIds                         @"kIdentityIds"
#define CurrentIdentityIds                  [[NSUserDefaults standardUserDefaults] arrayForKey:kIdentityIds];


#define kCurrentUserId                       @"kCurrentUserId"
#define CurrentUserId                       [[NSUserDefaults standardUserDefaults] integerForKey:kCurrentUserId]





#define Login_IsAllowAutoLogin  @"isAllowAutoLogin"

#define DateFormatter_year      @"yyyy"
#define DateFormatter_mounth    @"yyyy-MM"
#define DateFormatter_day       @"yyyy-MM-dd"
#define DateFormatter_min       @"yyyy-MM-dd HH:mm"
#define DateFormatter_second    @"yyyy-MM-dd HH:mm:ss"

#define DateFormatter_hour      @"HH:mm:ss"

#endif /* DateDefine_h */
