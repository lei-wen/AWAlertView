//
//  AWAlertView.h
//  AWAlertView
//
//  Created by lei-wen on 2019/3/28.
//  Copyright © 2019 lei-wen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    AWAlertViewTypeCenter,   /* 从中间弹出 */
    AWAlertViewTypeBottom   /* 从底部弹出 */
} AWAlertViewType;

NS_ASSUME_NONNULL_BEGIN

@interface AWAlertView : UIView

@property (nonatomic, assign) AWAlertViewType type;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, assign) BOOL hiddenWhenTapBg;     // 点击背景时是否隐藏Alert

- (void)show;
- (void)hide;

@end

NS_ASSUME_NONNULL_END
