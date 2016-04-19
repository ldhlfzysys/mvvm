//
//  MvvmViewModel.m
//  MVVM
//
//  Created by liudonghuan on 16/4/18.
//  Copyright © 2016年 Dwight. All rights reserved.
//

#import "MvvmViewModel.h"

@implementation MvvmViewModel
- (instancetype)init
{
    if (self = [super init]) {
        _datas = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)loadFromNetWork
{
    NSArray *datas = [[MockNetWorkManager shareManager] loadData];
    [self loadDataFromArray:datas];
    
}

- (void)loadMoreFromNetWork
{
     NSArray *datas = [[MockNetWorkManager shareManager] loadMoreData];
    [self loadDataFromArray:datas];
}

- (void)loadDataFromArray:(NSArray *)arr
{
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        MvvmModel *model = [[MvvmModel alloc]init];
        [model updateFromDict:obj];
        [[self mutableArrayValueForKey:@"datas"] addObject:model];
    }];
}

- (void)likeButtonClick:(NSIndexPath *)indexPath
{
    MvvmModel *model = [_datas objectAtIndex:indexPath.row];
    //发起赞的网络请求、统计、处理接收到的数据。
    model.likeStatus = !model.likeStatus;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RowDidChange" object:indexPath];
}
@end
