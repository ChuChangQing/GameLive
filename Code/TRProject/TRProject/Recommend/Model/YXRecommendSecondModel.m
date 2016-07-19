//
//  YXRecommendSecondModel.m
//  TRProject
//
//  Created by chuchangqing on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXRecommendSecondModel.h"

@implementation YXRecommendSecondModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data":[RecommendSDDataModel class]};
}
@end

@implementation RecommendSDDataModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"nack":@"nick"};
}
@end


