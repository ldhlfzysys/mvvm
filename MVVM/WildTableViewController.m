//
//  WildTableViewController.m
//  MVVM
//
//  Created by liudonghuan on 16/4/18.
//  Copyright © 2016年 Dwight. All rights reserved.
//

#import "WildTableViewController.h"

@interface WildTableViewController ()
@property (nonatomic,strong)NSMutableArray *datas;
@end

@implementation WildTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _datas = [[NSMutableArray alloc]init];
    [_datas addObjectsFromArray:[[MockNetWorkManager shareManager] loadData]];
    
    [self.tableView reloadData];
}

- (void)loadMore{
    [_datas addObjectsFromArray:[[MockNetWorkManager shareManager] loadMoreData]];
    [self.tableView reloadData];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    /*
     由于nameLabel等都是重新创建的，在cell重用的时候，需要移除所有子View
     */
    [cell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //构建View
    NSDictionary *dict = [_datas objectAtIndex:indexPath.row];
    NSString *name_ = [dict objectForKey:@"name"];
    NSString *content_ = [dict objectForKey:@"content"];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH - 20, 20)];
    nameLabel.font = [UIFont systemFontOfSize:18];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.text = name_;
    //夹杂业务逻辑
    if ([name_ isEqualToString:@"我的内容"]) {
        nameLabel.textColor = [UIColor redColor];
    }
    [cell addSubview:nameLabel];
    
    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 35, SCREEN_WIDTH - 20, 0)];
    contentLabel.font = [UIFont systemFontOfSize:15];
    contentLabel.numberOfLines = 0;
    contentLabel.textColor = [UIColor blackColor];
    contentLabel.text = content_;
    [contentLabel sizeToFit];
    [cell addSubview:contentLabel];
    
    UIButton *likeButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 50, 12.5, 40, 15)];
    likeButton.titleLabel.textColor = [UIColor blackColor];
    [likeButton setTitle:@"like" forState:UIControlStateNormal];
    likeButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [likeButton addTarget:self action:@selector(likeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    likeButton.backgroundColor = [UIColor grayColor];
    [cell addSubview:likeButton];
    
    UIImageView *line = [[UIImageView alloc]initWithFrame:CGRectMake(0, contentLabel.frame.origin.y + contentLabel.frame.size.height + 9, SCREEN_WIDTH, 1)];
    line.backgroundColor = [UIColor blackColor];
    [cell addSubview:line];
    
    return cell;
}

- (void)likeButtonClick:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"like"]) {
        if ([[MockNetWorkManager shareManager] like:btn.titleLabel.text]) {
            [btn setTitle:@"unLike" forState:UIControlStateNormal];
        }
    }else{
        if ([[MockNetWorkManager shareManager] unLike:btn.titleLabel.text]) {
            [btn setTitle:@"like" forState:UIControlStateNormal];
        }
    }
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
    CGRect rect = [content boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 20, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:contentFont} context:nil];
    return rect.size.height;
}

@end
