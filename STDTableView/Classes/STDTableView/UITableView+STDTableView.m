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

- (UIViewController *)viewController
{
    return [STDTableViewConfig sharedConfig].viewController;
}

- (void)setViewController:(UIViewController *)viewController
{
    [STDTableViewConfig sharedConfig].viewController = viewController;
}

- (void)setCellDelegate:(id<STDTableViewCellDelegate>)cellDelegate
{
    [STDTableViewConfig sharedConfig].cellDelegate = cellDelegate;
}

- (id<STDTableViewCellDelegate>)cellDelegate
{
    return [STDTableViewConfig sharedConfig].cellDelegate;
}

- (void)setHeaderFooterViewDelegate:(id<STDTableViewHeaderFooterViewDelegate>)headerFooterViewDelegate
{
    [STDTableViewConfig sharedConfig].headerFooterViewDelegate = headerFooterViewDelegate;
}

- (id<STDTableViewHeaderFooterViewDelegate>)headerFooterViewDelegate
{
    return [STDTableViewConfig sharedConfig].headerFooterViewDelegate;
}

#pragma mark - constructor method.
+ (instancetype)tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style dataSource:(STDTableViewDataSource *)dataSource
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
    
    if (dataSource) {
        [tableView configDataSource:dataSource];
    } else {
        [tableView creatDataSource];
    }
    
    return tableView;
}

+ (instancetype)tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    return [UITableView tableViewWithFrame:frame style:style dataSource:nil];
}

#pragma mark - tools
- (void)configDataSource:(STDTableViewDataSource *)dataSource
{
    self.std_dataSource = dataSource;
}

- (void)creatDataSource
{
    STDTableViewDataSource *dataSource = [[STDTableViewDataSource alloc] init];
    
    [self configDataSource:dataSource];
}

- (void)cellSelectedCallbackWithIndexPath:(NSIndexPath *)indexPath
{
    [(STDTableViewCell *)[self cellForRowAtIndexPath:indexPath] selectedEvent];
}

- (void)cellDeselectedCallbackWithIndexPath:(NSIndexPath *)indexPath
{
    [(STDTableViewCell *)[self cellForRowAtIndexPath:indexPath] deselectedEvent];
}

- (STDTableViewItem *)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.std_dataSource itemAtIndexPath:indexPath];
}

- (STDTableViewItem *)itemAtSection:(NSUInteger)section row:(NSUInteger)row
{
    return [self.std_dataSource itemAtSection:section row:row];
}

- (NSArray<STDTableViewItem *> *)itemsAtSection:(NSUInteger)section
{
    return [self.std_dataSource itemsAtSection:section];
}

- (void)addItem:(id)item atSection:(NSUInteger)section
{
    [self.std_dataSource addItem:item atSection:section];
}

- (void)addItems:(NSArray *)items atSection:(NSUInteger)section
{
    [self.std_dataSource addItems:items atSection:section];
}

- (void)insertItem:(id)item atSection:(NSUInteger)section row:(NSUInteger)row
{
    [self.std_dataSource insertItem:item atSection:section row:row];
}

- (void)insertItem:(id)item atIndexPath:(NSIndexPath *)indexPath
{
    [self.std_dataSource insertItem:item atIndexPath:indexPath];
}

- (void)removeItem:(id)item atSection:(NSUInteger)section
{
    [self.std_dataSource removeItem:item atSection:section];
}

- (void)removeItemAtSection:(NSUInteger)section row:(NSUInteger)row
{
    [self.std_dataSource removeItemAtSection:section row:row];
}

- (void)removeItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.std_dataSource removeItemAtIndexPath:indexPath];
}

- (void)removeAllItemAtSection:(NSUInteger)section
{
    [self.std_dataSource removeAllItemAtSection:section];
}

- (NSUInteger)itemsCountAtSection:(NSUInteger)section
{
    return [self.std_dataSource itemsCountAtSection:section];
}

