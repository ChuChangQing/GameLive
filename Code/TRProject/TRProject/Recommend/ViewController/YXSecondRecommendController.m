//
//  YXSecondRecommendController.m
//  TRProject
//
//  Created by chuchangqing on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXSecondRecommendController.h"
#import "YXSecondRecommendCell.h"
#import "YXRecommendSDViewModel.h"

@interface YXSecondRecommendController ()<UICollectionViewDelegateFlowLayout>
/** <#属性描述#> */
@property (nonatomic) YXRecommendSDViewModel *SDVM;

@end

@implementation YXSecondRecommendController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[YXSecondRecommendCell class] forCellWithReuseIdentifier:@"Cell1"];
    [self SDVM];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.SDVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            [self.collectionView.mj_header endRefreshing];
            if (error) {
                DDLogError(@"error %@", error);
            }else{
                [self.collectionView reloadData];
            }
        }];
    }];
    [self.collectionView.mj_header beginRefreshing];
    
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.SDVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            [self.collectionView.mj_footer endRefreshing];
            if (error) {
                DDLogError(@"error %@", error);
            }else{
                [self.collectionView reloadData];
            }
        }];
    }];
    [self.collectionView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.SDVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    YXSecondRecommendCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell1" forIndexPath:indexPath];
    cell.titleLb.text = [self.SDVM titleForRow:row];
    cell.nickLb.text = self.SDVM.dataList[row].nack;
    cell.onlineLb.text = [self.SDVM onlineForRow:row];
    [cell.iconView sd_setImageWithURL:[self.SDVM iconViewForRow:row] placeholderImage:nil];
    [cell.litView sd_setImageWithURL:[self.SDVM litViewForRow:row] placeholderImage:nil];
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat wid = (kScreenW - 30) / 2;
    CGFloat hei = wid * 210 / 250;
    return CGSizeMake(wid, hei);
}

- (YXRecommendSDViewModel *)SDVM {
	if(_SDVM == nil) {
		_SDVM = [[YXRecommendSDViewModel alloc] initWithSlug:_slug];
	}
	return _SDVM;
}

@end
