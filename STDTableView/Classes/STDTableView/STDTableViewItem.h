//
//  STDTableViewItem.h
//  STDTableView
//
//  Created by XuQibin on 2017/6/5.
//  Copyright © 2017年 Standards. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface STDTableViewItem : NSObject

#pragma mark - propeties

@property (nonatomic, strong) id data;

@property (nonatomic, copy) NSString *cellReuseIdentifier;

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign) CGFloat cellWidth;
@property (nonatomic, assign) NSInteger cellType;

#pragma mark - constructor

+ (STDTableViewItem *)itemWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                             data:(id)data
                                       cellHeight:(CGFloat)cellHeight
                                        cellWidth:(CGFloat)cellWidth
                                         cellType:(NSInteger)cellType;

+ (STDTableViewItem *)itemWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                             data:(id)data
                                       cellHeight:(CGFloat)cellHeight
                                         cellType:(NSInteger)cellType;

+ (STDTableViewItem *)itemWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                             data:(id)data
                                         cellType:(NSInteger)cellType;

+ (STDTableViewItem *)itemWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                             data:(id)data;

@end
