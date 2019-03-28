//
//  CenterAlertContentView.m
//  AWAlertView
//
//  Created by lei-wen on 2019/3/28.
//  Copyright © 2019 lei-wen. All rights reserved.
//

#import "CenterAlertContentView.h"
#import "AWAlertView.h"

#define AWColorWithRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation CenterAlertContentView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = @"Hello Alert";
        titleLabel.textColor = [UIColor grayColor];
        titleLabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:titleLabel];
        titleLabel.frame = CGRectMake(0, 0, CGRectGetWidth(frame), 50);
        
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"shop_invite_icon"];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        [self addSubview:imageView];
        imageView.frame = CGRectMake(20,  CGRectGetMaxY(titleLabel.frame) + 10, CGRectGetWidth(frame) - 40, CGRectGetHeight(frame) - (CGRectGetMaxY(titleLabel.frame) + 10 + 60));
        
        UIView *bottomVIew = [[UIView alloc] init];
        bottomVIew.backgroundColor = AWColorWithRGB(0xEFEFF4);
        [self addSubview:bottomVIew];
        bottomVIew.frame = CGRectMake(0, CGRectGetHeight(frame) - 50, CGRectGetWidth(frame), 50);
        
        UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBtn.backgroundColor = [UIColor whiteColor];
        [leftBtn setTitle:@"Cancel" forState:UIControlStateNormal];
        [leftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [leftBtn addTarget:self action:@selector(selectCenterClick:) forControlEvents:UIControlEventTouchUpInside];
        [bottomVIew addSubview:leftBtn];
        leftBtn.frame = CGRectMake(0, 1, (CGRectGetWidth(frame) - 1) * 0.5, 49);
        
        UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.backgroundColor = [UIColor whiteColor];
        [rightBtn setTitle:@"Result" forState:UIControlStateNormal];
        [rightBtn setTitleColor:AWColorWithRGB(0xFED953) forState:UIControlStateNormal];
        rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [rightBtn addTarget:self action:@selector(selectCenterClick:) forControlEvents:UIControlEventTouchUpInside];
        [bottomVIew addSubview:rightBtn];
        rightBtn.frame = CGRectMake((CGRectGetWidth(frame) - 1) * 0.5 + 1, 1, (CGRectGetWidth(frame) - 1) * 0.5, 49);
    }
    return self;
}

- (void)selectCenterClick:(UIButton *)button {
    AWAlertView *alertView = (AWAlertView *)self.superview;
    [alertView hide];
}

@end
