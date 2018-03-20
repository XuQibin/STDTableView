# STDTableView

[![Version](https://img.shields.io/cocoapods/v/STDTableView.svg?style=flat)](http://cocoapods.org/pods/STDTableView)
[![License](https://img.shields.io/cocoapods/l/STDTableView.svg?style=flat)](http://cocoapods.org/pods/STDTableView)
[![Platform](https://img.shields.io/cocoapods/p/STDTableView.svg?style=flat)](http://cocoapods.org/pods/STDTableView)

# STDTableView 是什么
STDTableView 是基于 UITableView 的封装，实现了一套 High Level 的 API，提供了更简洁的构建及使用方法。

# STDTableView 怎么使用
* 初始化

``` objc
// 快速构建(使用本方法构建的tableView内部已经初始化了DataSoure)
UITableView *tableView = [UITableView std_tableViewWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kNavigationBarMaxY) style:UITableViewStylePlain];
    
tableView.delegate = self;
tableView.rowHeight = 55;
tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
tableView.tableFooterView = [[UIView alloc]init];

// viewController传递，可在cell中使用
//tableView.std_viewController = self;

// 注册Cell, nib构建的Cell使用以下方法：
[tableView std_registerCellNibClass:[STDExampleListCell class]];
    
// 注册Cell, 代码构建的Cell使用以下方法：
//[tableView std_registerCellClass:[STDExampleListCell class]];
    
// 注：如果是使用系统方法或者nib构建tableView，则需要调用以下方法创建内部数据源：
//[tableView std_creatDataSource];

// 新建section并添加到tableview数据源中
STDTableViewSection *sectionData = [[STDTableViewSection alloc] initWithCellClass:[STDExampleListCell class]];
[tableView std_addSection:sectionData];

...
    
```

* 添加数据并更新

``` objc
NSArray *itemList = @[[STDExampleListItem itemWithTitle:@"1. 头部点击缩放" subTitle:nil object:[STDExampleHeaderViewController class]],
                          [STDExampleListItem itemWithTitle:@"2. Cell事件响应" subTitle:nil object:[STDExampleCellEventViewController class]],
                          [STDExampleListItem itemWithTitle:@"3. 混合Cell" subTitle:nil object:[STDExampleMixCellsViewController class]]];
    
//添加数据到指定section中
[self.tableView std_addItems:itemList atSection:0];
    
//更新数据
[self.tableView std_insertRows:itemList.count atEmptySection:0 withRowAnimation:UITableViewRowAnimationFade];

...

```

* 如果需要在cell中响应选中操作

``` objc
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    [tableView std_cellSelectedCallbackWithIndexPath:indexPath];
}

...

```

* 完成

* 更多使用方法请查看demo, 持续更新中...


# STDTableView 展示图
![](Resource/01.gif)