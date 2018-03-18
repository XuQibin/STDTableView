//
//  STDExampleImageCell.m
//  STDTableView
//
//  Created by XuQibin on 2018/3/18.
//  Copyright © 2018年 Standards. All rights reserved.
//

#import "STDExampleImageCell.h"

@interface STDExampleImageCell()

@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;

@end

@implementation STDExampleImageCell

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
    [self.contentImageView setImage:[UIImage imageNamed:self.data]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
