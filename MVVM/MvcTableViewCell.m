//
//  MvcTableViewCell.m
//  MVVM
//
//  Created by liudonghuan on 16/4/18.
//  Copyright © 2016年 Dwight. All rights reserved.
//

#import "MvcTableViewCell.h"

@implementation MvcTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, self.frame.size.width - 20, 20)];
        _nameLabel.font = [UIFont systemFontOfSize:18];
        _nameLabel.textColor = [UIColor blackColor];
        [self addSubview:_nameLabel];
        
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 35, self.frame.size.width - 20, 0)];
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = [UIColor blackColor];
        [self addSubview:_nameLabel];
        
        _line = [[UIImageView alloc]initWithFrame:CGRectMake(0, _contentLabel.frame.origin.y + _contentLabel.frame.size.height + 9, self.frame.size.width, 1)];
        _line.backgroundColor = [UIColor blackColor];
        [self addSubview:_line];
    }
    return self;
}

@end
