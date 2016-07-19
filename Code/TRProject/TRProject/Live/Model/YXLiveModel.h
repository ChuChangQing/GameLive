//
//  YXLiveModel.h
//  TRProject
//
//  Created by chuchangqing on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LiveDataList;
@interface YXLiveModel : NSObject

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, assign) NSInteger size;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, strong) NSArray<LiveDataList *> *data;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger pageCount;

@end
@interface LiveDataList : NSObject

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, copy) NSString *weight_add;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *follow_add;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *check;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, assign) BOOL hidden;

@property (nonatomic, copy) NSString *play_count;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *negative_view;

@property (nonatomic, copy) NSString *grade;

@property (nonatomic, copy) NSString *coin;

@property (nonatomic, copy) NSString *coin_add;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *create_at;

@property (nonatomic, copy) NSString *category_name;

@property (nonatomic, copy) NSString *default_image;
//new_start_time -> New_start_time
@property (nonatomic, copy) NSString *New_start_time;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *recommend_image;

@property (nonatomic, copy) NSString *locked_view;

@property (nonatomic, copy) NSString *last_end_at;

@property (nonatomic, copy) NSString *video_quality;

@property (nonatomic, copy) NSString *first_play_at;

@property (nonatomic, copy) NSString *announcement;

@property (nonatomic, assign) NSInteger follow;

@property (nonatomic, copy) NSString *follow_bak;

@property (nonatomic, copy) NSString *play_at;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *category_id;

@property (nonatomic, copy) NSString *weight;

@property (nonatomic, copy) NSString *category_slug;

@property (nonatomic, copy) NSString *app_shuffling_image;

@end

