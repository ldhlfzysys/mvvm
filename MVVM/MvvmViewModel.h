//
//  MvvmViewModel.h
//  MVVM
//
//  Created by liudonghuan on 16/4/18.
//  Copyright © 2016年 Dwight. All rights reserved.
//

/*
 View-Model的工作
 -网络请求
 -业务逻辑
 -数据持久化
 */

/*
 View-Model不做的事
 -对视图控制器直接起作用或通告其变化
 */


#import <Foundation/Foundation.h>
#import "MvvmModel.h"

@interface MvvmViewModel : NSObject
@property(nonatomic,strong,readonly) NSMutableArray *datas;
@property(nonatomic,strong,readonly) NSMutableArray *cellHeights;
@property(nonatomic,assign,readonly) BOOL allowLoadMore;

- (void)loadFromNetWork;
- (void)loadMoreFromNetWork;
- (void)likeButtonClick:(NSIndexPath *)indexPath;

@end
