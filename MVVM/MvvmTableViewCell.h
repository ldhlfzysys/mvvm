//
//  MvvmTableViewCell.h
//  MVVM
//
//  Created by liudonghuan on 16/4/18.
//  Copyright © 2016年 Dwight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MvvmModel;
@interface MvvmTableViewCell : UITableViewCell
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *contentLabel;
@property (nonatomic,strong)UIImageView *line;
@property (nonatomic,strong)UIButton *likeButton;
@property (nonatomic,copy) void (^likeBlock)(void);

+ (float)heightOfData:(id)object;
- (void)setupData:(id)object;

@end
