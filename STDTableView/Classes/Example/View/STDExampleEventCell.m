//
//  STDExampleEventCell.m
//  STDTableView
//
//  Created by XuQibin on 2018/3/18.
//  Copyright © 2018年 Standards. All rights reserved.
//

#import "STDExampleEventCell.h"

#import "STDExampleEventItem.h"

@interface STDExampleEventCell()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *stateViewWidthConstraint;

@end

@implementation STDExampleEventCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - override
- (void)setupCell
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.titleLabel.textColor = kDarkTextColor;
    self.textField.textColor = kDarkTextColor;
    
    self.textField.delegate = self;
    
    [self.textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)loadContent
{
    STDExampleEventItem *editItem = self.data;
    
    self.titleLabel.text = editItem.title;
    
    self.textField.placeholder = editItem.placeholder;
    
    self.textField.text = editItem.inputText;
    
    if ([self.delegate respondsToSelector:@selector(tableViewCell:event:)]) {
        [self.delegate tableViewCell:self event:@(STDEditEventInitialize)];
    }
}

- (void)selectedEvent
{
    [self.textField becomeFirstResponder];
}

#pragma mark - other

#pragma mark - text field delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.tableView selectRowAtIndexPath:self.indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    STDExampleEventItem *editItem = self.data;
    
    editItem.inputText = textField.text;
    
    if ([self.delegate respondsToSelector:@selector(tableViewCell:event:)]) {
        [self.delegate tableViewCell:self event:@(STDEditEventInputFinish)];
    }
}

- (void)textFieldDidChange:(UITextField *)textField
{
    STDExampleEventItem *editItem = self.data;
        
    editItem.inputText = textField.text;
        
    if ([self.delegate respondsToSelector:@selector(tableViewCell:event:)]) {
        [self.delegate tableViewCell:self event:@(STDEditEventInputChange)];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (![textField isExclusiveTouch]) {
        [textField resignFirstResponder];
    }
    
    return YES;
}


#pragma mark - selected animated
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
    if (selected) {
        self.stateViewWidthConstraint.constant = 3;
        [UIView animateWithDuration:.25f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            self.titleLabel.textColor = kGlobalColor;
            [self.contentView layoutIfNeeded];
        } completion:nil];
    } else {
        [self.textField resignFirstResponder];
        
        self.stateViewWidthConstraint.constant = 0;
        [UIView animateWithDuration:.25f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            self.titleLabel.textColor = kDarkTextColor;
            [self.contentView layoutIfNeeded];
        } completion:nil];
    }
}

@end
