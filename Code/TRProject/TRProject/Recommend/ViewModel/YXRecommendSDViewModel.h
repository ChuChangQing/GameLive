//
//  YXRecommendSDViewModel.h
//  TRProject
//
//  Created by chuchangqing on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"

@interface YXRecommendSDViewModel : TRBaseViewModel
/** <#属性描述#> */
@property (nonatomic,readonly) NSInteger page;
/** <#属性描述#> */
@property (nonatomic) NSString *slug;
/** <#属性描述#> */
@property (nonatomic, readonly) NSInteger rowNumber;
/** <#属性描述#> */
@property (nonatomic) NSMutableArray<RecommendSDDataModel *> *dataList;
- (RecommendSDDataModel *)modelForRow:(NSInteger)row;
- (NSURL *)iconViewForRow:(NSInteger)row;
- (NSURL *)litViewForRow:(NSInteger)row;
- (NSString *)nickForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)onlineForRow:(NSInteger)row;
- (NSString *)uidForRow:(NSInteger)row;
- (instancetype)initWithSlug:(NSString *)slug;

@end
