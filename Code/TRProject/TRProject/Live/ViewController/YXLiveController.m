//
//  YXLiveController.m
//  TRProject
//
//  Created by chuchangqing on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXLiveController.h"
#import "YXLiveCell.h"
#import "YXLiveViewModel.h"

@interface YXLiveController ()<UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UICollectionView *cView;
/** <#属性描述#> */
@property (nonatomic) YXLiveViewModel *liveVM;
/** <#属性描述#> */
@property (nonatomic) NSString *tmpUid;
@end

@implementation YXLiveController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self liveVM];
    
    self.cView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.liveVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            [self.cView.mj_header endRefreshing];
            if (error) {
                DDLogError(@"error %@",error);
            }else{
                [self.cView reloadData];
            }
        }];
    }];
    [self.cView.mj_header beginRefreshing];
    
    self.cView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.liveVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            [self.cView.mj_footer endRefreshing];
            if (error) {
                DDLogError(@"error %@",error);
            }else{
                [self.cView reloadData];
            }
        }];
    }];
    [self.cView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.liveVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    YXLiveCell *cell = [self.cView dequeueReusableCellWithReuseIdentifier:kLiveCell forIndexPath:indexPath];
    cell.titleLb.text = [self.liveVM titleForRow:row];
    cell.onlineLb.text = [self.liveVM onlineForRow:row];
    cell.nickLb.text = [self.liveVM nickForRow:row];
    [cell.iconView sd_setImageWithURL:[self.liveVM iconViewForRow:row] placeholderImage:nil];
    
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
    CGFloat hei = wid * 260 / 350;
    return CGSizeMake(wid, hei);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    _tmpUid = [self.liveVM uidForRow:indexPath.row];
}
- (YXLiveViewModel *)liveVM {
	if(_liveVM == nil) {
		_liveVM = [YXLiveViewModel new];
	}
	return _liveVM;
}

@end
