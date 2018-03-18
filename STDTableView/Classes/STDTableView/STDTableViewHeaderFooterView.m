//
//  STDTableViewHeaderFooterView.m
//  STDTableView
//
//  Created by XuQibin on 2017/6/6.
//  Copyright © 2017年 Standards. All rights reserved.
//

#import "STDTableViewHeaderFooterView.h"
#import "STDTableViewDataSource.h"
#import "STDTableViewSection.h"

#import "STDTableViewConfig.h"

@implementation STDTableViewHeaderFooterView

#pragma mark - initialization

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        [self setupBaseConfig];
    }
    
    return self;
}

#pragma mark - constructor method.

+ (instancetype)headerViewWithTableView:(UITableView *)tableView atSection:(NSInteger)section
{
    STDTableViewDataSource *dataSource = tableView.dataSource;
    STDTableViewSection *sectionData = [dataSource sectionAtIndex:section];
    STDTableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sectionData.headerViewIdentifier];
    
    headerView.tableView = tableView;
    headerView.data = sectionData.sectionHeaderData;
    headerView.section = section;
    
    [headerView loadContent];
    
    return headerView;
}

+ (instancetype)footerViewWithTableView:(UITableView *)tableView atSection:(NSInteger)section
{
    STDTableViewDataSource *dataSource = tableView.dataSource;
    STDTableViewSection *sectionData = [dataSource sectionAtIndex:section];
    STDTableViewHeaderFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sectionData.footerViewIdentifier];
    
    footerView.tableView = tableView;
    footerView.data = sectionData.sectionFooterData;
    footerView.section = section;
    
    [footerView loadContent];
    
    return footerView;
}

+ (CGFloat)heightForHeaderInTableView:(UITableView *)tableView section:(NSUInteger)section
{
    STDTableViewDataSource *dataSource = tableView.dataSource;
    STDTableViewSection *sectionData = [dataSource sectionAtIndex:section];
    
    return sectionData.sectionHeaderHeight;
}

+ (CGFloat)heightForFooterInTableView:(UITableView *)tableView section:(NSUInteger)section
{
    STDTableViewDataSource *dataSource = tableView.dataSource;
    STDTableViewSection *sectionData = [dataSource sectionAtIndex:section];
    
    return sectionData.sectionFooterHeight;
}

#pragma mark - setter and getter

- (void)setHeaderFooterViewBackgroundColor:(UIColor *)headerFooterViewBackgroundColor
{
    _headerFooterViewBackgroundColor = headerFooterViewBackgroundColor;
    
    self.contentView.backgroundColor = headerFooterViewBackgroundColor;
}

#pragma mark - setup

- (void)setupBaseConfig
{
    self.viewController = [STDTableViewConfig sharedConfig].viewController;
    self.delegate = [STDTableViewConfig sharedConfig].headerFooterViewDelegate;
    
    [self setupHeaderFooterView];
    [self buildSubview];
}

#pragma mark - subclass overwrite

- (void)setupHeaderFooterView {
    
}

- (void)buildSubview {
    
}

- (void)loadContent {
    
}

#pragma mark - register tools

+ (void)registerClassToTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier {
    
    NSString *identifier = reuseIdentifier.length <= 0 ? NSStringFromClass([self class]) : reuseIdentifier;
    [tableView registerClass:[self class] forHeaderFooterViewReuseIdentifier:identifier];
}

+ (void)registerNibToTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier {
    
    NSString *identifier = reuseIdentifier.length <= 0 ? NSStringFromClass([self class]) : reuseIdentifier;
    
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forHeaderFooterViewReuseIdentifier:identifier];
}

+ (void)registerClassToTableView:(UITableView *)tableView {
    
    [tableView registerClass:[self class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([self class])];
}

+ (void)registerNibToTableView:(UITableView *)tableView {
    
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forHeaderFooterViewReuseIdentifier:NSStringFromClass([self class])];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
