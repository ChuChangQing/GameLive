//
//  YXRecommendViewModel.h
//  TRProject
//
//  Created by chuchangqing on 16/6/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "YXNetManager.h"

@interface YXRecommendViewModel : TRBaseViewModel
/**  */
@property (nonatomic,readonly) NSInteger rowNumber;
/** <#属性描述#> */
@property (nonatomic) NSArray <YXRecommendModel *>*dataList;

- (YXRecommendModel *)modelForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSURL *)iconViewForRow:(NSInteger)row;
- (NSString *)slugForRow:(NSInteger)row;



@end
