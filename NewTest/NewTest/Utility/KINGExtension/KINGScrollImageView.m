//
//  KINGScrollImageView.m
//  ToolsApp
//
//  Created by 王旭 on 16/5/15.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import "KINGScrollImageView.h"

@interface KINGScrollImageView ()<UIScrollViewDelegate>

@property (nonatomic ,weak) UIButton *baseButton;
@property (nonatomic ,weak) UIScrollView *scrollView;
@property (nonatomic ,weak) UIImageView *imageView;
@property (nonatomic ,assign) CGSize imageSize;

@end

@implementation KINGScrollImageView

+ (void)showScrollImageViewWithImage:(UIImage *)image imageSize:(CGSize)imageSize {
    KINGScrollImageView *view = [[KINGScrollImageView alloc]init];
    view.frame = Screen_Bounds;
    view.backgroundColor = [UIColor kdxBlackBackgroundColor];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:view];
    CGFloat height = imageSize.height/imageSize.width * view.width;
    if (height < Screen_Height) {
        view.imageSize = CGSizeMake(view.width, height);
    }else {
        view.imageSize = CGSizeMake(imageSize.width/imageSize.height *view.height, view.height);
    }
    [view setupUI];
    [view setupProperty];
    view.imageView.image = image;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void)setupProperty {
    self.scrollView.contentSize = self.imageSize;
    self.scrollView.delegate = self;
    self.scrollView.maximumZoomScale = 3.0;
    self.scrollView.minimumZoomScale = 1.0;
    
    [self.baseButton addTarget:self action:@selector(removeFromSuperview) forControlEvents:UIControlEventTouchUpInside];
}


- (void)setupUI {
    self.baseButton.frame = self.bounds;
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(@(self.imageSize.width));
        make.height.equalTo(@(self.imageSize.height));
    }];
    self.imageView.frame = CGRectMake(0, 0, self.imageSize.width, self.imageSize.height);
}

KINGLazyButton(self, baseButton)
KINGLazyAnyView(self, scrollView, UIScrollView)
KINGLazyImageView(self.scrollView, imageView)
@end
