//
//  ViewController.m
//  AWAlertView
//
//  Created by lei-wen on 2019/3/28.
//  Copyright © 2019 lei-wen. All rights reserved.
//

#import "ViewController.h"
#import "AWAlertView.h"
#import "CenterAlertContentView.h"
#import "BottomAlertContentView.h"

#define AWColorWithRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *centenBTN = [UIButton buttonWithType:UIButtonTypeSystem];
    [centenBTN setFrame:CGRectMake(40, 100, self.view.frame.size.width - 80, 40)];
    centenBTN.backgroundColor = AWColorWithRGB(0x72E2FF);
    [centenBTN setTitle:@"中间弹出" forState:UIControlStateNormal];
    [centenBTN setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    centenBTN.titleLabel.font = [UIFont systemFontOfSize:15];
    [centenBTN addTarget:self action:@selector(centerAlertAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bottomBTN = [UIButton buttonWithType:UIButtonTypeSystem];
    [bottomBTN setFrame:CGRectMake(40, 240, self.view.frame.size.width - 80, 40)];
    bottomBTN.backgroundColor = AWColorWithRGB(0x72E2FF);
    [bottomBTN setTitle:@"底部弹出" forState:UIControlStateNormal];
    [bottomBTN setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    bottomBTN.titleLabel.font = [UIFont systemFontOfSize:15];
    [bottomBTN addTarget:self action:@selector(bottomAlertAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:centenBTN];
    [self.view addSubview:bottomBTN];
}

- (void)centerAlertAction:(id)sender {
    AWAlertView *alertView = [[AWAlertView alloc] init];
    CenterAlertContentView *centerContentView = [[CenterAlertContentView alloc] initWithFrame:CGRectMake(0, 0, 285, 285)];
    alertView.contentView = centerContentView;
    alertView.hiddenWhenTapBg = YES;
    [alertView show];
}

- (void)bottomAlertAction:(id)sender {
    AWAlertView *alertView = [[AWAlertView alloc] init];
    BottomAlertContentView *bottomContentView = [[BottomAlertContentView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400)];
    alertView.type = AWAlertViewTypeBottom;
    alertView.contentView = bottomContentView;
    alertView.hiddenWhenTapBg = YES;
    [alertView show];
}

@end
