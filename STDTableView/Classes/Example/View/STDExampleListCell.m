//
//  STDMainListCell.m
//  STDTableViewDemo
//
//  Created by XuQibin on 2017/10/20.
//  Copyright © 2017年 Standards. All rights reserved.
//

#import "STDExampleListCell.h"

#import "STDExampleListItem.h"

@interface STDExampleListCell()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;

@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;

@end

@implementation STDExampleListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setupCell
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)loadContent
{
    STDExampleListItem *item = self.data;
    
    self.contentView.backgroundColor = self.indexPath.row % 2 ? kColorFromRGB(0xf8fafc) : [UIColor whiteColor];
    
    self.nameLabel.text = item.title;
    self.sourceLabel.text = item.subTitle;
    
    self.nameLabel.transform = CGAffineTransformMakeScale(0.85, 0.85);

    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:20 options:UIViewAnimationOptionCurveLinear animations:^{
        self.nameLabel.transform = CGAffineTransformIdentity;
    } completion:nil];
}

- (void)selectedEvent
{    
    STDExampleListItem *item = self.data;

    if (item.object) {
        UIViewController *vc = [item.object new];
        
        vc.title = item.title;
        
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:12 options:UIViewAnimationOptionCurveLinear animations:^{
        if (highlighted) {
            self.nameLabel.transform = CGAffineTransformMakeScale(0.98, 0.98);
        } else {
            self.nameLabel.transform = CGAffineTransformIdentity;
        }
    } completion:nil];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
//    NSLog(@"%s %zd",__func__,selected);
    
    // Configure the view for the selected state
}

@end
