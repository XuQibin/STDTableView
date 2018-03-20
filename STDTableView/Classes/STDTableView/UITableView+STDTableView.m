//
//  UITableView+STDTableView.m
//  STDTableView
//
//  Created by XuQibin on 2017/6/5.
//  Copyright © 2017年 Standards. All rights reserved.
//

#import "UITableView+STDTableView.h"
#import "STDTableViewConfig.h"

#import <objc/runtime.h>

static char kSTDTableViewDataSourceIdentifyKey;

@interface UITableView()

@property (strong, nonatomic) STDTableViewDataSource *std_dataSource;

@end

@implementation UITableView (STDTableView)

#pragma mark - hook

#pragma mark - setter and getter
- (void)setStd_dataSource:(STDTableViewDataSource *)std_dataSource
{
    objc_setAssociatedObject(self, &kSTDTableViewDataSourceIdentifyKey, std_dataSource, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    self.dataSource = std_dataSource;
}

- (STDTableViewDataSource *)std_dataSource
{
    return objc_getAssociatedObject(self, &kSTDTableViewDataSourceIdentifyKey);
}

- (UIViewController *)std_viewController
{
    return [STDTableViewConfig sharedConfig].viewController;
}

- (void)setStd_viewController:(UIViewController *)viewController
{
    [STDTableViewConfig sharedConfig].viewController = viewController;
}

- (void)setStd_cellDelegate:(id<STDTableViewCellDelegate>)cellDelegate
{
    [STDTableViewConfig sharedConfig].cellDelegate = cellDelegate;
}

- (id<STDTableViewCellDelegate>)std_cellDelegate
{
    return [STDTableViewConfig sharedConfig].cellDelegate;
}

- (void)setStd_headerFooterViewDelegate:(id<STDTableViewHeaderFooterViewDelegate>)headerFooterViewDelegate
{
    [STDTableViewConfig sharedConfig].headerFooterViewDelegate = headerFooterViewDelegate;
}

- (id<STDTableViewHeaderFooterViewDelegate>)std_headerFooterViewDelegate
{
    return [STDTableViewConfig sharedConfig].headerFooterViewDelegate;
}

#pragma mark - constructor method.
+ (instancetype)std_tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style dataSource:(STDTableViewDataSource *)dataSource
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
    
    if (dataSource) {
        [tableView std_configDataSource:dataSource];
    } else {
        [tableView std_creatDataSource];
    }
    
    return tableView;
}

+ (instancetype)std_tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    return [UITableView std_tableViewWithFrame:frame style:style dataSource:nil];
}

#pragma mark - tools
- (void)std_configDataSource:(STDTableViewDataSource *)dataSource
{
    self.std_dataSource = dataSource;
}

- (void)std_creatDataSource
{
    STDTableViewDataSource *dataSource = [[STDTableViewDataSource alloc] init];
    
    [self std_configDataSource:dataSource];
}

- (void)std_cellSelectedCallbackWithIndexPath:(NSIndexPath *)indexPath
{
    [(STDTableViewCell *)[self cellForRowAtIndexPath:indexPath] selectedEvent];
}

- (void)std_cellDeselectedCallbackWithIndexPath:(NSIndexPath *)indexPath
{
    [(STDTableViewCell *)[self cellForRowAtIndexPath:indexPath] deselectedEvent];
}

- (STDTableViewItem *)std_itemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.std_dataSource itemAtIndexPath:indexPath];
}

- (STDTableViewItem *)std_itemAtSection:(NSUInteger)section row:(NSUInteger)row
{
    return [self.std_dataSource itemAtSection:section row:row];
}

- (NSArray<STDTableViewItem *> *)std_itemsAtSection:(NSUInteger)section
{
    return [self.std_dataSource itemsAtSection:section];
}

- (void)std_addItem:(id)item atSection:(NSUInteger)section
{
    [self.std_dataSource addItem:item atSection:section];
}

- (void)std_addItems:(NSArray *)items atSection:(NSUInteger)section
{
    [self.std_dataSource addItems:items atSection:section];
}

