//
//  STDMainItem.h
//  STDTableViewDemo
//
//  Created by XuQibin on 2017/10/20.
//  Copyright © 2017年 Standards. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STDExampleListItem : NSObject

@property (copy, nonatomic) NSString *title;

@property (copy, nonatomic) NSString *subTitle;

@property (strong, nonatomic) id object;

@property (assign, nonatomic) NSInteger index;

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle  object:(id)object;

@end
