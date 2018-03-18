//
//  STDTableViewConfig.m
//  STDTableView
//
//  Created by XuQibin on 2018/3/17.
//  Copyright © 2018年 Standards. All rights reserved.
//

#import "STDTableViewConfig.h"

@implementation STDTableViewConfig

+ (instancetype)sharedConfig
{
    static STDTableViewConfig *config = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[STDTableViewConfig alloc] init];
    });
    
    return config;
}

@end
