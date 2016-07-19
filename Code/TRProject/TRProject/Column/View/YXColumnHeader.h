//
//  YXColumnHeader.h
//  TRProject
//
//  Created by chuchangqing on 16/6/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YXColumnViewModel.h"

@interface YXColumnHeader : UICollectionReusableView

/** <#属性描述#> */
@property (nonatomic) iCarousel *ic;
/** <#属性描述#> */
@property (nonatomic) iCarousel *downIC;

/**  */
@property (nonatomic,weak) id<iCarouselDelegate, iCarouselDataSource> icDelegate;
@end
