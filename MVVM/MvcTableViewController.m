//
//  MvcTableViewController.m
//  MVVM
//
//  Created by liudonghuan on 16/4/18.
//  Copyright © 2016年 Dwight. All rights reserved.
//

#import "MvcTableViewController.h"
#import "MvcModel.h"
#import "MvcTableViewCell.h"

@interface MvcTableViewController ()
@property (nonatomic,strong)NSMutableArray *datas;
@end

@implementation MvcTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _datas = [[NSMutableArray alloc]init];
    [self loadDataFromArray:[[MockNetWorkManager shareManager] loadData]];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.title = @"MVC";
    [self.tableView reloadData];
}

//数据的耦合
- (void)loadDataFromArray:(NSArray *)arr
{
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *name_ = [obj objectForKey:@"name"];
        NSString *content_ = [obj objectForKey:@"content"];
        MvcModel *model = [[MvcModel alloc]init];
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
    MvcTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mCell"];
    if (!cell) {
        cell = [[MvcTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mCell"];
    }
    //数据与页面的耦合
    MvcModel *model = [_datas objectAtIndex:indexPath.row];
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

- (CGFloat)cellHeightFromData:(NSArray *)data IndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = [data objectAtIndex:indexPath.row];
    NSString *content = [dict objectForKey:@"content"];
    UIFont *contentFont = [UIFont systemFontOfSize:15];
    CGRect rect = [content boundingRectWithSize:CGSizeMake(self.tableView.frame.size.width - 20, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:contentFont} context:nil];
    return rect.size.height;
}
@end
