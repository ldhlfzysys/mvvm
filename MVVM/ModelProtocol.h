//
//  ModelProtocol.h
//  MVVM
//
//  Created by liudonghuan on 16/4/23.
//  Copyright © 2016年 Dwight. All rights reserved.
//

#ifndef ModelProtocol_h
#define ModelProtocol_h


#endif /* ModelProtocol_h */

@protocol MvvmProtocol <NSObject>
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *content;
@property (nonatomic,assign)BOOL likeStatus;
- (void)updateFromDict:(NSDictionary *)dict;


@end