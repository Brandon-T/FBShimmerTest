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


//#define kDisableFBShimmering

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
    self.bottomView = [[BottomView alloc] initWithFrame:CGRectMake(0, 0, 375, 125)];
    self.shimmerView = [[FBShimmeringView alloc] init];
}

- (void)setTheme {
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    [self.topView setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0]];
    
    #if !defined(kDisableFBShimmering)
    [self.shimmerView setContentView:self.bottomView];
    #endif
}

- (void)doLayout {
    [self.contentView addSubview:self.topView];
    
    #if !defined(kDisableFBShimmering)
    [self.contentView addSubview:self.shimmerView];
    #else
    [self.contentView addSubview:self.bottomView];
    #endif
    
    
    [self.topView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor].active = YES;
    [self.topView.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor].active = YES;
    [self.topView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
    [self.topView.heightAnchor constraintEqualToConstant:175.0].active = YES;
    
    #if !defined(kDisableFBShimmering)
    [self.shimmerView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor].active = YES;
    [self.shimmerView.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor].active = YES;
    [self.shimmerView.topAnchor constraintEqualToAnchor:self.topView.bottomAnchor].active = YES;
    [self.shimmerView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
    [self.shimmerView.heightAnchor constraintGreaterThanOrEqualToConstant:125.0].active = YES;
    #else
    [self.bottomView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor].active = YES;
    [self.bottomView.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor].active = YES;
    [self.bottomView.topAnchor constraintEqualToAnchor:self.topView.bottomAnchor].active = YES;
    [self.bottomView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
    [self.bottomView.heightAnchor constraintGreaterThanOrEqualToConstant:125.0].active = YES;
    #endif
    
    [self.topView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    #if !defined(kDisableFBShimmering)
    [self.shimmerView setTranslatesAutoresizingMaskIntoConstraints:NO];
    #else
    [self.bottomView setTranslatesAutoresizingMaskIntoConstraints:NO];
    #endif
}


- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)shimmer {
    #if !defined(kDisableFBShimmering)
    [self.shimmerView setShimmering:YES];
    #endif
}
@end
