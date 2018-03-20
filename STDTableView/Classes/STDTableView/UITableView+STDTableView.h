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

#define STDTableViewDeprecated(instead) DEPRECATED_MSG_ATTRIBUTE(" Use '" # instead "' instead")

@interface UITableView (STDTableView)

#pragma mark - propeties

@property (nonatomic, weak) UIViewController *std_viewController;

@property (nonatomic, weak) id<STDTableViewCellDelegate> std_cellDelegate;
@property (nonatomic, weak) id<STDTableViewHeaderFooterViewDelegate> std_headerFooterViewDelegate;

#pragma mark - constructor

+ (instancetype)std_tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style dataSource:(STDTableViewDataSource *)dataSource;

+ (instancetype)std_tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style;

#pragma mark - tools
- (void)std_creatDataSource;
- (void)std_configDataSource:(STDTableViewDataSource *)dataSource;

- (void)std_cellSelectedCallbackWithIndexPath:(NSIndexPath *)indexPath;
- (void)std_cellDeselectedCallbackWithIndexPath:(NSIndexPath *)indexPath;

- (STDTableViewItem *)std_itemAtIndexPath:(NSIndexPath *)indexPath;
- (STDTableViewItem *)std_itemAtSection:(NSUInteger)section row:(NSUInteger)row;
- (NSArray<STDTableViewItem *> *)std_itemsAtSection:(NSUInteger)section;

- (void)std_addItem:(id)item atSection:(NSUInteger)section;
- (void)std_addItems:(NSArray *)items atSection:(NSUInteger)section;
- (void)std_insertItem:(id)item atSection:(NSUInteger)section row:(NSUInteger)row;
- (void)std_insertItem:(id)item atIndexPath:(NSIndexPath *)indexPath;
- (void)std_removeItem:(id)item atSection:(NSUInteger)section;
- (void)std_removeItemAtSection:(NSUInteger)section row:(NSUInteger)row;
- (void)std_removeItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)std_removeAllItemAtSection:(NSUInteger)section;
- (NSUInteger)std_itemsCountAtSection:(NSUInteger)section;

- (NSArray<STDTableViewSection *> *)std_allSections;
- (STDTableViewSection *)std_sectionAtIndex:(NSUInteger)index;
- (void)std_addSection:(STDTableViewSection *)section;
- (void)std_addSections:(NSArray<STDTableViewSection *> *)sections;
- (void)std_insertSection:(STDTableViewSection *)section atIndex:(NSUInteger)index;
- (void)std_removeSectionAtIndex:(NSUInteger)section;
- (void)std_removeAllSections;
- (NSUInteger)std_sectionsCount;

#pragma mark - operation animation
- (void)std_insertSectionsAtEmptyTableView:(NSUInteger)sectionsCount withRowAnimation:(UITableViewRowAnimation)animation;

- (void)std_insertSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)std_deleteSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)std_reloadSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)std_insertRows:(NSUInteger)rowsCount atEmptySection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)std_insertRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)std_insertRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)std_insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

- (void)std_deleteRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)std_deleteRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)std_deleteRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

- (void)std_deleteAllRowsAtSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)std_reloadRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)std_reloadRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

- (void)std_reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

#pragma mark - register

- (void)std_registerCellNibClass:(Class)nibClass;

- (void)std_registerCellClass:(Class)cellClass;

- (void)std_registerHeaderFooterViewClass:(Class)registerClass;

- (void)std_registerHeaderFooterViewNibClass:(Class)registerNibClass;

@end

#pragma mark - ------------ Deprecated V0.1.0 ------------

@interface UITableView (STDTableViewDeprecatedV010)

#pragma mark - propeties

@property (nonatomic, weak) UIViewController *viewController STDTableViewDeprecated(std_viewController);

@property (nonatomic, weak) id<STDTableViewCellDelegate> cellDelegate STDTableViewDeprecated(std_cellDelegate);
@property (nonatomic, weak) id<STDTableViewHeaderFooterViewDelegate> headerFooterViewDelegate STDTableViewDeprecated(std_headerFooterViewDelegate);

#pragma mark - constructor

+ (instancetype)tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style dataSource:(STDTableViewDataSource *)dataSource STDTableViewDeprecated(std_tableViewWithFrame:style:dataSource);

+ (instancetype)tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style STDTableViewDeprecated(std_tableViewWithFrame:style:);

#pragma mark - tools
- (void)creatDataSource STDTableViewDeprecated(std_creatDataSource);
- (void)configDataSource:(STDTableViewDataSource *)dataSource STDTableViewDeprecated(std_configDataSource);

- (void)cellSelectedCallbackWithIndexPath:(NSIndexPath *)indexPath STDTableViewDeprecated(std_cellSelectedCallbackWithIndexPath:);
- (void)cellDeselectedCallbackWithIndexPath:(NSIndexPath *)indexPath STDTableViewDeprecated(std_cellDeselectedCallbackWithIndexPath:);

