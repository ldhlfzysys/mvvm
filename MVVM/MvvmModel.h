//
//  MvvmModel.h
//  MVVM
//
//  Created by liudonghuan on 16/4/18.
//  Copyright © 2016年 Dwight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
 存储着姓名和内容的一个Model
*/
@interface MvvmModel : NSObject
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *content;
@property (nonatomic,assign)BOOL likeStatus;
- (void)updateFromDict:(NSDictionary *)dict;
@end