- (void)std_insertItem:(id)item atSection:(NSUInteger)section row:(NSUInteger)row
{
    [self.std_dataSource insertItem:item atSection:section row:row];
}

- (void)std_insertItem:(id)item atIndexPath:(NSIndexPath *)indexPath
{
    [self.std_dataSource insertItem:item atIndexPath:indexPath];
}

- (void)std_removeItem:(id)item atSection:(NSUInteger)section
{
    [self.std_dataSource removeItem:item atSection:section];
}

- (void)std_removeItemAtSection:(NSUInteger)section row:(NSUInteger)row
{
    [self.std_dataSource removeItemAtSection:section row:row];
}

- (void)std_removeItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.std_dataSource removeItemAtIndexPath:indexPath];
}

- (void)std_removeAllItemAtSection:(NSUInteger)section
{
    [self.std_dataSource removeAllItemAtSection:section];
}

- (NSUInteger)std_itemsCountAtSection:(NSUInteger)section
{
    return [self.std_dataSource itemsCountAtSection:section];
}

- (void)std_addSection:(STDTableViewSection *)section
{
    [self.std_dataSource addSection:section];
}

- (void)std_addSections:(NSArray<STDTableViewSection *> *)sections
{
    [self.std_dataSource addSections:sections];
}

- (void)std_insertSection:(STDTableViewSection *)section atIndex:(NSUInteger)index
{
    [self.std_dataSource insertSection:section atIndex:index];
}

- (NSArray<STDTableViewSection *> *)std_allSections
{
    return [self.std_dataSource allSections];
}

- (STDTableViewSection *)std_sectionAtIndex:(NSUInteger)index
{
    return [self.std_dataSource sectionAtIndex:index];
}

- (void)std_removeSectionAtIndex:(NSUInteger)index
{
    [self.std_dataSource removeSectionAtIndex:index];
}

- (void)std_removeAllSections
{
    [self.std_dataSource removeAllSections];
}

- (NSUInteger)std_sectionsCount
{
    return [self.std_dataSource sectionsCount];
}

#pragma mark - operation animation

- (void)std_insertSectionsAtEmptyTableView:(NSUInteger)sectionsCount withRowAnimation:(UITableViewRowAnimation)animation
{
    [self insertSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, sectionsCount)] withRowAnimation:animation];
}

- (void)std_insertSection:(NSUInteger)sectionIndex withRowAnimation:(UITableViewRowAnimation)animation
{
    [self insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:animation];
}

- (void)std_deleteSection:(NSUInteger)sectionIndex withRowAnimation:(UITableViewRowAnimation)animation
{
    [self deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:animation];
}

- (void)std_reloadSection:(NSUInteger)sectionIndex withRowAnimation:(UITableViewRowAnimation)animation
{
    [self reloadSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:animation];
}

- (NSArray *)std_indexPathsWithRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section
{
    NSMutableArray *indexPaths = [NSMutableArray array];
    for (NSNumber *row in rows) {
        [indexPaths addObject:[NSIndexPath indexPathForItem:row.unsignedIntegerValue inSection:section]];
    }
    
    return indexPaths;
}

- (void)std_insertRows:(NSUInteger)rowsCount atEmptySection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    NSMutableArray *indexPaths = [NSMutableArray array];
    for (int i = 0; i < rowsCount; i++) {
        [indexPaths addObject:[NSIndexPath indexPathForItem:i inSection:section]];
    }
    [self insertRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)std_insertRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    NSArray *indexPaths = [self std_indexPathsWithRows:rows atSection:section];
    
    [self insertRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)std_insertRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self std_insertRows:@[@(row)] atSection:section withRowAnimation:animation];
}

- (void)std_insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation
{
    [self insertRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

- (void)std_reloadRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    NSArray *indexPaths = [self std_indexPathsWithRows:rows atSection:section];

    [self reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)std_reloadRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self std_reloadRows:@[@(row)] atSection:section withRowAnimation:animation];
}

