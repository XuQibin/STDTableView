//
//  STDExampleEventItem.m
//  STDTableView
//
//  Created by XuQibin on 2018/3/18.
//  Copyright © 2018年 Standards. All rights reserved.
//

#import "STDExampleEventItem.h"

@implementation STDExampleEventItem

+ (instancetype)itemWithTitle:(NSString *)title placeholder:(NSString *)placeholder
{
    STDExampleEventItem *item  = [[[self class] alloc] init];
    item.title   = title;
    item.placeholder = placeholder;
    
    return item;
}

@end
