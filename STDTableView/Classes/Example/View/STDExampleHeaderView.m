//
//  STDTapHeaderView.m
//  STDTableViewDemo
//
//  Created by XuQibin on 2017/10/21.
//  Copyright © 2017年 Standards. All rights reserved.
//

#import "STDExampleHeaderView.h"

@interface STDExampleHeaderView()

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIImageView *arrowImageView;

@property (assign, nonatomic) BOOL expand;

@end

@implementation STDExampleHeaderView

- (void)setupHeaderFooterView
{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapEvent)];
    
    [self addGestureRecognizer:tapGestureRecognizer];
    
    self.headerFooterViewBackgroundColor = kColorFromRGB(0xf8fafc);
    
    self.textLabel.font = [UIFont systemFontOfSize:16];
    self.textLabel.textColor = kDarkTextColor;
}

- (void)buildSubview
{
    _arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-common-arrow-right"]];
    
    [_arrowImageView sizeToFit];
    
    _arrowImageView.translatesAutoresizingMaskIntoConstraints = NO;

    [self.contentView addSubview:_arrowImageView];

    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[arrowImageView(==7)]-10-|" options:0 metrics:nil views:@{@"arrowImageView":_arrowImageView}]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[arrowImageView(==13)]" options:0 metrics:nil views:@{@"arrowImageView":_arrowImageView}]];

    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_arrowImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
}

- (void)loadContent
{
    self.textLabel.text = self.data;
}

- (void)tapEvent
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewHeaderFooterView:event:)]) {
        [self.delegate tableViewHeaderFooterView:self event:nil];
    }
}

- (void)animationExpand:(BOOL)expand
{
    self.expand = expand;
    
    [UIView animateWithDuration:0.25 animations:^{
        if (expand) {
            _arrowImageView.transform = CGAffineTransformMakeRotation(M_PI_2);
        } else {
            _arrowImageView.transform = CGAffineTransformIdentity;
        }
    }];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
