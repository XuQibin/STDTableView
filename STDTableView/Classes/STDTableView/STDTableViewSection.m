//
//  STDTableViewSection.m
//  STDTableView
//
//  Created by XuQibin on 2017/6/5.
//  Copyright © 2017年 Standards. All rights reserved.
//

#import "STDTableViewSection.h"
#import "STDTableViewItem.h"
#import "STDTableViewCell.h"
#import "STDTableViewHeaderFooterView.h"

@interface STDTableViewSection() {
    Class _cellClass;
    Class _headerViewClass;
    Class _footerViewClass;
}

@property (nonatomic, strong) NSMutableArray<STDTableViewItem *> *items;

@end


@implementation STDTableViewSection

#pragma mark - initialization

- (instancetype)initWithItems:(NSArray *)items cellClass:(Class)cellClass headerClass:(Class)headerClass footerClass:(Class)footerClass headerData:(id)headerData footerData:(id)footerData headerHeight:(CGFloat)headerHeight footerHeight:(CGFloat)footerHeight
{
    if (self = [super init]) {
        
        _expend = YES;
        
        _sectionHeaderHeight = headerHeight;
        _sectionFooterHeight = footerHeight;
        
        if (cellClass) {
            NSAssert([[cellClass new] isKindOfClass:[STDTableViewCell class]], @"invalid cell class, it must be a subclass of STDTableViewCell");
            
            if ([[cellClass new] isKindOfClass:[STDTableViewCell class]]) {
                _cellClass = cellClass;
            }
        }
        
        if (headerClass) {
            NSAssert([[headerClass new] isKindOfClass:[STDTableViewHeaderFooterView class]], @"invalid header view class, it must be a subclass of STDTableViewHeaderFooterView");
            
            if ([[headerClass new] isKindOfClass:[STDTableViewHeaderFooterView class]]) {
                _headerViewClass = headerClass;
            }
        }
        
        if (footerClass) {
            NSAssert([[footerClass new] isKindOfClass:[STDTableViewHeaderFooterView class]], @"invalid footer view class, it must be a subclass of STDTableViewHeaderFooterView");
            
            if ([[footerClass new] isKindOfClass:[STDTableViewHeaderFooterView class]]) {
                _footerViewClass = footerClass;
            }
        }
        
        _sectionHeaderData = headerData;
        _sectionFooterData = footerData;
        
        if (items) {
            [self addItems:items];
        }
    }
    
    return self;
}

- (instancetype)initWithItems:(NSArray *)items cellClass:(Class)cellClass headerClass:(Class)headerClass headerData:(id)headerData headerHeight:(CGFloat)headerHeight
{
    return [self initWithItems:items cellClass:cellClass headerClass:headerClass footerClass:nil headerData:headerData footerData:nil headerHeight:headerHeight footerHeight:0];
}

- (instancetype)initWithItems:(NSArray *)items cellClass:(Class)cellClass footerClass:(Class)footerClass footerData:(id)footerData  footerHeight:(CGFloat)footerHeight
{
    return [self initWithItems:items cellClass:cellClass headerClass:nil footerClass:footerClass headerData:nil footerData:footerData headerHeight:0 footerHeight:footerHeight];
}

- (instancetype)initWithItems:(NSArray *)items cellClass:(Class)cellClass
{
    return [self initWithItems:items cellClass:cellClass headerClass:nil footerClass:nil headerData:nil footerData:nil headerHeight:0 footerHeight:0];
}

- (instancetype)initWithCellClass:(Class)cellClass
{
    return [self initWithItems:nil cellClass:cellClass headerClass:nil footerClass:nil headerData:nil footerData:nil headerHeight:0 footerHeight:0];
}

#pragma mark - setter and getter
- (NSMutableArray<STDTableViewItem *> *)items
{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    
    return _items;
}

- (NSString *)headerViewIdentifier
{
    if (!_headerViewIdentifier) {
        if (_headerViewClass) {
            _headerViewIdentifier = NSStringFromClass(_headerViewClass);
        }
    }
    
    return _headerViewIdentifier;
}

- (NSString *)footerViewIdentifier
{
    if (!_footerViewIdentifier) {
        if (_footerViewClass) {
            _footerViewIdentifier = NSStringFromClass(_footerViewClass);
        }
    }
    
    return _footerViewIdentifier;
}

#pragma mark - tools

- (void)addItem:(id)item
{
    NSAssert(item, @"item can not be nil");

    if (!item) {
        return;
    }
    
    if ([item isKindOfClass:[STDTableViewItem class]]) {
        [self.items addObject:item];
    } else if (_cellClass) {
        [self.items addObject:[_cellClass cellItemWithData:item]];
    }
}

- (void)addItems:(NSArray *)items
{
    NSAssert(items, @"items can not be nil");

    if (!items) {
        return;
    }
    
    NSMutableArray<STDTableViewItem *> *dataAdapterItems = [NSMutableArray array];
    
    for (id item in items) {
        if ([item isKindOfClass:[STDTableViewItem class]]) {
            [dataAdapterItems addObject:item];
        } else if (_cellClass) {
            [dataAdapterItems addObject:[_cellClass cellItemWithData:item]];
        }
    }
    
    [self.items addObjectsFromArray:dataAdapterItems];
}

- (void)removeAllItems
{
    [self.items removeAllObjects];
}

- (void)insertItem:(id)item atIndex:(NSInteger)index
{
    NSAssert(item && self.items.count >= index, @"error item:%@ index:%zd", item, index);

    if (!item || self.items.count < index) {
        return;
    }
    
    if ([item isKindOfClass:[STDTableViewItem class]]) {
        [self.items insertObject:item atIndex:index];
    } else if (_cellClass) {
        [self.items insertObject:[_cellClass cellItemWithData:item] atIndex:index];
    }
}

- (void)removeItemAtIndex:(NSUInteger)index
{
    NSAssert(self.items.count > index, @"error item index:%zd", index);

    if (self.items.count <= index) {
        return;
    }
    
    [self.items removeObjectAtIndex:index];
}

- (void)removeItem:(id)item
{
    NSAssert(item, @"item can not be nil");
    
    if (!item) {
        return;
    }
    
    if ([item isKindOfClass:[STDTableViewItem class]]) {
        [self.items removeObject:item];
    } else {
        [self.items enumerateObjectsUsingBlock:^(STDTableViewItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj.data isEqual:item]) {
                [self.items removeObject:obj];
                *stop = YES;
            }
        }];
    }
}

- (STDTableViewItem *)itemAtIndex:(NSUInteger)index
{
    NSAssert(self.items.count > index, @"item index '%zd' out of range '0 ~ %zd'", index, self.items.count - 1);

    if (self.items.count <= index) {
        return nil;
    }
    
    return self.items[index];
}

- (NSArray<STDTableViewItem *> *)allItems
{
    return self.items;
}

- (NSUInteger)itemsCount
{
    return self.items.count;
}

@end
