//
//  YXRecommendViewModel.m
//  TRProject
//
//  Created by chuchangqing on 16/6/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXRecommendViewModel.h"

@implementation YXRecommendViewModel
- (NSInteger)rowNumber{
    return self.dataList.count;
}
- (YXRecommendModel *)modelForRow:(NSInteger)row{
    return self.dataList[row];
}
- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].name;
}
- (NSURL *)iconViewForRow:(NSInteger)row{
    return [self modelForRow:row].image.yx_URL;
}
- (NSString *)slugForRow:(NSInteger)row{
    return [self modelForRow:row].slug;
}
- (NSArray <YXRecommendModel *> *)dataList {
    if(_dataList == nil) {
        _dataList = [NSArray <YXRecommendModel *> new];
    }
    return _dataList;
}
- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    [YXNetManager getRecommendDataCompletionhandler:^(id model, NSError *error) {
        if (error) {
            DDLogError(@"error %@", error);
        }else{
                self.dataList = model;
        }
        !completionHandler ?: completionHandler(error);
    }];
}
@end
