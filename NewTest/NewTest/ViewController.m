//
//  ViewController.m
//  NewTest
//
//  Created by 王旭 on 16/5/16.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import "ViewController.h"
#import <XXLazyKitHeader.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,weak) UITableView *tableView;

@property (nonatomic ,strong) NSArray *demoNameArray;
@property (nonatomic ,strong) NSArray *viewControllerArray;
@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"新功能尝试专区";
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.bounces = NO;
    tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tableView];
    self.tableView = tableView;

    _demoNameArray = @[@"0.collectionViewCell中嵌套tableView",
                       @"1.textField和textView",//textField可以用addtargat添加监控事件    textView需要用代理回调监控事件   键盘研究了下
                       @"2.检验自己的框架",
                       @"3.hud+网络连接检查",
                       @"4.上下拉刷新",
                       @"5.折线统计图",
                       @"6.汉字转拼音",
                       @"7.fmdb",
                       @"8.pop",
                       @"9.预留",
                       @"10.预留"];
    
    _viewControllerArray = @[@"KINGTest0ViewController",
                             @"KINGTest1ViewController",
                             @"KINGTest2ViewController",
                             @"KINGTest3ViewController",//hud+网络连接检查
                             @"KINGTest4ViewController",//上下拉刷新
                             @"KINGTest5ViewController",//折线统计图
                             @"KINGTest6ViewController",//汉字转拼音
                             @"KINGTest7ViewController",//fmdb
                             @"KINGTest8ViewController",//pop
                             @"KINGTest9ViewController",
                             @"KINGTest10ViewController"];

}

#pragma mark -
#pragma mark Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _viewControllerArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [_demoNameArray objectAtIndex:indexPath.row];
    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController* vc = nil;
    if (indexPath.row != 12) {
        vc = [[NSClassFromString([_viewControllerArray objectAtIndex:indexPath.row]) alloc] init];
    } else {
//        viewController = [[UIStoryboard storyboardWithName:@"Storyboard" bundle:nil] instantiateViewControllerWithIdentifier:[_viewControllerArray objectAtIndex:indexPath.row]];
    }
    vc.title = [_demoNameArray objectAtIndex:indexPath.row];
    vc.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *customLeftBarButtonItem = [[UIBarButtonItem alloc] init];
    customLeftBarButtonItem.title = @"返回";
    customLeftBarButtonItem.tintColor = [UIColor redColor];
    self.navigationItem.backBarButtonItem = customLeftBarButtonItem;
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

@end
