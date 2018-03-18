//
//  STDExampleBaseViewController.h
//  STDTableView
//
//  Created by XuQibin on 2018/3/18.
//  Copyright © 2018年 Standards. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UITableView+STDTableView.h"

@interface STDExampleBaseViewController : UIViewController<UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

- (void)configTableView:(UITableView *)tableView;
- (void)setupExampleContent;

@end
