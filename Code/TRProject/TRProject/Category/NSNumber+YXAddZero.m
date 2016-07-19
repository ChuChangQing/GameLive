//
//  NSNumber+YXAddZero.m
//  TRProject
//
//  Created by chuchangqing on 16/6/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "NSNumber+YXAddZero.h"

@implementation NSNumber (YXAddZero)
- (NSString *)yx_addZero{
    if (self.integerValue < 10) {
        return [NSString stringWithFormat:@"0%@",self];
    }else{
        return [NSString stringWithFormat:@"%@", self];
    }
}

- (NSString *)yx_changeWan{
    if (self.integerValue < 10000) {
        return [NSString stringWithFormat:@"%@",self];
    }else{
        return [NSString stringWithFormat:@"%.1f万",self.integerValue/10000.0];
    }
}
@end
