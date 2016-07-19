//
//  YXRecommendModel.h
//  TRProject
//
//  Created by chuchangqing on 16/6/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface YXRecommendModel : NSObject




@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *first_letter;

@property (nonatomic, assign) NSInteger status;
//id -> ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger prompt;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, copy) NSString *name;

@end

