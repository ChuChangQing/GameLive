//
//  YXLiveViewModel.m
//  TRProject
//
//  Created by chuchangqing on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXLiveViewModel.h"

@implementation YXLiveViewModel

- (NSInteger)rowNumber{
    return self.dataList.count;
}
- (NSMutableArray<LiveDataList *> *)dataList {
    if(_dataList == nil) {
        _dataList = [NSMutableArray<LiveDataList *> new];
    }
    return _dataList;
}
- (LiveDataList *)modelForRow:(NSInteger)row{
    return self.dataList[row];
}
- (NSString *)nickForRow:(NSInteger)row{
    return [self modelForRow:row].nick;
}
- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
- (NSURL *)iconViewForRow:(NSInteger)row{
    return [self modelForRow:row].thumb.yx_URL;
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
    [YXNetManager getLivePage:tmpPage Completionhandler:^(YXLiveModel * model, NSError *error) {
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
@end
