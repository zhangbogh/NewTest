//
//  UIImageView+Extension.m
//  ToolsApp
//
//  Created by 王旭 on 16/4/1.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import "UIImageView+Extension.h"
#import <UIImageView+WebCache.h>


@implementation UIImageView (Extension)

- (void)setWebImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder {
    [self sd_setImageWithURL:url placeholderImage:placeholder];
}

@end
