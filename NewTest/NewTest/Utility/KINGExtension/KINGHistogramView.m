//
//  KINGHistogramView.m
//  ToolsApp
//
//  Created by 王旭 on 16/4/12.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import "KINGHistogramView.h"
#define KINGHistogramViewID @"KINGHistogramViewID"
#define KINGHistogramViewCellWidth           Screen_Width*0.85/63
@interface KINGHistogramView ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic ,weak)UILabel *titleLabel;
@property (nonatomic ,weak)UILabel *maxValueLabel;
@property (nonatomic ,weak)UIView *lineh;
@property (nonatomic ,weak)UIView *linev;
@property (nonatomic ,weak)UICollectionView *collectionView;
@property (nonatomic ,assign) NSInteger maxValue;
@property (nonatomic ,assign) NSInteger minValue;
@end




@implementation KINGHistogramView



- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.showColor = [UIColor kdxLightBlueColor];
    }
    return self;
}
- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

-(void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    NSInteger tempMaxValue = [dataArray.firstObject intValue];
    NSInteger tempMinValue = [dataArray.firstObject intValue];
    //循环给定的数据数组
    for (id value in dataArray) {
        int count = [value intValue];
        //得到最大数 和最小数
        if (count > tempMaxValue) {
            tempMaxValue = count;
        }
        if (count < tempMinValue) {
            tempMinValue = count;
        }

    }
    _maxValue = tempMaxValue;
    _minValue = tempMinValue;
    self.maxValueLabel.text = [NSString stringWithFormat:@"%tu",_maxValue];
    self.maxValueLabel.font = [UIFont systemFontOfSize:12];
    self.maxValueLabel.textColor = [UIColor kdxLightBlueColor];
    [self.collectionView reloadData];
}

-(void)setShowColor:(UIColor *)showColor {
    _showColor = showColor;
    self.lineh.backgroundColor = showColor;
    self.linev.backgroundColor = showColor;

}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self setupUI];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(KINGHistogramViewCellWidth, self.collectionView.height);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KINGHistogramViewID forIndexPath:indexPath];
//    CGFloat baseScale = 0.0;
//    if (self.minValue<self.maxValue*0.2) {
//        baseScale = 0.0;
//    }
//    CGFloat heightScale = ((1.00-baseScale) * ([self.dataArray[indexPath.row] intValue]-self.minValue))/(self.maxValue-self.minValue) + baseScale;
    CGFloat heightScale = 1.0*[self.dataArray[indexPath.row] intValue]/self.maxValue;

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, cell.contentView.height*(1-heightScale), cell.contentView.width, cell.contentView.height*heightScale)];
    view.backgroundColor = self.showColor;
    [cell.contentView addSubview:view];
    cell.contentView.backgroundColor = [UIColor clearColor];
    return cell;
}




- (void)setupUI {
    
    [self.maxValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.linev.mas_top);
        make.right.equalTo(self.linev.mas_left);
        make.height.equalTo(@20);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lineh);
        make.top.equalTo(self.mas_bottom).multipliedBy(0.15);
        make.height.equalTo(@20);
    }];
    
    [self.lineh mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.width.equalTo(self).multipliedBy(0.9);
        make.height.equalTo(@1);
        make.bottom.equalTo(self.mas_bottom).offset(-self.width*0.05);
    }];
    
    [self.linev mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.mas_height);
        make.bottom.equalTo(self);
        make.width.equalTo(@1);
        make.left.equalTo(self.lineh.mas_left).offset(self.width*0.05);
    }];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.lineh).offset(-3);
        make.height.equalTo(self.linev).multipliedBy(0.9);
        make.left.equalTo(self.linev).offset(1);
        make.right.equalTo(self.lineh);
    }];
    
}
- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(KINGHistogramViewCellWidth, self.height*0.5);
        layout.minimumInteritemSpacing = KINGHistogramViewCellWidth;
        layout.minimumLineSpacing = KINGHistogramViewCellWidth;
//        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;

        layout.collectionView.bounces = false;
        layout.collectionView.showsHorizontalScrollIndicator = false;
        
        
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor clearColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [self addSubview:collectionView];
        collectionView.showsHorizontalScrollIndicator = false;
        collectionView.bounces = false;
//        collectionView.contentOffset = CGPointMake(KINGHistogramViewCellWidth, 0);
        collectionView.contentInset = UIEdgeInsetsMake(0, 4, 0, 0);
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:KINGHistogramViewID];
        _collectionView = collectionView;
    }
    return _collectionView;
}

KINGLazyLabel(self, titleLabel)
KINGLazyLabel(self, maxValueLabel)
KINGLazyView(self, lineh)
KINGLazyView(self, linev)

@end
