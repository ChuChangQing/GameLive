//
//  YXColumnModel.m
//  TRProject
//
//  Created by chuchangqing on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXColumnModel.h"

@implementation YXColumnModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"mobilewebgame":[MobileModel class],
             @"mobileminecraft":[MobileModel class],
             @"mobiletvgame":[MobileModel class],
             @"mobilesport":[MobileModel class],
             @"mobilestar":[MobileModel class],
             @"mobilerecommendation":[MobileModel class],
             @"mobileindex":[MobileModel class],
             @"mobilelol":[MobileModel class],
             @"mobilebeauty":[MobileModel class],
             @"mobileheartstone":[MobileModel class],
             @"mobileblizzard":[MobileModel class],
             @"list":[ListModel class],
             @"mobiledota2":[MobileModel class],
             @"mobilednf":[MobileModel class]};
}
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"mobilewebgame":@"moblie-webgame",
             @"mobileminecraft":@"moblie-minecraft",
             @"mobiletvgame":@"mobile-tvgame",
             @"mobilesport":@"moblie-sport",
             @"mobilestar":@"mobile-star",
             @"mobilerecommendation":@"mobile-recommendation",
             @"mobileindex":@"mobile-index",
             @"mobilelol":@"mobile-lol",
             @"mobilebeauty":@"mobile-beauty",
             @"mobileheartstone":@"mobile-heartstone",
             @"mobileblizzard":@"moblie-blizzard",
             @"list":@"list",
             @"mobiledota2":@"mobile-dota2",
             @"mobilednf":@"moblie-dnf",};
}

@end


@implementation MobileModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}


@end

@implementation ListModel



@end