- (void)std_reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation
{
    [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

- (void)std_deleteRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    NSArray *indexPaths = [self std_indexPathsWithRows:rows atSection:section];
    
    [self deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)std_deleteRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self std_deleteRows:@[@(row)] atSection:section withRowAnimation:animation];
}

- (void)std_deleteAllRowsAtSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    NSMutableArray *indexPaths = [NSMutableArray array];
    
    for (int i = 0; i < [self std_itemsCountAtSection:section]; i++) {
        
        [indexPaths addObject:[NSIndexPath indexPathForItem:i inSection:section]];
    }
    
    [self deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)std_deleteRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation
{
    [self deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

#pragma mark - register cell
- (void)std_registerCellNibClass:(Class)nibClass
{
    [[nibClass class] registerNibToTableView:self];
}

- (void)std_registerCellClass:(Class)cellClass
{
    [[cellClass class] registerClassToTableView:self];
}

- (void)std_registerHeaderFooterViewClass:(Class)registerClass
{
    [[registerClass class] registerClassToTableView:self];
}

- (void)std_registerHeaderFooterViewNibClass:(Class)registerNibClass
{
    [[registerNibClass class] registerNibToTableView:self];
}

@end


#pragma mark - ------------ Deprecated V0.1.0 ------------

@implementation UITableView (STDTableViewDeprecatedV010)

#pragma mark - setter and getter

- (UIViewController *)viewController
{
    return self.std_viewController;
}

- (void)setViewController:(UIViewController *)viewController
{
    self.std_viewController = viewController;
}

- (void)setCellDelegate:(id<STDTableViewCellDelegate>)cellDelegate
{
    self.std_cellDelegate = cellDelegate;
}

- (id<STDTableViewCellDelegate>)cellDelegate
{
    return self.std_cellDelegate;
}

- (void)setHeaderFooterViewDelegate:(id<STDTableViewHeaderFooterViewDelegate>)headerFooterViewDelegate
{
    self.std_headerFooterViewDelegate = headerFooterViewDelegate;
}

- (id<STDTableViewHeaderFooterViewDelegate>)headerFooterViewDelegate
{
    return self.std_headerFooterViewDelegate;
}

#pragma mark - constructor method.
+ (instancetype)tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style dataSource:(STDTableViewDataSource *)dataSource
{
    return [UITableView std_tableViewWithFrame:frame style:style dataSource:dataSource];
}

+ (instancetype)tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    return [UITableView std_tableViewWithFrame:frame style:style];
}

#pragma mark - tools
- (void)configDataSource:(STDTableViewDataSource *)dataSource
{
    [self std_configDataSource:dataSource];
}

- (void)creatDataSource
{
    [self std_creatDataSource];
}

- (void)cellSelectedCallbackWithIndexPath:(NSIndexPath *)indexPath
{
    [self std_cellSelectedCallbackWithIndexPath:indexPath];
}

- (void)cellDeselectedCallbackWithIndexPath:(NSIndexPath *)indexPath
{
    [self std_cellDeselectedCallbackWithIndexPath:indexPath];
}

- (STDTableViewItem *)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self std_itemAtIndexPath:indexPath];
}

- (STDTableViewItem *)itemAtSection:(NSUInteger)section row:(NSUInteger)row
{
    return [self std_itemAtSection:section row:row];
}

- (NSArray<STDTableViewItem *> *)itemsAtSection:(NSUInteger)section
{
    return [self std_itemsAtSection:section];
}

- (void)addItem:(id)item atSection:(NSUInteger)section
{
    [self std_addItem:item atSection:section];
}

- (void)addItems:(NSArray *)items atSection:(NSUInteger)section
{
    [self std_addItems:items atSection:section];
}

- (void)insertItem:(id)item atSection:(NSUInteger)section row:(NSUInteger)row
{
    [self std_insertItem:item atSection:section row:row];
}

- (void)insertItem:(id)item atIndexPath:(NSIndexPath *)indexPath
{
    [self std_insertItem:item atIndexPath:indexPath];
}

