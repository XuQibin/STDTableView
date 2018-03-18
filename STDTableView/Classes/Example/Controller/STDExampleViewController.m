//
//  STDExampleViewController.m
//  STDTableView
//
//  Created by XuQibin on 2018/3/17.
//  Copyright © 2018年 Standards. All rights reserved.
//

#import "STDExampleViewController.h"

#import "STDExampleListCell.h"
#import "STDExampleListItem.h"

#import "STDExampleHeaderViewController.h"
#import "STDExampleCellEventViewController.h"
#import "STDExampleMixCellsViewController.h"

@interface STDExampleViewController ()

@end

@implementation STDExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"STDTableView";
}

#pragma mark - setup

- (void)configTableView:(UITableView *)tableView
{
    tableView.rowHeight = 55;

    [tableView registerCellNibClass:[STDExampleListCell class]];
    
    [tableView creatDataSource];
    
    STDTableViewSection *sectionData = [[STDTableViewSection alloc] initWithCellClass:[STDExampleListCell class]];
    [tableView addSection:sectionData];
}

- (void)setupExampleContent
{
    NSArray *itemList = @[[STDExampleListItem itemWithTitle:@"1. 头部点击缩放" subTitle:nil object:[STDExampleHeaderViewController class]],
                          [STDExampleListItem itemWithTitle:@"2. Cell事件响应" subTitle:nil object:[STDExampleCellEventViewController class]],
                          [STDExampleListItem itemWithTitle:@"3. 混合Cell" subTitle:nil object:[STDExampleMixCellsViewController class]]];
    
    [self.tableView addItems:itemList atSection:0];
    
    [self.tableView insertRows:itemList.count atEmptySection:0 withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    [tableView cellSelectedCallbackWithIndexPath:indexPath];
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
