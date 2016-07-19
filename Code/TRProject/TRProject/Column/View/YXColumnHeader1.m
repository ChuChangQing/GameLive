//
//  YXColumnHeader1.m
//  TRProject
//
//  Created by chuchangqing on 16/6/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXColumnHeader1.h"

@implementation YXColumnHeader1

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(15);
        }];
        _titleLb.font = [UIFont systemFontOfSize:20];
    }
    return _titleLb;
}

- (UIButton *)btu {
    if(_btu == nil) {
        _btu = [UIButton buttonWithType:UIButtonTypeSystem];
        [self addSubview:_btu];
        [_btu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-15);
            make.bottom.equalTo(-8);
        }];

    }
    return _btu;
}

@end
