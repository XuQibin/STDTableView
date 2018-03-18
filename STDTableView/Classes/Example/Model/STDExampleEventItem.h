//
//  STDExampleEventItem.h
//  STDTableView
//
//  Created by XuQibin on 2018/3/18.
//  Copyright © 2018年 Standards. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STDExampleEventItem : NSObject

@property (copy, nonatomic) NSString *title;

@property (copy, nonatomic) NSString *inputText;

@property (copy, nonatomic) NSString *placeholder;

+ (instancetype)itemWithTitle:(NSString *)title placeholder:(NSString *)placeholder;

@end
