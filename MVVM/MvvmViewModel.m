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
@end
