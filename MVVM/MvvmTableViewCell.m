//
//  MvvmTableViewCell.m
//  MVVM
//
//  Created by liudonghuan on 16/4/18.
//  Copyright © 2016年 Dwight. All rights reserved.
//

#import "MvvmTableViewCell.h"

@implementation MvvmTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH - 20, 20)];
        _nameLabel.font = [UIFont systemFontOfSize:18];
        _nameLabel.textColor = [UIColor blackColor];
        [self addSubview:_nameLabel];
        
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 35, SCREEN_WIDTH - 20, 0)];
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = [UIColor blackColor];
        [self addSubview:_contentLabel];
        
        _likeButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 50, 12.5, 40, 15)];
        [_likeButton setTitle:@"like" forState:UIControlStateNormal];
        _likeButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_likeButton addTarget:self action:@selector(likeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _likeButton.backgroundColor = [UIColor grayColor];
        [self addSubview:_likeButton];
        
        _line = [[UIImageView alloc]init];
        _line.backgroundColor = [UIColor blackColor];
        [self addSubview:_line];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


- (void)likeButtonClick:(UIButton *)btn{
    _likeBlock();
}

- (void)setupData:(id)object
{
    if ([object respondsToSelector:@selector(name)]) {
        NSString *name = [object performSelector:@selector(name) withObject:nil];
        _nameLabel.text = name;
        if ([name isEqualToString:@"我的内容"]) {
            _nameLabel.textColor = [UIColor redColor];
        }else{
            _nameLabel.textColor = [UIColor blackColor];
        }
    }
    if ([object respondsToSelector:@selector(content)]) {
        NSString *content = [object performSelector:@selector(content) withObject:nil];
        _contentLabel.text = content;
        CGRect rect = [content boundingRectWithSize:CGSizeMake(_contentLabel.frame.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_contentLabel.font} context:nil];
        CGRect originframe = _contentLabel.frame;
        originframe.size.height = rect.size.height;
        _contentLabel.frame = originframe;
    }
    _line.frame = CGRectMake(0, _contentLabel.frame.origin.y + _contentLabel.frame.size.height + 9, SCREEN_WIDTH, 1);

    [_line setNeedsDisplay];
    
    if ([object respondsToSelector:@selector(likeStatus)]) {
        BOOL status = [object performSelector:@selector(likeStatus) withObject:nil];
        if (status) {
            [_likeButton setTitle:@"unLike" forState:UIControlStateNormal];
        }else{
            [_likeButton setTitle:@"like" forState:UIControlStateNormal];
        }
    }
}

+ (float)heightOfData:(id)object
{
    float height = 10 + 20 + 5 + 10;
    
    if ([object respondsToSelector:@selector(content)]) {
        NSString *content = [object performSelector:@selector(content) withObject:nil];
        CGRect rect = [content boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 20, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
        height += rect.size.height;
    }
    
    
    return height;
}
@end
