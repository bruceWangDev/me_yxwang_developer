//
//  StatuesCell.m
//  02-微博
//
//  Created by brucewang on 2019/3/14.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "StatuesCell.h"
#import "Statues.h"

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
//        nameLabel.backgroundColor = [UIColor orangeColor];
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
//        textL.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:textL];
        _textL = textL;
        
        // 5.配图
        UIImageView * pictureView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureView];
        _pictureView = pictureView;
        
    }
    return self;
}

// 重写 set 方法
- (void)setStatues:(Statues *)statues {
    
    _statues = statues; // 固定写法
    
    // 在这个方法中设置子控件的 frame 数据和显示数据
    
    [self settingData];
    
    [self settingFrame];
    
}

/**
 设置数据
 */
- (void)settingData {
    
    self.iconView.image = [UIImage imageNamed:self.statues.icon];
    self.nameLabel.text = self.statues.name;
    
    if (self.statues.vip) {
        self.vipView.hidden = NO;
        self.nameLabel.textColor = [UIColor redColor];
    } else {
        self.vipView.hidden = YES;
        self.nameLabel.textColor = [UIColor blackColor];
    }
    
    self.textL.text     = self.statues.text;
    
    if (self.statues.picture) {
        self.pictureView.hidden = NO; // 有配图
        self.pictureView.image = [UIImage imageNamed:self.statues.picture];
    } else { // 没有配图
        self.pictureView.hidden = YES;
    }

    // CUICatalog: Invalid asset name supplied: '(null)' 如果图像名称为空字符串，则会出现此警告
}

/**
 设置 frame
 */
- (void)settingFrame {
    
    // 子控件之间的间距
    CGFloat padding = 10;
    
    // 1、头像
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    self.iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 2.昵称
    CGSize nameSize = [self sizeWithText:self.statues.name font:NAMEFONT maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    
    CGFloat nameX = CGRectGetMaxX(self.iconView.frame) + padding;
    CGFloat nameY = (iconY + iconH - nameSize.height) * 0.5;
    self.nameLabel.frame = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    
    // 3.会员图标
    CGFloat vipX = CGRectGetMaxX(self.nameLabel.frame) + padding;
    CGFloat vipY = nameY;
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    self.vipView.frame = CGRectMake(vipX, vipY, vipW, vipH);
    
    // 4.正文
    CGSize textSize = [self sizeWithText:self.statues.text font:TEXTFONT maxSize:CGSizeMake(350, MAXFLOAT)];
//    NSLog(@"正文的大小好像有点问题 is %@",NSStringFromCGSize(textSize));
    
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(self.iconView.frame) + padding;
    self.textL.frame = CGRectMake(textX, textY, textSize.width, textSize.height);
    
    // 5.配图
    if (self.statues.picture) { // 有配图
        CGFloat pictureX = textX;
        CGFloat pictureY = CGRectGetMaxY(self.textL.frame) + padding;
        CGFloat pictureW = 100;
        CGFloat pictureH = 100;
        self.pictureView.frame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
    }
}

/**
 计算文字的大小

 @param text    需要计算尺寸的文字
 @param font    文字的字体
 @param maxSize 文字的最大尺寸
 @return        size
 */
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize {
    
    // 计算字符串所对应的空间的大小
    NSDictionary * atts = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:atts context:nil].size;
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