- (STDTableViewItem *)itemAtIndexPath:(NSIndexPath *)indexPath STDTableViewDeprecated(std_itemAtIndexPath:);
- (STDTableViewItem *)itemAtSection:(NSUInteger)section row:(NSUInteger)row STDTableViewDeprecated(std_itemAtSection:row:);
- (NSArray<STDTableViewItem *> *)itemsAtSection:(NSUInteger)section STDTableViewDeprecated(std_itemsAtSection:);

- (void)addItem:(id)item atSection:(NSUInteger)section STDTableViewDeprecated(std_addItem:atSection:);
- (void)addItems:(NSArray *)items atSection:(NSUInteger)section STDTableViewDeprecated(std_addItems:atSection:);
- (void)insertItem:(id)item atSection:(NSUInteger)section row:(NSUInteger)row STDTableViewDeprecated(std_insertItem:atSection:row:);
- (void)insertItem:(id)item atIndexPath:(NSIndexPath *)indexPath STDTableViewDeprecated(std_insertItem:atIndexPath:);
- (void)removeItem:(id)item atSection:(NSUInteger)section STDTableViewDeprecated(std_removeItem:atSection:);
- (void)removeItemAtSection:(NSUInteger)section row:(NSUInteger)row STDTableViewDeprecated(std_removeItemAtSection:row:);
- (void)removeItemAtIndexPath:(NSIndexPath *)indexPath STDTableViewDeprecated(std_removeItemAtIndexPath:);
- (void)removeAllItemAtSection:(NSUInteger)section STDTableViewDeprecated(std_removeAllItemAtSection:);
- (NSUInteger)itemsCountAtSection:(NSUInteger)section STDTableViewDeprecated(std_itemsCountAtSection:);

- (STDTableViewSection *)sectionAtIndex:(NSUInteger)index STDTableViewDeprecated(std_sectionAtIndex:);
- (void)addSection:(STDTableViewSection *)section STDTableViewDeprecated(std_addSection:);
- (void)addSections:(NSArray<STDTableViewSection *> *)sections STDTableViewDeprecated(std_addSections:);
- (void)insertSection:(STDTableViewSection *)section atIndex:(NSUInteger)index STDTableViewDeprecated(std_insertSection:atIndex:);
- (void)removeSectionAtIndex:(NSUInteger)section STDTableViewDeprecated(std_removeSectionAtIndex:);
- (void)removeAllSections STDTableViewDeprecated(std_removeAllSections);
- (NSUInteger)sectionsCount STDTableViewDeprecated(std_sectionsCount);

#pragma mark - operation animation
- (void)insertSectionsAtEmptyTableView:(NSUInteger)sectionsCount withRowAnimation:(UITableViewRowAnimation)animation STDTableViewDeprecated(std_insertSectionsAtEmptyTableView:withRowAnimation:);

- (void)insertSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation STDTableViewDeprecated(std_insertSection:withRowAnimation:);

- (void)deleteSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation STDTableViewDeprecated(std_deleteSection:withRowAnimation:);

- (void)reloadSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation STDTableViewDeprecated(std_reloadSection:withRowAnimation:);

- (void)insertRows:(NSUInteger)rowsCount atEmptySection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation STDTableViewDeprecated(std_insertRows:atEmptySection:withRowAnimation:);

- (void)insertRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation STDTableViewDeprecated(std_insertRows:atSection:withRowAnimation:);

- (void)insertRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation STDTableViewDeprecated(std_insertRow:atSection:withRowAnimation:);

- (void)insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation STDTableViewDeprecated(std_insertRowAtIndexPath:withRowAnimation:);

- (void)deleteRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation STDTableViewDeprecated(std_deleteRows:atSection:withRowAnimation:);

- (void)deleteRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation STDTableViewDeprecated(std_deleteRow:atSection:withRowAnimation:);

- (void)deleteRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation STDTableViewDeprecated(std_deleteRowAtIndexPath:withRowAnimation:);

- (void)deleteAllRowsAtSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation STDTableViewDeprecated(std_deleteAllRowsAtSection:withRowAnimation:);

- (void)reloadRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation STDTableViewDeprecated(std_reloadRows:atSection:withRowAnimation:);

- (void)reloadRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation STDTableViewDeprecated(std_reloadRow:atSection:withRowAnimation:);

- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation STDTableViewDeprecated(std_reloadRowAtIndexPath:withRowAnimation:);

#pragma mark - register

- (void)registerCellNibClass:(Class)nibClass STDTableViewDeprecated(std_registerCellNibClass:);

- (void)registerCellClass:(Class)cellClass STDTableViewDeprecated(std_registerCellClass:);

- (void)registerHeaderFooterViewClass:(Class)registerClass STDTableViewDeprecated(std_registerHeaderFooterViewClass:);

- (void)registerHeaderFooterViewNibClass:(Class)registerNibClass STDTableViewDeprecated(std_registerHeaderFooterViewNibClass:);

@end
