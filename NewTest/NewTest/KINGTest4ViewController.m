//
//  KINGTest4ViewController.m
//  NewTest
//
//  Created by 王旭 on 16/5/16.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import "KINGTest4ViewController.h"
#define MJRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

@interface KINGTest4ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,weak) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *data;


@end

@implementation KINGTest4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self example11];
    XXLazySetTableView([UITableViewCell class], @"cell", [UIColor redColor])
    self.tableView.bounces = YES;
    self.tableView.backgroundColor = [UIColor redColor];

}
- (void)example01
{
    __unsafe_unretained __typeof(self) weakSelf = self;
    
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadNewData];
    }];
    
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
}

- (void)example11
{
    [self example01];
    __weak __typeof(self) weakSelf = self;
//    __unsafe_unretained __typeof(self) weakSelf = self;
    
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreData];
    }];
}

#pragma mark 下拉刷新数据
- (void)loadNewData
{
    // 1.添加假数据
    for (int i = 0; i<5; i++) {
        [self.data insertObject:MJRandomData atIndex:0];
    }
    
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableView reloadData];
        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.mj_header endRefreshing];
    });
}

#pragma mark 上拉加载更多数据
- (void)loadMoreData
{
    // 1.添加假数据
    for (int i = 0; i<5; i++) {
        [self.data addObject:MJRandomData];
    }
    
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableView reloadData];
        
        // 拿到当前的上拉刷新控件，结束刷新状态
        [self.tableView.mj_footer endRefreshing];
    });
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor randomColor];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", indexPath.row % 2?@"push":@"modal", self.data[indexPath.row]];
    return cell;
}

- (void)setupUI {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}
XXLazyTableView(self.view, tableView)
- (NSMutableArray *)data
{
    if (!_data) {
        self.data = [NSMutableArray array];
        for (int i = 0; i<5; i++) {
            [self.data addObject:MJRandomData];
        }
    }
    return _data;
}

@end
