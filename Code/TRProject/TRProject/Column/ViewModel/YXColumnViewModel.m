//
//  YXColumnViewModel.m
//  TRProject
//
//  Created by chuchangqing on 16/6/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXColumnViewModel.h"

@implementation YXColumnViewModel
- (NSInteger)sectionNumber{
    return self.dataList.count + 1;
}



- (NSMutableArray<MobileModel *> *)MobileStarModellist {
    if(_MobileStarModellist == nil) {
        _MobileStarModellist = [[NSMutableArray<MobileModel *> alloc] init];
    }
    return _MobileStarModellist;
}

- (NSMutableArray<MobileModel *> *)MobileIndexModellist {
    if(_MobileIndexModellist == nil) {
        _MobileIndexModellist = [[NSMutableArray<MobileModel *> alloc] init];
    }
    return _MobileIndexModellist;
}


- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    [YXNetManager getColumnDataCompletionhandler:^(YXColumnModel *model, NSError *error) {
        if (error) {
            DDLogError(@"error %@", error);
        }else{
//            if (requestMode == VMRequestModeRefresh) {
//                [self.MobileStarModellist removeAllObjects];
//                [self.MobileIndexModellist removeAllObjects];
//                [self.dataList removeAllObjects];
//                [self.ListModellist removeAllObjects];
//            }
            [self.MobileStarModellist addObjectsFromArray:model.mobilestar];
            [self.MobileIndexModellist addObjectsFromArray:model.mobileindex];
            [self.ListModellist addObjectsFromArray:model.list];
            self.dataList = @[model.mobilerecommendation,
                              model.mobilelol,
                              model.mobilebeauty,
                              model.mobiletvgame,
                              model.mobileheartstone,
                              model.mobiledota2,
                              model.mobileblizzard,
                              model.mobilednf,
                              model.mobilesport,
                              model.mobileminecraft,
                              model.mobilewebgame].mutableCopy;
        }
        !completionHandler ?: completionHandler(error);
    }];
}
- (NSMutableArray *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray alloc] init];
    }
    return _dataList;
}
- (YXColumnLinkModel *)modelForSction:(NSInteger)sction Row:(NSInteger)row{
    NSArray< YXColumnModel *> *modelArray = self.dataList[sction - 1];
    MobileModel *mobilModel = (MobileModel *)modelArray[row];
    return mobilModel.link_object;
}
- (NSMutableArray<ListModel *> *)ListModellist {
    if(_ListModellist == nil) {
        _ListModellist = [[NSMutableArray<ListModel *> alloc] init];
    }
    return _ListModellist;
}
@end
