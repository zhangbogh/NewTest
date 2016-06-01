//
//  KINGTest3ViewController.m
//  NewTest
//
//  Created by 王旭 on 16/5/16.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import "KINGTest3ViewController.h"
#import <MBProgressHUD.h>
#import "Reachability.h"

#define MBMainThreadAssert() NSAssert([NSThread isMainThread], @"MBProgressHUD needs to be accessed on the main thread.");


@interface KINGTest3ViewController ()

@end

@implementation KINGTest3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NSString *str = reach.currentReachabilityFlags;
    NSString *str1 = reach.currentReachabilityString;
    NetworkStatus status = reach.currentReachabilityStatus;
    
    // Do any additional setup after loading the view.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.labelText = @"温馨提示";
    hud.labelColor = [UIColor redColor];
    hud.color = [UIColor lightGrayColor];
    hud.activityIndicatorColor = [UIColor yellowColor];
    hud.tintColor = [UIColor purpleColor];
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        
        // Do something useful in the background
        [self doSomeWork];
        
        // IMPORTANT - Dispatch back to the main thread. Always access UI
        // classes (including MBProgressHUD) on the main thread.
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hide:YES];
        });
    });
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)doSomeWork {
    // Simulate by just waiting.
    sleep(3.);
}
//- (void)hideAnimated:(BOOL)animated {
//    MBMainThreadAssert();
//    [self.graceTimer invalidate];
//    self.useAnimation = animated;
//    self.finished = YES;
//    // If the minShow time is set, calculate how long the HUD was shown,
//    // and postpone the hiding operation if necessary
//    if (self.minShowTime > 0.0 && self.showStarted) {
//        NSTimeInterval interv = [[NSDate date] timeIntervalSinceDate:self.showStarted];
//        if (interv < self.minShowTime) {
//            NSTimer *timer = [NSTimer timerWithTimeInterval:(self.minShowTime - interv) target:self selector:@selector(handleMinShowTimer:) userInfo:nil repeats:NO];
//            [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
//            self.minShowTimer = timer;
//            return;
//        }
//    }
//    // ... otherwise hide the HUD immediately
//    [self hideUsingAnimation:self.useAnimation];
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
