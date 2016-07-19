//
//  YXColumnCell.h
//  TRProject
//
//  Created by chuchangqing on 16/6/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXColumnCell : UICollectionViewCell
/**  */
@property (nonatomic) UILabel *nickLb;
/** <#属性描述#> */
@property (nonatomic) UILabel *titleLb;
/** <#属性描述#> */
@property (nonatomic) UILabel *onlineLb;
/** <#属性描述#> */
@property (nonatomic) UIImageView *iconView;
/** <#属性描述#> */
@property (nonatomic) UIImageView *litView;
/** <#属性描述#> */
@property (nonatomic) YXColumnLinkModel *linkModel;
- (instancetype)initWithModel:(YXColumnLinkModel *)model;


@end
