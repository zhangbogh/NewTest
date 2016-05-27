//
//  KINGTest0ViewController.m
//  NewTest
//
//  Created by 王旭 on 16/5/16.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import "KINGTest0ViewController.h"
#import "KINGTestTableViewController.h"
#import <Masonry.h>
#import <YYKit.h>

@interface KINGTest0ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic ,weak) UICollectionView *collectionView;
@end

@implementation KINGTest0ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.automaticallyAdjustsScrollViewInsets = NO;
    //test;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(200, 200);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
 
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(50, 100, 200, 400) collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.bounces = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.pagingEnabled = YES;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.collectionView = collectionView;
    [self.view addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(self.view).offset(10);
        make.bottom.equalTo(self.view).offset(-20);
    }];
    
 
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.collectionView.width, self.collectionView.height-64);
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor randomColor];
    KINGTestTableViewController *tableVC = [[KINGTestTableViewController alloc]init];
    tableVC.tableView.frame = cell.bounds;
    [cell.contentView addSubview:tableVC.tableView];
    [self addChildViewController:tableVC];
    
    
    
    
    return cell;
}


@end
