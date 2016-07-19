//
//  YXSecondRecommendCell.m
//  TRProject
//
//  Created by chuchangqing on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXSecondRecommendCell.h"

@implementation YXSecondRecommendCell
- (UILabel *)nickLb {
    if(_nickLb == nil) {
        _nickLb = [UILabel new];
        [self.contentView addSubview:_nickLb];
        [_nickLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(45);
            make.bottom.equalTo(self.titleLb.mas_top).equalTo(0);
            make.height.equalTo(18);
        }];
        _nickLb.font = [UIFont systemFontOfSize:14];
    }
    return _nickLb;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [UILabel new];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.onlineLb.mas_right).equalTo(5);
            make.bottom.equalTo(0);
            make.height.equalTo(16);
            make.right.equalTo(5);
        }];
        _titleLb.font = [UIFont systemFontOfSize:12];
        _titleLb.textColor = [UIColor darkGrayColor];
    }
    return _titleLb;
}

- (UILabel *)onlineLb {
    if(_onlineLb == nil) {
        _onlineLb = [UILabel new];
        [self.contentView addSubview:_onlineLb];
        _onlineLb.layer.cornerRadius = 5;
        _onlineLb.layer.masksToBounds = YES;
        [_onlineLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.equalTo(0);
            make.width.equalTo(40);
            make.height.equalTo(14);
        }];
        _onlineLb.font = [UIFont systemFontOfSize:10];
        _onlineLb.backgroundColor = kRGBColor(238, 238, 238, 1.0);
        _onlineLb.textAlignment = NSTextAlignmentCenter;
    }
    return _onlineLb;
}

- (UIImageView *)iconView {
    if(_iconView == nil) {
        _iconView = [UIImageView new];
        _iconView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_iconView];
        _iconView.layer.cornerRadius = 10;
        _iconView.layer.masksToBounds = YES;
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.bottom.equalTo(-40);
        }];
    }
    return _iconView;
}

- (UIImageView *)litView {
    if(_litView == nil) {
        _litView = [UIImageView new];
        _litView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_litView];
        _litView.layer.cornerRadius = 20;
        _litView.layer.masksToBounds = YES;
        [_litView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(0);
            //可能出问题
            make.bottom.equalTo(self.onlineLb.mas_top).equalTo(-2);
            make.width.height.equalTo(40);
        }];
    }
    return _litView;
}
@end
