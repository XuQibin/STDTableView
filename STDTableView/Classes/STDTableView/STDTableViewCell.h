//
//  STDTableViewCell.h
//  STDTableView
//
//  Created by XuQibin on 2017/6/5.
//  Copyright © 2017年 Standards. All rights reserved.
//
#import <UIKit/UIKit.h>

@class STDTableViewCell, STDTableViewItem;

@protocol STDTableViewCellDelegate <NSObject>

@optional
- (void)tableViewCell:(STDTableViewCell *)cell event:(id)event;

@end

@interface STDTableViewCell : UITableViewCell

#pragma mark - propeties

@property (nonatomic, weak) id<STDTableViewCellDelegate> delegate;

@property (nonatomic, weak) STDTableViewItem *item;

@property (nonatomic, weak) id data;

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, weak) UIViewController *viewController;

@property (nonatomic, strong) NSIndexPath *indexPath;

#pragma mark - override by subclass
- (void)setupCell;

- (void)buildSubview;

- (void)loadContent;

- (void)selectedEvent;

- (void)deselectedEvent;

+ (CGFloat)cellHeightWithData:(id)data;

#pragma mark - useful method

- (void)updateWithHeight:(CGFloat)height animated:(BOOL)animated;

- (void)setWeakReferenceWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath item:(STDTableViewItem *)item;

#pragma mark - cell data constructor

+ (STDTableViewItem *)cellItemWithReuseIdentifier:(NSString *)reuseIdentifier data:(id)data cellHeight:(CGFloat)height cellWidth:(CGFloat)cellWidth type:(NSInteger)type;

+ (STDTableViewItem *)cellItemWithReuseIdentifier:(NSString *)reuseIdentifier data:(id)data cellHeight:(CGFloat)height type:(NSInteger)type;

+ (STDTableViewItem *)cellItemWithData:(id)data cellHeight:(CGFloat)height type:(NSInteger)type;

+ (STDTableViewItem *)cellItemWithData:(id)data cellHeight:(CGFloat)height;

+ (STDTableViewItem *)cellItemWithData:(id)data;

#pragma mark - register

+ (void)registerClassToTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier;

+ (void)registerClassToTableView:(UITableView *)tableView;

+ (void)registerNibToTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier;

+ (void)registerNibToTableView:(UITableView *)tableView;

@end
