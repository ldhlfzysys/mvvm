//
//  MvvmTableViewController.m
//  MVVM
//
//  Created by liudonghuan on 16/4/18.
//  Copyright © 2016年 Dwight. All rights reserved.
//

#import "MvvmTableViewController.h"
#import "MvvmTableViewCell.h"
#import "MvvmViewModel.h"

@interface MvvmTableViewController ()
@property (nonatomic,strong)MvvmViewModel *viewModel;
@end

@implementation MvvmTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewModel = [[MvvmViewModel alloc]init];
    //ReactiveCocoa,在不同情况下，我们需要用到不同的通知方式，而ReactiveCocoa就是各种方式的一种集合
    [_viewModel addObserver:self forKeyPath:@"datas" options:NSKeyValueObservingOptionNew context:nil];
    [_viewModel loadFromNetWork];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(RowDidChange:) name:@"RowDidChange" object:nil];
    
}

#pragma mark - signal (ReactiveCocoa、(Delegate、Block、Target、KVO、Notification))
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"datas"]) {
        [self.tableView reloadData];
    }
}

- (void)RowDidChange:(NSNotification *)noti
{
    NSIndexPath *indexpath = [noti object];
    [self.tableView reloadRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationLeft];
}

#pragma mark - UserActions
- (void)loadMore{
    [_viewModel loadMoreFromNetWork];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _viewModel.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MvvmTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mCell"];
    if (!cell) {
        cell = [[MvvmTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mCell"];
    }
    [cell setupData:[_viewModel.datas objectAtIndex:indexPath.row]];
    [cell setLikeBlock:^{
        [_viewModel likeButtonClick:indexPath];
    }];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [MvvmTableViewCell heightOfData:[_viewModel.datas objectAtIndex:indexPath.row]];
}


@end
