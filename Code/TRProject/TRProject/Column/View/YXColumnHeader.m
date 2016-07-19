//
//  YXColumnHeader.m
//  TRProject
//
//  Created by chuchangqing on 16/6/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXColumnHeader.h"

@interface YXColumnHeader ()



@end

@implementation YXColumnHeader
#pragma mark -  IC  Delegate


#pragma mark - Lazyload 懒加载


- (iCarousel *)ic {
    if(_ic == nil) {
        [self addSubview:_ic];
        _ic = [[iCarousel alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 180)];
        _ic.scrollSpeed = .2;
        _ic.tag = 1000;
    }
    return _ic;
}

- (iCarousel *)downIC {
    if(_downIC == nil) {
        [self addSubview:_downIC];
        _downIC = [[iCarousel alloc] initWithFrame:CGRectMake(0, 180, kScreenW, 120)];
        _ic.scrollSpeed = .2;
        _downIC.tag = 2000;
    }
    return _downIC;
}

- (void)setIcDelegate:(id<iCarouselDelegate,iCarouselDataSource>)icDelegate{
    self.ic.delegate = icDelegate;
    self.ic.dataSource = icDelegate;
    self.downIC.delegate = icDelegate;
    self.downIC.dataSource = icDelegate;
}





@end
