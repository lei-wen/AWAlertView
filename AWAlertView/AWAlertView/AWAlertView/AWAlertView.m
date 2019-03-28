//
//  AWAlertView.m
//  AWAlertView
//
//  Created by lei-wen on 2019/3/28.
//  Copyright © 2019 lei-wen. All rights reserved.
//

#import "AWAlertView.h"

@interface AWAlertView ()

@property (nonatomic, strong) UIView *backgroundView;

@end

@implementation AWAlertView

- (UIView *)backgroundView {
    if (_backgroundView == nil) {
        _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
        if (self.contentView) {
            [self insertSubview:_backgroundView belowSubview:self.contentView];
        } else {
            [self addSubview:_backgroundView];
        }
    }
    return _backgroundView;
}

- (instancetype)init {
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3f];
        self.alpha = 0;
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
    return self;
}

- (void)setType:(AWAlertViewType)type {
    _type = type;
    if (self.type) {
        _contentView.frame = CGRectMake((CGRectGetMaxX(self.frame) - CGRectGetWidth(_contentView.frame)) * 0.5, CGRectGetMaxY(self.frame), CGRectGetWidth(_contentView.frame), CGRectGetHeight(_contentView.frame));
//        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:_contentView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
//        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//        shapeLayer.frame = _contentView.bounds;
//        shapeLayer.path = path.CGPath;
//        _contentView.layer.mask = shapeLayer;
    }
}

- (void)setContentView:(UIView *)contentView {
    _contentView = contentView;
    if (self.type == AWAlertViewTypeBottom) {
        _contentView.frame = CGRectMake((CGRectGetMaxX(self.frame) - CGRectGetWidth(_contentView.frame)) * 0.5, CGRectGetMaxY(self.frame), CGRectGetWidth(_contentView.frame), CGRectGetHeight(_contentView.frame));
        /*
         * 利用贝塞尔曲线为contentView的左上角、右上角设置圆角
         */
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:_contentView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = _contentView.bounds;
        shapeLayer.path = path.CGPath;
        _contentView.layer.mask = shapeLayer;
    } else {
        _contentView.center = self.center;
    }
    [self addSubview:_contentView];
}

-(void)setHiddenWhenTapBg:(BOOL)hiddenWhenTapBg {
    _hiddenWhenTapBg = hiddenWhenTapBg;
    if (_hiddenWhenTapBg) {
        [self.backgroundView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)]];
    }
}

- (void)show {
    if (self.type == AWAlertViewTypeBottom) {
        [UIView animateWithDuration:0.25 animations:^{
            self.alpha = 1.0;
            self.contentView.transform = CGAffineTransformMakeTranslation(0, -self.contentView.bounds.size.height);
        } completion:nil];
    } else {
        self.alpha = 1.0;
        CAKeyframeAnimation * animation;
        animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        animation.duration = 0.30;
        animation.removedOnCompletion = YES;
        animation.fillMode = kCAFillModeForwards;
        NSMutableArray *values = [NSMutableArray array];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1, 1.1, 1.0)]];
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
        animation.values = values;
        [_contentView.layer addAnimation:animation forKey:nil];
    }
}

- (void)hide {
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
        self.contentView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
