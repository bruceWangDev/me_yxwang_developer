//
//  StatuesCell.m
//  02-微博
//
//  Created by brucewang on 2019/3/14.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "StatuesCell.h"
#import "Statues.h"
#import "StatuesFrame.h"

#define NAMEFONT [UIFont systemFontOfSize:15]
#define TEXTFONT [UIFont systemFontOfSize:16]

@interface StatuesCell ()

@property (nonatomic, weak) UIImageView * iconView;

@property (nonatomic, weak) UILabel     * nameLabel;

@property (nonatomic, weak) UIImageView * vipView;

@property (nonatomic, weak) UILabel     * textL;

@property (nonatomic, weak) UIImageView * pictureView;

@end

@implementation StatuesCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString * ID = @"statuesID";
    StatuesCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[StatuesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 1.头像
        UIImageView * iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        _iconView = iconView;
        
        // 2.昵称
        UILabel * nameLabel = [[UILabel alloc] init];
        nameLabel.font = NAMEFONT;
        [self.contentView addSubview:nameLabel];
        _nameLabel = nameLabel;
        
        // 3.会员图标
        UIImageView * vipView = [[UIImageView alloc] init];
        vipView.image  = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:vipView];
        _vipView = vipView;
        
        // 4.正文
        UILabel * textL = [[UILabel alloc] init];
        textL.font = TEXTFONT;
        textL.numberOfLines = 0; // 设置多行
        [self.contentView addSubview:textL];
        _textL = textL;
        
        // 5.配图
        UIImageView * pictureView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureView];
        _pictureView = pictureView;
        
    }
    return self;
}

- (void)setStatuesFrame:(StatuesFrame *)statuesFrame {
    
    _statuesFrame = statuesFrame;
    
    [self settingData];
 
    [self settingFrame];
    
}

- (void)settingData {
    
    Statues * statues = self.statuesFrame.statues;
    
    self.iconView.image = [UIImage imageNamed:statues.icon];
    self.nameLabel.text = statues.name;
    
    if (statues.vip) {
        self.vipView.hidden = NO;
        self.nameLabel.textColor = [UIColor redColor];
    } else {
        self.vipView.hidden = YES;
        self.nameLabel.textColor = [UIColor blackColor];
    }
    
    self.textL.text     = statues.text;
    
    if (statues.picture) {
        self.pictureView.hidden = NO;
        self.pictureView.image = [UIImage imageNamed:statues.picture];
    } else {
        self.pictureView.hidden = YES;
    }

}

- (void)settingFrame {
    
    self.iconView.frame  = _statuesFrame.iconFrame;
    self.nameLabel.frame = _statuesFrame.nameFrame;
    self.vipView.frame   = _statuesFrame.vipFrame;
    self.textL.frame     = _statuesFrame.textFrame;
    if (self.statuesFrame.statues.picture) {
        self.pictureView.frame = _statuesFrame.pictureFrame;
    }

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
