//
//  YXNetManager.h
//  TRProject
//
//  Created by chuchangqing on 16/6/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXRecommendModel.h"
#import "YXLiveModel.h"
#import "YXRecommendSecondModel.h"
#import "YXColumnModel.h"
@interface YXNetManager : NSObject
+ (id)getRecommendDataCompletionhandler:(void(^)(id model, NSError *error))completionHandler;
+ (id)getLivePage:(NSInteger)page Completionhandler:(void(^)(YXLiveModel * model, NSError *error))completionHandler;
+ (id)getSecondRecommendPage:(NSInteger)page Slug:(NSString *)slug Completionhandler:(void (^)(YXRecommendSecondModel *model, NSError *error))completionHandler;
+ (id)getColumnDataCompletionhandler:(void(^)(YXColumnModel *model, NSError *error))completionHandler;
@end
