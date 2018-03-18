//
//  STDTableViewHeaderFooterView.h
//  STDTableView
//
//  Created by XuQibin on 2017/6/6.
//  Copyright © 2017年 Standards. All rights reserved.
//

#import <UIKit/UIKit.h>

@class STDTableViewHeaderFooterView;

@protocol STDTableViewHeaderFooterViewDelegate <NSObject>

@optional
- (void)tableViewHeaderFooterView:(STDTableViewHeaderFooterView *)headerFooterView event:(id)event;

@end

@interface STDTableViewHeaderFooterView : UITableViewHeaderFooterView

#pragma mark - propeties

@property (nonatomic, weak) id <STDTableViewHeaderFooterViewDelegate> delegate;

@property (nonatomic, weak) id data;

@property (nonatomic, assign) NSInteger section;

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, weak) UIViewController *viewController;

@property (strong, nonatomic) UIColor *headerFooterViewBackgroundColor;

#pragma mark - register

+ (void)registerClassToTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier;
+ (void)registerNibToTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier;

+ (void)registerClassToTableView:(UITableView *)tableView;
+ (void)registerNibToTableView:(UITableView *)tableView;

#pragma mark - constructor

+ (instancetype)headerViewWithTableView:(UITableView *)tableView atSection:(NSInteger)section;
+ (instancetype)footerViewWithTableView:(UITableView *)tableView atSection:(NSInteger)section;

+ (CGFloat)heightForHeaderInTableView:(UITableView *)tableView section:(NSUInteger)section;
+ (CGFloat)heightForFooterInTableView:(UITableView *)tableView section:(NSUInteger)section;

#pragma mark - override by subclass
- (void)setupHeaderFooterView;

- (void)buildSubview;

- (void)loadContent;

@end
