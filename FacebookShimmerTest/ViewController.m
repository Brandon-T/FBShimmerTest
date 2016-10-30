//
//  ViewController.m
//  FacebookShimmerTest
//
//  Created by Brandon T on 2016-10-29.
//  Copyright © 2016 XIO. All rights reserved.
//

#import "ViewController.h"
#import "LoadingCell.h"

#define kFBShimmerTestCellIdentifier @"kFBShimmerTestCellIdentifier"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonnull, nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initControls];
    [self setTheme];
    [self registerClasses];
    [self doLayout];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initControls {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
}

- (void)setTheme {
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setRowHeight:UITableViewAutomaticDimension];
    [self.tableView setEstimatedRowHeight:300.0];
}

- (void)registerClasses {
    [self.tableView registerClass:[LoadingCell class] forCellReuseIdentifier:kFBShimmerTestCellIdentifier];
}

- (void)doLayout {
    [self.view addSubview:self.tableView];
    
    [self.tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.tableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LoadingCell *cell = [tableView dequeueReusableCellWithIdentifier:kFBShimmerTestCellIdentifier forIndexPath:indexPath];
    [cell shimmer];
    return cell;
}
@end
