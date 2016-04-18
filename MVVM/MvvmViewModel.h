//
//  MvvmViewModel.h
//  MVVM
//
//  Created by liudonghuan on 16/4/18.
//  Copyright © 2016年 Dwight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MvvmTableViewCell.h"
#import "MvvmModel.h"

@interface MvvmViewModel : NSObject
@property(nonatomic,strong) NSMutableArray *datas;

- (void)loadFromNetWork;
- (void)loadMoreFromNetWork;
@end
