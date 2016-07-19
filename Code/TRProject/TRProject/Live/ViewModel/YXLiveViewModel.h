//
//  YXLiveViewModel.h
//  TRProject
//
//  Created by chuchangqing on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "YXLiveModel.h"

@interface YXLiveViewModel : TRBaseViewModel
/** r */
@property (nonatomic,readonly) NSInteger page;
/** <#属性描述#> */
@property (nonatomic,readonly) NSInteger rowNumber;
/** <#属性描述#> */
@property (nonatomic) NSMutableArray<LiveDataList *> *dataList;
- (LiveDataList *)modelForRow:(NSInteger)row;
- (NSString *)nickForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSURL *)iconViewForRow:(NSInteger)row;
- (NSString *)onlineForRow:(NSInteger)row;
- (NSString *)uidForRow:(NSInteger)row;
@end
