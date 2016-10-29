//
//  LoadingCell.m
//  FacebookShimmerTest
//
//  Created by Brandon T on 2016-10-29.
//  Copyright © 2016 XIO. All rights reserved.
//

#import "LoadingCell.h"
#import "BottomView.h"
#import <Shimmer/FBShimmeringView.h>


@interface LoadingCell()
@property (nonnull, nonatomic, strong) UIView *topView;
@property (nonnull, nonatomic, strong) BottomView *bottomView;
@property (nonnull, nonatomic, strong) FBShimmeringView *shimmerView;
@end

@implementation LoadingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        [self initControls];
        [self setTheme];
        [self doLayout];
    }
    return self;
}

- (void)initControls {
    self.topView = [[UIView alloc] init];
    self.bottomView = [[BottomView alloc] init];
    self.shimmerView = [[FBShimmeringView alloc] init];
}

- (void)setTheme {
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    [self.topView setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0]];
    
    [self.shimmerView setContentView:self.bottomView];
}

- (void)doLayout {
    [self.contentView addSubview:self.topView];
    [self.contentView addSubview:self.shimmerView];
    
    
    [self.topView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor].active = YES;
    [self.topView.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor].active = YES;
    [self.topView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
    [self.topView.heightAnchor constraintEqualToConstant:175.0].active = YES;
    
    [self.shimmerView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor].active = YES;
    [self.shimmerView.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor].active = YES;
    [self.shimmerView.topAnchor constraintEqualToAnchor:self.topView.bottomAnchor].active = YES;
    [self.shimmerView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
    
    [self.topView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.shimmerView setTranslatesAutoresizingMaskIntoConstraints:NO];
}


- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)shimmer {
    [self.shimmerView setShimmering:YES];
}
@end
