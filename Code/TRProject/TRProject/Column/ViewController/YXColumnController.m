//
//  YXColumnController.m
//  TRProject
//
//  Created by chuchangqing on 16/6/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXColumnController.h"
#import "YXColumnViewModel.h"
#import "YXColumnHeader.h"
#import "YXColumnHeader1.h"
#import "YXColumnCell.h"



@interface YXColumnController ()<UICollectionViewDelegateFlowLayout,iCarouselDelegate, iCarouselDataSource>

/** <#属性描述#> */
@property (nonatomic) YXColumnViewModel *columeVM;
/** <#属性描述#> */
@property (nonatomic) NSString *slug;
/** <#属性描述#> */
@property (nonatomic) UIPageControl *pc;

@end

@implementation YXColumnController
#pragma mark -  IC  Delegate
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    self.pc.currentPage = carousel.currentItemIndex;
}
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    if (carousel.tag == 1000) {
        return self.columeVM.MobileIndexModellist.count;
    }else{
        return self.columeVM.MobileStarModellist.count;
    }
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (carousel.tag == 1000) {
        if (!view) {
            view = [[UIView alloc] initWithFrame:carousel.bounds];
            UIImageView *iv = [UIImageView new];
            [view addSubview:iv];
            [iv mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(0);
            }];
            iv.contentMode = UIViewContentModeScaleAspectFill;
            iv.tag = 100;
        }
        UIImageView *iv = (UIImageView *)[view viewWithTag:100];
        [iv sd_setImageWithURL:self.columeVM.MobileIndexModellist[index].link_object.thumb.yx_URL placeholderImage:nil];
        UIView *blackView = [UIView new];
        blackView.backgroundColor = kRGBColor(0, 0, 0, 0.5);
        [carousel addSubview:blackView];
        UILabel *lb = [UILabel new];
        [blackView addSubview:lb];
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(5);
        }];
        lb.text = self.columeVM.MobileIndexModellist[index].link_object.title;
        [blackView addSubview:self.pc];
        [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(-5);
        }];
    }else{
        if (!view) {
            view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 120)];
            UIImageView *iv = [UIImageView new];
            [view addSubview:iv];
            [iv mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.equalTo(15);
                make.width.height.equalTo(50);
            }];
            iv.layer.cornerRadius = 25;
            iv.layer.masksToBounds = YES;
            iv.contentMode = UIViewContentModeScaleAspectFill;
            iv.tag = 100;
            UILabel *lb = [UILabel new];
            [carousel addSubview:lb];
            [lb mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(70);
                make.left.equalTo(15);
            }];
            lb.tag = 200;
        }
        UIImageView *iv = (UIImageView *)[view viewWithTag:100];
        [iv sd_setImageWithURL:self.columeVM.MobileStarModellist[index].link_object.avatar.yx_URL placeholderImage:nil];
        UILabel *lb = (UILabel *)[view viewWithTag:200];
        lb.text = self.columeVM.MobileStarModellist[index].link_object.nick;
    }
    return view;
}
#pragma mark -  LifeCycle 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[YXColumnHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kColumnHeaderCell];
    [self.collectionView registerClass:[YXColumnHeader1 class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kColumnHeaderCell1];
    [self.collectionView registerClass:[YXColumnCell class] forCellWithReuseIdentifier:kColumnCell];
//    [self.collectionView registerClass:[YXColumnHeader class] forCellWithReuseIdentifier:kColumnHeaderCell];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CellZero"];
    [self columeVM];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.columeVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            [self.collectionView.mj_header endRefreshing];
            if (error) {
                DDLogError(@"error %@", error);
            }else{
                [self.collectionView reloadData];
            }
        }];
    }];
    [self.collectionView.mj_header beginRefreshing];
    
//    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        [self.columeVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
//            [self.collectionView.mj_footer endRefreshing];
//            if (error) {
//                DDLogError(@"error %@", error);
//            }else{
//                [self.collectionView reloadData];
//            }
//        }];
//    }];
//    [self.collectionView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.columeVM.dataList.count + 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath.section) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellZero" forIndexPath:indexPath];
        return cell;
    }
//    YXColumnCell *cell = [[YXColumnCell alloc] initWithModel:[self.columeVM modelForSction:indexPath.section Row:indexPath.row]];
    YXColumnCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kColumnCell forIndexPath:indexPath];
    NSArray< YXColumnModel *> *modelArray = self.columeVM.dataList[indexPath.section - 1];
    MobileModel *mobilModel = (MobileModel *)modelArray[indexPath.row];
    YXColumnLinkModel *model = mobilModel.link_object;
    cell.nickLb.text = model.nick;
    cell.titleLb.text = model.title;
    cell.onlineLb.text = @(model.view.integerValue).yx_changeWan;
    [cell.iconView sd_setImageWithURL:model.thumb.yx_URL placeholderImage:nil];
    [cell.litView sd_setImageWithURL:model.avatar.yx_URL placeholderImage:nil];
    
    return cell;
}
#pragma mark <UICollectionViewDelegate>
-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if(!section){
        CGSize size = CGSizeMake(kScreenW, 300);
        return size;
    }else {
        CGSize size = CGSizeMake(kScreenW, 50);
        return size;
    }
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    
    if (kind == UICollectionElementKindSectionHeader) {
        if (!indexPath.section) {
            YXColumnHeader *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kColumnHeaderCell forIndexPath:indexPath];
            headerView.icDelegate = self;
            [headerView.ic reloadData];
            [headerView.downIC reloadData];
            return headerView;
        }else{
            YXColumnHeader1 *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kColumnHeaderCell1 forIndexPath:indexPath];
            headerView.titleLb.text = self.columeVM.ListModellist[indexPath.section + 1].name;
            if (indexPath.section == 1) {
                [headerView.btu setTitle:@"换一换" forState:UIControlStateNormal];
            }else{
                [headerView.btu setTitle:@"更多" forState:UIControlStateNormal];
            }
            return headerView;
        }
    }
    return [YXColumnHeader new];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(!indexPath.section){
        return CGSizeMake(0, 0);
    }
    CGFloat wid = (kScreenW - 30) / 2;
    CGFloat hei = wid * 210 / 250;
    return CGSizeMake(wid, hei);
}
#pragma mark -  FlowLayout  Delegate
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
#pragma mark - Lazyload 懒加载
- (YXColumnViewModel *)columeVM {
	if(_columeVM == nil) {
		_columeVM = [[YXColumnViewModel alloc] init];
	}
	return _columeVM;
}
- (UIPageControl *)pc {
    if(_pc == nil) {
        _pc = [[UIPageControl alloc] init];
        _pc.numberOfPages = self.columeVM.MobileIndexModellist.count;
    }
    return _pc;
}


@end
