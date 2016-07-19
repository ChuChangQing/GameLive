//
//  YXNetManager.m
//  TRProject
//
//  Created by chuchangqing on 16/6/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXNetManager.h"


@implementation YXNetManager
+ (id)getRecommendDataCompletionhandler:(void (^)(id, NSError *))completionHandler{
    return [self GET:@"/json/categories/list.json" parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([YXRecommendModel parseJSON:jsonObject], error);
    }];
}
+ (id)getLivePage:(NSInteger)page Completionhandler:(void (^)(YXLiveModel *, NSError *))completionHandler{
    NSString *path = nil;
    if (page == 0) {
        path = @"/json/play/list.json";
    }else{
        path = [NSString stringWithFormat:@"/json/play/list_%ld.json",page];
    }
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([YXLiveModel parseJSON:jsonObject],error);
    }];
}
+ (id)getSecondRecommendPage:(NSInteger)page Slug:(NSString *)slug Completionhandler:(void (^)(YXRecommendSecondModel *, NSError *))completionHandler{
    NSString *path = nil;
    if (page == 0) {
        path = [NSString stringWithFormat:@"/json/categories/%@/list.json",slug];
    }else{
        path = [NSString stringWithFormat:@"/json/categories/%@/list_%ld.json",slug, page];
    }
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([YXRecommendSecondModel parseJSON:jsonObject], error);
    }];
}
+ (id)getColumnDataCompletionhandler:(void (^)(YXColumnModel *, NSError *))completionHandler{
    return [self GET:@"/json/page/app-index/info.json" parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([YXColumnModel parseJSON:jsonObject], error);

    }];
}
@end
