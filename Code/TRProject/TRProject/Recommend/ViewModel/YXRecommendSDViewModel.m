//
//  YXRecommendSDViewModel.m
//  TRProject
//
//  Created by chuchangqing on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXRecommendSDViewModel.h"

@implementation YXRecommendSDViewModel
- (NSInteger)rowNumber{
    return self.dataList.count;
}
- (NSMutableArray<RecommendSDDataModel *> *)dataList {
    if(_dataList == nil) {
        _dataList = [NSMutableArray<RecommendSDDataModel *> new];
    }
    return _dataList;
}
- (RecommendSDDataModel *)modelForRow:(NSInteger)row{
    return self.dataList[row];
}
- (NSURL *)iconViewForRow:(NSInteger)row{
    return [self modelForRow:row].thumb.yx_URL;
}
- (NSURL *)litViewForRow:(NSInteger)row{
    return [self modelForRow:row].avatar.yx_URL;
}
- (NSString *)nickForRow:(NSInteger)row{
    return [self modelForRow:row].nack;
}
- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
- (NSString *)onlineForRow:(NSInteger)row{
    return @([self modelForRow:row].view.integerValue).yx_changeWan;
}
- (NSString *)uidForRow:(NSInteger)row{
    return [self modelForRow:row].uid;
}
- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 0;
    switch (requestMode) {
        case VMRequestModeRefresh: {
            tmpPage = 0;
            break;
        }
        case VMRequestModeMore: {
            tmpPage = _page + 1;
            break;
        }
    }
    [YXNetManager getSecondRecommendPage:tmpPage Slug:_slug Completionhandler:^(YXRecommendSecondModel *model, NSError *error) {
        if (error) {
            DDLogError(@"error %@", error);
        }else{
            if (requestMode == VMRequestModeRefresh) {
                [self.dataList removeAllObjects];
            }
            [self.dataList addObjectsFromArray:model.data];
            _page = tmpPage;
        }
        !completionHandler ?: completionHandler(error);
    }];
}
- (instancetype)initWithSlug:(NSString *)slug{
    if (self == [super init]) {
        _slug = slug;
    }
    return self;
}
@end
