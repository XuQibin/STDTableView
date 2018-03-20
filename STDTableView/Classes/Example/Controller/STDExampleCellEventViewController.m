//
//  STDExampleCellEventViewController.m
//  STDTableView
//
//  Created by XuQibin on 2018/3/18.
//  Copyright © 2018年 Standards. All rights reserved.
//

#import "STDExampleCellEventViewController.h"

#import "STDExampleEventCell.h"
#import "STDExampleEventItem.h"

@interface STDExampleCellEventViewController ()< STDTableViewCellDelegate>

@end

@implementation STDExampleCellEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - setup

- (void)configTableView:(UITableView *)tableView
{
    tableView.rowHeight = 55;
    
    tableView.backgroundColor = kTableViewBackgroundColor;
    
    tableView.std_cellDelegate = self;

    [tableView std_registerCellNibClass:[STDExampleEventCell class]];
    
    STDTableViewSection *sectionData = [[STDTableViewSection alloc] initWithCellClass:[STDExampleEventCell class]];
    [self.tableView std_addSection:sectionData];
}

- (void)setupExampleContent
{
    NSArray *itemList = @[[STDExampleEventItem itemWithTitle:@"姓名" placeholder:@"请输入姓名"],
                          [STDExampleEventItem itemWithTitle:@"职位" placeholder:@"请输入职位"]];
    
    [self.tableView std_addItems:itemList atSection:0];
    
    [self.tableView std_insertRows:itemList.count atEmptySection:0 withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    [tableView std_cellSelectedCallbackWithIndexPath:indexPath];
}

#pragma mark - STDTableViewCellDelegate

- (void)tableViewCell:(STDTableViewCell *)cell event:(id)event
{
    STDExampleEventItem *editItem = cell.data;

    STDEditEvent editEvent = ((NSNumber *)event).unsignedIntegerValue;

    switch (editEvent) {
        case STDEditEventInitialize:
            
            NSLog(@"STDEditEventInitialize(%@) - %@",editItem.title, editItem.inputText);

            break;
            
        case STDEditEventInputChange:
            
            NSLog(@"STDEditEventInputChange(%@) - %@",editItem.title, editItem.inputText);

            break;
            
        case STDEditEventInputFinish:
            
            NSLog(@"STDEditEventInputFinish(%@) - %@",editItem.title, editItem.inputText);
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:editItem.title message:editItem.inputText preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:cancelAction];
            
            [self presentViewController:alertController animated:YES completion:nil];

            break;
    }
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
