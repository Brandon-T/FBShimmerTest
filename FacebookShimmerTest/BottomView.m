//
//  BottomVIew.m
//  FacebookShimmerTest
//
//  Created by Brandon T on 2016-10-29.
//  Copyright © 2016 XIO. All rights reserved.
//

#import "BottomView.h"

#define kLeftRightSpacing 15.0
#define kTopBottomSpacing 18.0
#define kMiddleSpacing 8.0

@interface BottomView()
@property (nonnull, nonatomic, strong) UILabel *titleLabel;
@property (nonnull, nonatomic, strong) UILabel *firstLine;
@property (nonnull, nonatomic, strong) UILabel *secondLine;
@property (nonnull, nonatomic, strong) UILabel *thirdLine;
@end

@implementation BottomView
- (instancetype)init {
    if ((self = [super init])) {
        [self initControls];
        [self setTheme];
        [self doLayout];
    }
    return self;
}

- (void)initControls {
    self.titleLabel = [[UILabel alloc] init];
    self.firstLine = [[UILabel alloc] init];
    self.secondLine = [[UILabel alloc] init];
    self.thirdLine = [[UILabel alloc] init];
}

- (void)setTheme {
    [self.titleLabel setText:@" "];
    [self.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [self.titleLabel setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0]];
    
    [self.firstLine setText:@" "];
    [self.firstLine setFont:[UIFont systemFontOfSize:12]];
    [self.firstLine setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0]];
    
    [self.secondLine setText:@" "];
    [self.secondLine setFont:[UIFont systemFontOfSize:12]];
    [self.secondLine setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0]];
    
    [self.thirdLine setText:@" "];
    [self.thirdLine setFont:[UIFont systemFontOfSize:12]];
    [self.thirdLine setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0]];
}

- (void)doLayout {
    [self addSubview:self.titleLabel];
    [self addSubview:self.firstLine];
    [self addSubview:self.secondLine];
    [self addSubview:self.thirdLine];
    

    [self.titleLabel.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:kLeftRightSpacing].active = YES;
    [self.titleLabel.topAnchor constraintGreaterThanOrEqualToAnchor:self.topAnchor constant:kTopBottomSpacing].active = YES;
    [self.titleLabel.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:0.5].active = YES;
    [self.titleLabel.heightAnchor constraintEqualToConstant:12.0].active = YES;
    

    [self.firstLine.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:kLeftRightSpacing].active = YES;
    [self.firstLine.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-kLeftRightSpacing].active = YES;
    [self.firstLine.topAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor constant:kTopBottomSpacing].active = YES;
    [self.firstLine.heightAnchor constraintEqualToConstant:9.0].active = YES;
    

    [self.secondLine.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:kLeftRightSpacing].active = YES;
    [self.secondLine.topAnchor constraintEqualToAnchor:self.firstLine.bottomAnchor constant:kMiddleSpacing].active = YES;
    [self.secondLine.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:2.0/3.0].active = YES;
    [self.secondLine.heightAnchor constraintEqualToConstant:9.0].active = YES;
    

    [self.thirdLine.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:kLeftRightSpacing].active = YES;
    [self.thirdLine.topAnchor constraintEqualToAnchor:self.secondLine.bottomAnchor constant:kLeftRightSpacing].active = YES;
    [self.thirdLine.bottomAnchor constraintLessThanOrEqualToAnchor:self.bottomAnchor constant:-kTopBottomSpacing].active = YES;
    [self.thirdLine.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:1.0/3.0].active = YES;
    [self.thirdLine.heightAnchor constraintEqualToConstant:9.0].active = YES;
    
    for (UIView *view in self.subviews) {
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
}
@end