- (void)addSection:(STDTableViewSection *)section
{
    [self.std_dataSource addSection:section];
}

- (void)addSections:(NSArray<STDTableViewSection *> *)sections
{
    [self.std_dataSource addSections:sections];
}

- (void)insertSection:(STDTableViewSection *)section atIndex:(NSUInteger)index
{
    [self.std_dataSource insertSection:section atIndex:index];
}

- (STDTableViewSection *)sectionAtIndex:(NSUInteger)index
{
    return [self.std_dataSource sectionAtIndex:index];
}

- (void)removeSectionAtIndex:(NSUInteger)index
{
    [self.std_dataSource removeSectionAtIndex:index];
}

- (void)removeAllSections
{
    [self.std_dataSource removeAllSections];
}

- (NSUInteger)sectionsCount
{
    return [self.std_dataSource sectionsCount];
}

#pragma mark - operation animation

- (void)insertSectionsAtEmptyTableView:(NSUInteger)sectionsCount withRowAnimation:(UITableViewRowAnimation)animation
{
    [self insertSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, sectionsCount)] withRowAnimation:animation];
}

- (void)insertSection:(NSUInteger)sectionIndex withRowAnimation:(UITableViewRowAnimation)animation
{
    [self insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:animation];
}

- (void)deleteSection:(NSUInteger)sectionIndex withRowAnimation:(UITableViewRowAnimation)animation
{
    [self deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:animation];
}

- (void)reloadSection:(NSUInteger)sectionIndex withRowAnimation:(UITableViewRowAnimation)animation
{
    [self reloadSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:animation];
}

- (NSArray *)indexPathsWithRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section
{
    NSMutableArray *indexPaths = [NSMutableArray array];
    for (NSNumber *row in rows) {
        [indexPaths addObject:[NSIndexPath indexPathForItem:row.unsignedIntegerValue inSection:section]];
    }
    
    return indexPaths;
}

- (void)insertRows:(NSUInteger)rowsCount atEmptySection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    NSMutableArray *indexPaths = [NSMutableArray array];
    for (int i = 0; i < rowsCount; i++) {
        [indexPaths addObject:[NSIndexPath indexPathForItem:i inSection:section]];
    }
    [self insertRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)insertRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    NSArray *indexPaths = [self indexPathsWithRows:rows atSection:section];
    
    [self insertRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)insertRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self insertRows:@[@(row)] atSection:section withRowAnimation:animation];
}

- (void)insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation
{
    [self insertRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

- (void)reloadRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    NSArray *indexPaths = [self indexPathsWithRows:rows atSection:section];

    [self reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)reloadRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self reloadRows:@[@(row)] atSection:section withRowAnimation:animation];
}

- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation
{
    [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

- (void)deleteRows:(NSArray<NSNumber *> *)rows atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    NSArray *indexPaths = [self indexPathsWithRows:rows atSection:section];
    
    [self deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)deleteRow:(NSUInteger)row atSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    [self deleteRows:@[@(row)] atSection:section withRowAnimation:animation];
}

- (void)deleteAllRowsAtSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    NSMutableArray *indexPaths = [NSMutableArray array];
    
    for (int i = 0; i < [self itemsCountAtSection:section]; i++) {
        
        [indexPaths addObject:[NSIndexPath indexPathForItem:i inSection:section]];
    }
    
    [self deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)deleteRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation
{
    [self deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

#pragma mark - register cell
- (void)registerCellNibClass:(Class)nibClass
{
    [[nibClass class] registerNibToTableView:self];
}

- (void)registerCellClass:(Class)cellClass
{
    [[cellClass class] registerClassToTableView:self];
}

- (void)registerHeaderFooterViewClass:(Class)registerClass
{
    [[registerClass class] registerClassToTableView:self];
}

- (void)registerHeaderFooterViewNibClass:(Class)registerNibClass
{
    [[registerNibClass class] registerNibToTableView:self];
}

@end
