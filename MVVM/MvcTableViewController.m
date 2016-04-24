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
    [self.tableView reloadData];
}

//数据加载
- (void)loadDataFromArray:(NSArray *)arr
{
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        MvcModel *model = [[MvcModel alloc]init];
        [model updateFromDict:obj];
        [_datas addObject:model];
    }];
}

//加载更多
- (void)loadMore{
    [_datas addObjectsFromArray:[[MockNetWorkManager shareManager] loadMoreData]];
    [self.tableView reloadData];
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
    //控制器去组合View和Model
    MvcModel *model = [_datas objectAtIndex:indexPath.row];
    cell.nameLabel.text = model.name;
    /*
     视图控制器里的业务逻辑
     */
    if ([model.name isEqualToString:@"我的内容"]) {//这个很low，这就是个业务逻辑
        cell.nameLabel.textColor = [UIColor redColor];
    }
    cell.contentLabel.text = model.content;
    [cell.contentLabel sizeToFit];
    
    [cell setLikeBlock:^(UIButton *btn) {
        if ([btn.titleLabel.text isEqualToString:@"like"]) {
            [btn setTitle:@"unLike" forState:UIControlStateNormal];
        }else{
            [btn setTitle:@"like" forState:UIControlStateNormal];
        }
    }];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //10、20、5这种，是控件间的间距，我们可以提前知道这些数值
    CGFloat height = 10 + 20 + 5 + [self cellHeightFromData:_datas IndexPath:indexPath] + 10;
    return height;
}

//属于视图和模型间的计算逻辑
- (CGFloat)cellHeightFromData:(NSArray *)data IndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = [data objectAtIndex:indexPath.row];
    NSString *content = [dict objectForKey:@"content"];
    UIFont *contentFont = [UIFont systemFontOfSize:15];
    CGRect rect = [content boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 20, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:contentFont} context:nil];
    return rect.size.height;
}
@end
