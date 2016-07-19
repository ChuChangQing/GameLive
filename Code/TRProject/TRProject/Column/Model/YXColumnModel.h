//
//  YXColumnModel.h
//  TRProject
//
//  Created by chuchangqing on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXColumnLinkModel.h"

@class MobileModel,ListModel,YXColumnLinkModel;

@interface YXColumnModel : NSObject
//moblie-webgame -> mobliewebgame
@property (nonatomic, strong) NSArray<MobileModel *> *mobilewebgame;
//moblie-minecraft -> moblieminecraft
@property (nonatomic, strong) NSArray<MobileModel *> *mobileminecraft;
//moblie-minecraft -> moblieminecraft
@property (nonatomic, strong) NSArray<MobileModel *> *mobiletvgame;
//moblie-sport -> mobliesport
@property (nonatomic, strong) NSArray<MobileModel *> *mobilesport;
//mobile-star -> mobilestar
@property (nonatomic, strong) NSArray<MobileModel *> *mobilestar;
//mobile-recommendation -> mobilerecommendation
@property (nonatomic, strong) NSArray<MobileModel *> *mobilerecommendation;
//mobile-index -> mobileindex
@property (nonatomic, strong) NSArray<MobileModel *> *mobileindex;
//mobile-lol -> mobilelol
@property (nonatomic, strong) NSArray<MobileModel *> *mobilelol;
//mobile-beauty -> mobilebeauty
@property (nonatomic, strong) NSArray<MobileModel *> *mobilebeauty;
//mobile-heartstone -> mobileheartstone
@property (nonatomic, strong) NSArray<MobileModel *> *mobileheartstone;
//moblie-blizzard -> moblieblizzard
@property (nonatomic, strong) NSArray<MobileModel *> *mobileblizzard;

@property (nonatomic, strong) NSArray<ListModel *> *list;
//mobile-dota2 -> mobiledota2
@property (nonatomic, strong) NSArray<MobileModel *> *mobiledota2;
//moblie-dnf -> mobliednf
@property (nonatomic, strong) NSArray<MobileModel *> *mobilednf;

@end

@interface MobileModel : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, assign) NSInteger slot_id;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *create_at;

@property (nonatomic, strong) YXColumnLinkModel *link_object;

@property (nonatomic, copy) NSString *ext;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *fk;

@end

@interface ListModel : NSObject

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *name;

@end


