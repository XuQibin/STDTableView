//
//  STDMainItem.m
//  STDTableViewDemo
//
//  Created by XuQibin on 2017/10/20.
//  Copyright © 2017年 Standards. All rights reserved.
//

#import "STDExampleListItem.h"

@implementation STDExampleListItem

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle  object:(id)object
{
    STDExampleListItem *item  = [[[self class] alloc] init];
    item.title   = title;
    item.subTitle = subTitle ? : NSStringFromClass(object);
    item.object = object;
    
    return item;
}

@end
