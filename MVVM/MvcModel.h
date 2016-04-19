//
//  MvcModel.h
//  MVVM
//
//  Created by liudonghuan on 16/4/18.
//  Copyright © 2016年 Dwight. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MvcModel : NSObject
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *content;
- (void)updateFromDict:(NSDictionary *)dict;
@end
