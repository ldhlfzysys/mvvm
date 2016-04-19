//
//  BaseTableViewController.m
//  MVVM
//
//  Created by liudonghuan on 16/4/19.
//  Copyright © 2016年 Dwight. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.title = @"MVC";
    [self.tableView reloadData];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"加载" style:UIBarButtonItemStyleDone target:self action:@selector(loadMore)];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)loadMore{
}


@end
