//
//  STDTableViewItem.m
//  STDTableView
//
//  Created by XuQibin on 2017/6/5.
//  Copyright © 2017年 Standards. All rights reserved.
//

#import "STDTableViewItem.h"

@implementation STDTableViewItem

#pragma mark - constructor method.

+ (STDTableViewItem *)itemWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers data:(id)data
                                                 cellHeight:(CGFloat)cellHeight cellWidth:(CGFloat)cellWidth
                                                   cellType:(NSInteger)cellType {
    
    STDTableViewItem *item    = [[[self class] alloc] init];
    item.cellReuseIdentifier = cellReuseIdentifiers;
    item.data                = data;
    item.cellHeight          = cellHeight;
    item.cellWidth           = cellWidth;
    item.cellType            = cellType;
    
    return item;
}

+ (STDTableViewItem *)itemWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers data:(id)data
                                       cellHeight:(CGFloat)cellHeight cellType:(NSInteger)cellType {
    return [[self class] itemWithCellReuseIdentifier:cellReuseIdentifiers data:data cellHeight:cellHeight cellWidth:0 cellType:cellType];
}

+ (STDTableViewItem *)itemWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                             data:(id)data
                                         cellType:(NSInteger)cellType
{
    return [[self class] itemWithCellReuseIdentifier:cellReuseIdentifiers data:data cellHeight:0 cellWidth:0 cellType:cellType];
}

+ (STDTableViewItem *)itemWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                             data:(id)data
{
    return [[self class] itemWithCellReuseIdentifier:cellReuseIdentifiers data:data cellHeight:0 cellWidth:0 cellType:0];
}

@end
