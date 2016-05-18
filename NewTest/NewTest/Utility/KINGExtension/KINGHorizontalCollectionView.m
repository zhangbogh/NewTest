//
//  KINGHorizontalCollectionView.m
//  ToolsApp
//
//  Created by 王旭 on 16/5/10.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import "KINGHorizontalCollectionView.h"
#define KINGHorizontalCollectionViewID                      @"KINGHorizontalCollectionViewID"
@interface KINGHorizontalCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic ,strong) UICollectionView *collectionView;

@property (nonatomic ,assign) NSInteger showCount;
@property (nonatomic ,assign) BOOL needLine;
@property (nonatomic ,strong) NSArray *views;

@end

@implementation KINGHorizontalCollectionView

- (instancetype)initWithViews:(NSArray *)views ShowCount:(NSInteger)showCount NeedLine:(BOOL)needLine {
    if (self = [self init]) {
        self.views = views;
        self.showCount = showCount;
        self.needLine = needLine;
        self.collectionView.dataSource = self;
        self.collectionView.backgroundColor = [UIColor whiteColor];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    }
    
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    [self setupUI];
}

- (void)setupUI {
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
    }];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.needLine && indexPath.row % 2 == 1) {
        return CGSizeMake(1, self.height/2);
    }
    if (self.needLine) {
        return CGSizeMake((self.width-self.showCount+1)/self.showCount, self.height);
    }
    return CGSizeMake(self.width/self.showCount, self.height);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (self.needLine) {
        return self.views.count * 2 - 1;
    }
    return self.views.count;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KINGHorizontalCollectionViewID forIndexPath:indexPath];
    [cell.contentView removeAllSubviews];
    if (self.needLine && indexPath.row % 2 == 1) {
        cell.backgroundColor = [UIColor kdxLineColor];
        return cell;
    }
    if (self.needLine) {
        cell.backgroundColor = [UIColor whiteColor];
        UIView *view = self.views[(indexPath.row +1 )/2];
        view.frame = cell.bounds;
        [cell.contentView addSubview:view];
    }else {
        cell.backgroundColor = [UIColor whiteColor];
        UIView *view = self.views[indexPath.row];
        view.frame = cell.bounds;
        [cell.contentView addSubview:view];
    }

    return cell;
}


- (UICollectionView *)collectionView {
    if (_collectionView == nil) {

        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake(10, 10);
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//        flowLayout.sectionInset = UIEdgeInsetsMake(15, 0, 0, 0);
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) collectionViewLayout:flowLayout];
        
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:KINGHorizontalCollectionViewID];  // 去掉弹簧效果
        collectionView.bounces = NO;                            // 去掉滚动条
        collectionView.showsHorizontalScrollIndicator = NO;     // 启用分页效果
        collectionView.pagingEnabled = YES;
        collectionView.delegate = self;
        collectionView.dataSource = self;

        [self addSubview:collectionView];
        _collectionView = collectionView;
    }
    return _collectionView;
}

@end
