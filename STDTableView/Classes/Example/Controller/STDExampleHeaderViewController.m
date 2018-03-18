//
//  STDExampleHeaderViewController.m
//  STDTableView
//
//  Created by XuQibin on 2018/3/18.
//  Copyright © 2018年 Standards. All rights reserved.
//

#import "STDExampleHeaderViewController.h"

#import "STDExampleHeaderView.h"
#import "STDExampleHeaderCell.h"


@interface STDExampleHeaderViewController ()< STDTableViewHeaderFooterViewDelegate>

@end

@implementation STDExampleHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - setup

- (void)configTableView:(UITableView *)tableView
{
    tableView.rowHeight = 55;
    
    [tableView registerCellClass:[STDExampleHeaderCell class]];
    [tableView registerHeaderFooterViewClass:[STDExampleHeaderView class]];
    
    tableView.headerFooterViewDelegate = self;
}

- (void)setupExampleContent
{
    for (NSUInteger section = 0; section < 5; section++) {
        NSMutableArray *items = [NSMutableArray array];
        
        for (NSUInteger i = 0; i < 5; i++) {
            [items addObject:[NSString stringWithFormat:@"Row-%zd%zd",section,i]];
        }
        
        STDTableViewSection *sectionData = [[STDTableViewSection alloc] initWithItems:items cellClass:[STDExampleHeaderCell class] headerClass:[STDExampleHeaderView class] headerData:[NSString stringWithFormat:@"Section-%zd", section] headerHeight:44];
        sectionData.expend = NO;
        [self.tableView addSection:sectionData];
    }
    
    [self.tableView insertSectionsAtEmptyTableView:5 withRowAnimation:UITableViewRowAnimationFade];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self tableViewHeaderFooterView:(STDExampleHeaderView *)[self.tableView headerViewForSection:0] event:nil];
    });
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    [tableView cellSelectedCallbackWithIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [STDExampleHeaderView heightForHeaderInTableView:tableView section:section];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [STDExampleHeaderView headerViewWithTableView:tableView atSection:section];
}

#pragma mark -  STDTableViewHeaderFooterViewDelegate
- (void)tableViewHeaderFooterView:(STDExampleHeaderView *)headerFooterView event:(id)event
{
    NSInteger section = headerFooterView.section;
    STDTableViewSection *sectionData = [self.tableView sectionAtIndex:section];
    
    if (sectionData.expend == YES) {
        // 缩回去
        sectionData.expend = NO;
        
        [self.tableView deleteAllRowsAtSection:section withRowAnimation: UITableViewRowAnimationFade];
    } else {
        
        // 显示出来
        sectionData.expend = YES;
        
        [self.tableView insertRows:sectionData.itemsCount atEmptySection:section withRowAnimation:UITableViewRowAnimationFade];
    }
    
    [headerFooterView animationExpand:sectionData.expend];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
