//
//  STDTapHeaderItemCell.m
//  STDTableViewDemo
//
//  Created by XuQibin on 2017/10/21.
//  Copyright © 2017年 Standards. All rights reserved.
//

#import "STDExampleHeaderCell.h"

@implementation STDExampleHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setupCell
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.textLabel.textColor = kDarkTextColor;
    self.textLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightLight];
}

- (void)loadContent
{
    self.textLabel.text = self.data;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:12 options:UIViewAnimationOptionCurveLinear animations:^{
        if (highlighted) {
            self.textLabel.transform = CGAffineTransformMakeScale(0.98, 0.98);
        } else {
            self.textLabel.transform = CGAffineTransformIdentity;
        }
    } completion:nil];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
