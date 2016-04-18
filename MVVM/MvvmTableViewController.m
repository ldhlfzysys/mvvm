//
//  MvvmTableViewController.m
//  MVVM
//
//  Created by liudonghuan on 16/4/18.
//  Copyright © 2016年 Dwight. All rights reserved.
//

#import "MvvmTableViewController.h"
#import "MvvmTableViewCell.h"
#import "MvvmModel.h"
#import "MvvmTableViewCell.h"

@interface MvvmTableViewController ()
@property (nonatomic,strong)NSMutableArray *datas;
@end

@implementation MvvmTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _datas = [[NSMutableArray alloc]init];
    [self loadDataFromArray:[[MockNetWorkManager shareManager] loadData]];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.title = @"MVC";
    [self.tableView reloadData];
}

- (void)loadDataFromArray:(NSArray *)arr
{
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *name_ = [obj objectForKey:@"name"];
        NSString *content_ = [obj objectForKey:@"content"];
        MvvmModel *model = [[MvvmModel alloc]init];
        model.name = name_;
        model.content = content_;
        [_datas addObject:model];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MvvmTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mCell"];
    if (!cell) {
        cell = [[MvvmTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mCell"];
    }
    MvvmModel *model = [_datas objectAtIndex:indexPath.row];
    cell.nameLabel.text = model.name;
    cell.contentLabel.text = model.content;
    [cell.contentLabel sizeToFit];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 10 + 20 + 5 + [self cellHeightFromData:_datas IndexPath:indexPath] + 10;
    return height;
}

//高度计算，展现上属于视图，但也是Model自身的一种属性，放到哪？
- (CGFloat)cellHeightFromData:(NSArray *)data IndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = [data objectAtIndex:indexPath.row];
    NSString *content = [dict objectForKey:@"content"];
    UIFont *contentFont = [UIFont systemFontOfSize:15];
    CGRect rect = [content boundingRectWithSize:CGSizeMake(self.tableView.frame.size.width - 20, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:contentFont} context:nil];
    return rect.size.height;
}

@end
