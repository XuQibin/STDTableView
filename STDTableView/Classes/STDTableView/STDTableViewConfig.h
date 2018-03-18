//
//  STDTableViewConfig.h
//  STDTableView
//
//  Created by XuQibin on 2018/3/17.
//  Copyright © 2018年 Standards. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol STDTableViewCellDelegate, STDTableViewHeaderFooterViewDelegate;

@interface STDTableViewConfig : NSObject

#pragma mark - propeties

@property (nonatomic, weak) UIViewController *viewController;
@property (nonatomic, weak) id<STDTableViewCellDelegate> cellDelegate;
@property (nonatomic, weak) id<STDTableViewHeaderFooterViewDelegate> headerFooterViewDelegate;

#pragma mark - constructor

+ (instancetype)sharedConfig;

@end
