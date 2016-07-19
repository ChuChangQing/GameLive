//
//  YXLiveModel.m
//  TRProject
//
//  Created by chuchangqing on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXLiveModel.h"

@implementation YXLiveModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data":[LiveDataList class]};
}
@end


@implementation LiveDataList
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"New_start_time":@"new_start_time"};
}
@end


