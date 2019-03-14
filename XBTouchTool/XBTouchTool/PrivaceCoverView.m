//
//  PrivaceCoverView.m
//  XBTouchTool
//
//  Created by xxb on 2019/3/13.
//  Copyright © 2019年 xxb. All rights reserved.
//

#import "PrivaceCoverView.h"
#import "Masonry.h"

@implementation PrivaceCoverView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    CGFloat btnHeight = 30;
    self.btn_drop = ({
        XBButton *btn = [XBButton new];
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(btnHeight);
            make.left.right.bottom.equalTo(self);
        }];
        btn.userInteractionEnabled = NO;
        btn.img_normal = [UIImage imageNamed:@"pt180h_home_down_arrow"];
        btn.img_selected = [UIImage imageNamed:@"pt180h_home_up_arrow"];
        btn;
    });
    
    self.lb_title = ({
        UILabel *label = [UILabel new];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self).offset(- btnHeight * 0.3);
            make.bottom.lessThanOrEqualTo(self.btn_drop.mas_top).priority(1000);
        }];
        label.textColor = [UIColor whiteColor];
        label.text = @"privace mode on";
        label;
    });
}

@end
