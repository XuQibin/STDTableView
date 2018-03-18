//
//  STDExampleEventCell.h
//  STDTableView
//
//  Created by XuQibin on 2018/3/18.
//  Copyright © 2018年 Standards. All rights reserved.
//

#import "STDTableViewCell.h"

typedef NS_ENUM(NSUInteger, STDEditEvent) {
    STDEditEventInitialize = 0,
    STDEditEventInputChange,
    STDEditEventInputFinish,
};

@interface STDExampleEventCell : STDTableViewCell

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end
