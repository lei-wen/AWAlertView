![](https://img.shields.io/badge/platform-iOS-red.svg) 
![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 
![](https://img.shields.io/appveyor/ci/gruntjs/grunt.svg)


# AWAlertView
自定义的视图弹框组件

## 效果
![image](https://github.com/lei-wen/AWAlertView/blob/master/play.gif)

## 使用方法
在点击按钮的触发方法中，新建AWAlertView实例对象，并设置它的contentView为你所想要展示的视图内容。与此同时，设置视图弹出方式，AWAlertViewTypeBottom为从底部弹出，AWAlertViewTypeCenter从中间弹出。
``` objc
typedef enum : NSUInteger {
    AWAlertViewTypeCenter,   /* 从中间弹出 */
    AWAlertViewTypeBottom   /* 从底部弹出 */
} AWAlertViewType;
```

``` objc
- (void)bottomAlertAction:(id)sender {
    AWAlertView *alertView = [[AWAlertView alloc] init];
    BottomAlertContentView *bottomContentView = [[BottomAlertContentView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400)];
    alertView.type = AWAlertViewTypeBottom;
    alertView.contentView = bottomContentView;
    alertView.hiddenWhenTapBg = YES;
    [alertView show];
}
```