- (void)removeItem:(id)item atSection:(NSUInteger)section
{
    [self std_removeItem:item atSection:section];
}

- (void)removeItemAtSection:(NSUInteger)section row:(NSUInteger)row
{
    [self std_removeItemAtSection:section row:row];
}

- (void)removeItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self std_removeItemAtIndexPath:indexPath];
}

- (void)removeAllItemAtSection:(NSUInteger)section
{
    [self std_removeAllItemAtSection:section];
}

- (NSUInteger)itemsCountAtSection:(NSUInteger)section
{
    return [self std_itemsCountAtSection:section];
}

- (void)addSection:(STDTableViewSection *)section
{
    [self std_addSection:section];
}

- (void)addSections:(NSArray<STDTableViewSection *> *)sections
{
    [self std_addSections:sections];
}

- (void)insertSection:(STDTableViewSection *)section atIndex:(NSUInteger)index
{
    [self std_insertSection:section atIndex:index];
}

- (STDTableViewSection *)sectionAtIndex:(NSUInteger)index
{
    return [self std_sectionAtIndex:index];
}

- (void)removeSectionAtIndex:(NSUInteger)index
{
    [self std_removeSectionAtIndex:index];
}

- (void)removeAllSections
{
    [self std_removeAllSections];
}

- (NSUInteger)sectionsCount
{
    return [self std_sectionsCount];
}

#pragma mark - operation animation

- (void)insertSectionsAtEmptyTableView:(NSUInteger)sectionsCount withRowAnimation:(UITableViewRowAnimation)animation
{
    [self std_insertSectionsAtEmptyTableView:sectionsCount withRowAnimation:animation];
}

- (void)insertSection:(NSUInteger)sectionIndex withRowAnimation:(UITableViewRowAnimation)animation
{
    [self std_insertSection:sectionIndex withRowAnimation:animation];
}

- (void)deleteSection:(NSUInteger)sectionIndex withRowAnimation:(UITableViewRowAnimation)animation
{
    [self std_deleteSection:sectionIndex withRowAnimation:animation];
}

- (void)reloadSection:(NSUInteger)sectionIndex withRowAnimation:(UITableViewRowAnimation)animation
{
    [self std_reloadSection:sectionIndex withRowAnimation:animation];
}

- (void)insertRows:(NSUInteger)rowsCount atEmptySection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self std_insertRows:rowsCount atEmptySection:section withRowAnimation:animation];
}

- (void)insertRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self std_insertRows:rows atSection:section withRowAnimation:animation];
}

- (void)insertRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self std_insertRow:row atSection:section withRowAnimation:animation];
}

- (void)insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation
{
    [self std_insertRowAtIndexPath:indexPath withRowAnimation:animation];
}

- (void)reloadRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self std_reloadRows:rows atSection:section withRowAnimation:animation];
}

- (void)reloadRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self std_reloadRow:row atSection:section withRowAnimation:animation];
}

- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation
{
    [self std_reloadRowAtIndexPath:indexPath withRowAnimation:animation];
}

- (void)deleteRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self std_deleteRows:rows atSection:section withRowAnimation:animation];
}

- (void)deleteRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self std_deleteRow:row atSection:section withRowAnimation:animation];
}

- (void)deleteAllRowsAtSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self std_deleteAllRowsAtSection:section withRowAnimation:animation];
}

- (void)deleteRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation
{
    [self std_deleteRowAtIndexPath:indexPath withRowAnimation:animation];
}

#pragma mark - register cell
- (void)registerCellNibClass:(Class)nibClass
{
    [self std_registerCellNibClass:nibClass];
}

- (void)registerCellClass:(Class)cellClass
{
    [self std_registerCellClass:cellClass];
}

- (void)registerHeaderFooterViewClass:(Class)registerClass
{
    [self std_registerHeaderFooterViewClass:registerClass];
}

- (void)registerHeaderFooterViewNibClass:(Class)registerNibClass
{
    [self std_registerHeaderFooterViewNibClass:registerNibClass];
}

@end
