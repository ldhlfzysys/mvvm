//
//  MockNetWorkManager.h
//  MVVM
//
//  Created by liudonghuan on 16/4/18.
//  Copyright © 2016年 Dwight. All rights reserved.
//


//这里是一个mock的网络模块单例
#import <Foundation/Foundation.h>

@interface MockNetWorkManager : NSObject
+ (instancetype)shareManager;
- (NSArray *)loadData;
- (NSArray *)loadMoreData;

- (BOOL)like:(NSString *)name;
- (BOOL)unLike:(NSString *)name;
@end
