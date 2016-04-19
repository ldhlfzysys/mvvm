//
//  MvcModel.m
//  MVVM
//
//  Created by liudonghuan on 16/4/18.
//  Copyright © 2016年 Dwight. All rights reserved.
//

#import "MvcModel.h"

@implementation MvcModel
- (void)updateFromDict:(NSDictionary *)dict
{
    self.name = [dict objectForKey:@"name"];
    self.content = [dict objectForKey:@"content"];
}
@end
