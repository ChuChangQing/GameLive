//
//  YXColumnViewModel.h
//  TRProject
//
//  Created by chuchangqing on 16/6/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"

@interface YXColumnViewModel : TRBaseViewModel
/** <#属性描述#> */
@property (nonatomic) NSInteger sectionNumber;

///** <#属性描述#> */
//@property (nonatomic) NSMutableArray<MobileModel *> *MobileWebgameModellist;
//@property (nonatomic) NSMutableArray<MobileModel *> *MobileMinecraftModellist;
//@property (nonatomic) NSMutableArray<MobileModel *> *MobileTvgameModellist;
//@property (nonatomic) NSMutableArray<MobileModel *> *MobileSportModellist;
@property (nonatomic) NSMutableArray<MobileModel *> *MobileStarModellist;
//@property (nonatomic) NSMutableArray<MobileModel *> *MobileRecommendationModellist;
@property (nonatomic) NSMutableArray<MobileModel *> *MobileIndexModellist;
//@property (nonatomic) NSMutableArray<MobileModel *> *MobileLolModellist;
//@property (nonatomic) NSMutableArray<MobileModel *> *MobileBeautyModellist;
//@property (nonatomic) NSMutableArray<MobileModel *> *MobileHeartstoneModellist;
//@property (nonatomic) NSMutableArray<MobileModel *> *MobileBlizzardModellist;
@property (nonatomic) NSMutableArray<ListModel *> *ListModellist;
//@property (nonatomic) NSMutableArray<MobileModel *> *MobileDota2Modellist;
//@property (nonatomic) NSMutableArray<MobileModel *> *MobileDnfModellist;

/** <#属性描述#> */
@property (nonatomic) NSMutableArray *dataList;

- (YXColumnLinkModel *)modelForSction:(NSInteger)sction Row:(NSInteger)row;

//mobile-beauty
//- (MobileBeautyModel *)MobileBeautymodelForRow:(NSInteger)row;
//- (NSString *)MobileBeautyonlineForRow:(NSInteger)row;
//- (NSString *)MobileBeautytitleLbForRow:(NSInteger)row;
//- (NSString *)MobileBeautynickForRow:(NSInteger)row;
//- (NSURL *)MobileBeautylitViewForRow:(NSInteger)row;
//- (NSURL *)MobileBeautyiconViewForRow:(NSInteger)row;
//- (NSString *)MobileBeautyuidForRow:(NSInteger)row;
//- (NSString *)MobileBeautyslugForRow:(NSInteger)row;






@end
