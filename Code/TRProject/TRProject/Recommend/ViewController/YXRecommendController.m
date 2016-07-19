//
//  YXRecommendController.m
//  TRProject
//
//  Created by chuchangqing on 16/6/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXRecommendController.h"
#import "YXRecommendCell.h"
#import "YXRecommendViewModel.h"
#import "YXSecondRecommendController.h"

@interface YXRecommendController ()<UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UICollectionView *cView;

/** <#属性描述#> */
@property (nonatomic) YXRecommendViewModel *recommendVM;
/** <#属性描述#> */

@end

@implementation YXRecommendController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.recommendVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
        if (error) {
            DDLogError(@"error %@", error);
        }else{
            [self.cView reloadData];
        }
    }];
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
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"%ld", self.recommendVM.rowNumber);
    return self.recommendVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    YXRecommendCell *cell = [self.cView dequeueReusableCellWithReuseIdentifier:kRecommendCell forIndexPath:indexPath];
    cell.titleLb.text = [self.recommendVM titleForRow:row];
    [cell.iconView sd_setImageWithURL:[self.recommendVM iconViewForRow:row] placeholderImage:nil];
    cell.width = (kScreenW - 40) / 3;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    YXSecondRecommendController *sdVC = [[YXSecondRecommendController alloc] initWithCollectionViewLayout:[UICollectionViewFlowLayout new]];
    sdVC.slug = [self.recommendVM slugForRow:indexPath.row];
    [self.navigationController pushViewController:sdVC animated:YES];
}

- (YXRecommendViewModel *)recommendVM {
	if(_recommendVM == nil) {
		_recommendVM = [YXRecommendViewModel new];
	}
	return _recommendVM;
}


@end
