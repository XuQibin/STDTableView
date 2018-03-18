//
//  UITableView+STDTableView.h
//  STDTableView
//
//  Created by XuQibin on 2017/6/5.
//  Copyright © 2017年 Standards. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "STDTableViewItem.h"
#import "STDTableViewSection.h"
#import "STDTableViewDataSource.h"
#import "STDTableViewCell.h"
#import "STDTableViewHeaderFooterView.h"

@interface UITableView (STDTableView)

#pragma mark - propeties

@property (nonatomic, weak) UIViewController *viewController;

@property (nonatomic, weak) id<STDTableViewCellDelegate> cellDelegate;
@property (nonatomic, weak) id<STDTableViewHeaderFooterViewDelegate> headerFooterViewDelegate;

#pragma mark - constructor

+ (instancetype)tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style dataSource:(STDTableViewDataSource *)dataSource;

+ (instancetype)tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style;

#pragma mark - tools
- (void)creatDataSource;
- (void)configDataSource:(STDTableViewDataSource *)dataSource;

- (void)cellSelectedCallbackWithIndexPath:(NSIndexPath *)indexPath;
- (void)cellDeselectedCallbackWithIndexPath:(NSIndexPath *)indexPath;

- (STDTableViewItem *)itemAtIndexPath:(NSIndexPath *)indexPath;
- (STDTableViewItem *)itemAtSection:(NSUInteger)section row:(NSUInteger)row;
- (NSArray<STDTableViewItem *> *)itemsAtSection:(NSUInteger)section;

- (void)addItem:(id)item atSection:(NSUInteger)section;
- (void)addItems:(NSArray *)items atSection:(NSUInteger)section;
- (void)insertItem:(id)item atSection:(NSUInteger)section row:(NSUInteger)row;
- (void)insertItem:(id)item atIndexPath:(NSIndexPath *)indexPath;
- (void)removeItem:(id)item atSection:(NSUInteger)section;
- (void)removeItemAtSection:(NSUInteger)section row:(NSUInteger)row;
- (void)removeItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)removeAllItemAtSection:(NSUInteger)section;
- (NSUInteger)itemsCountAtSection:(NSUInteger)section;

- (STDTableViewSection *)sectionAtIndex:(NSUInteger)index;
- (void)addSection:(STDTableViewSection *)section;
- (void)addSections:(NSArray<STDTableViewSection *> *)sections;
- (void)insertSection:(STDTableViewSection *)section atIndex:(NSUInteger)index;
- (void)removeSectionAtIndex:(NSUInteger)section;
- (void)removeAllSections;
- (NSUInteger)sectionsCount;

#pragma mark - operation animation
- (void)insertSectionsAtEmptyTableView:(NSUInteger)sectionsCount withRowAnimation:(UITableViewRowAnimation)animation;

- (void)insertSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)deleteSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)reloadSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)insertRows:(NSUInteger)rowsCount atEmptySection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)insertRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)insertRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

- (void)deleteRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)deleteRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)deleteRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

- (void)deleteAllRowsAtSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)reloadRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)reloadRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

#pragma mark - register

- (void)registerCellNibClass:(Class)nibClass;

- (void)registerCellClass:(Class)cellClass;

- (void)registerHeaderFooterViewClass:(Class)registerClass;

- (void)registerHeaderFooterViewNibClass:(Class)registerNibClass;

@end
