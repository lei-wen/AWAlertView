//
//  BottomAlertContentView.m
//  AWAlertView
//
//  Created by lei-wen on 2019/3/28.
//  Copyright © 2019 lei-wen. All rights reserved.
//

#import "BottomAlertContentView.h"
#import "AWAlertView.h"

#define AWColorWithRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface BottomAlertContentView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation BottomAlertContentView

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self addSubview:_tableView];
    }
    return _tableView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *titleLab = [[UILabel alloc] init];
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.text = @"Hello Alert";
        titleLab.textColor = [UIColor grayColor];
        titleLab.font = [UIFont systemFontOfSize:16];
        [self addSubview:titleLab];
        titleLab.frame = CGRectMake(0, 0, CGRectGetWidth(frame), 50);
        
        self.tableView.frame = CGRectMake(0, CGRectGetMaxY(titleLab.frame), CGRectGetWidth(frame), CGRectGetHeight(frame) - 100);
        
        UIButton *bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        bottomBtn.backgroundColor = AWColorWithRGB(0xFED953);
        [bottomBtn setTitle:@"取消" forState:UIControlStateNormal];
        [bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        bottomBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [bottomBtn addTarget:self action:@selector(selectBottomClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bottomBtn];
        bottomBtn.frame = CGRectMake(0, CGRectGetHeight(frame) - 40, CGRectGetWidth(frame), 40);
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@" UITableViewCell   Index   %li", indexPath.row];
    return cell;
}

- (void)selectBottomClick:(UIButton *)button {
    AWAlertView *alertView = (AWAlertView *)self.superview;
    [alertView hide];
}

@end
