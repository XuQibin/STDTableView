//
//  STDTableViewDataSource.h
//  STDTableView
//
//  Created by XuQibin on 2017/6/5.
//  Copyright © 2017年 Standards. All rights reserved.
//
#import <UIKit/UIKit.h>

@class STDTableViewSection,STDTableViewItem;

@interface STDTableViewDataSource : NSObject<UITableViewDataSource>

#pragma mark - useful method

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
- (NSInteger)itemsCountAtSection:(NSUInteger)section;

- (NSArray<STDTableViewSection *> *)allSections;
- (STDTableViewSection *)sectionAtIndex:(NSUInteger)index;
- (void)addSection:(STDTableViewSection *)section;
- (void)addSections:(NSArray<STDTableViewSection *> *)sections;
- (void)insertSection:(STDTableViewSection *)section atIndex:(NSUInteger)index;
- (void)removeSectionAtIndex:(NSUInteger)section;
- (void)removeAllSections;
- (NSUInteger)sectionsCount;

@end
