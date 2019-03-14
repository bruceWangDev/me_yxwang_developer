//
//  StatuesFrame.m
//  02-微博
//
//  Created by brucewang on 2019/3/14.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "StatuesFrame.h"
#import "Statues.h"

#define NAMEFONT [UIFont systemFontOfSize:15]
#define TEXTFONT [UIFont systemFontOfSize:16]

@implementation StatuesFrame

/**
 计算文字的大小
 
 @param text    需要计算尺寸的文字
 @param font    文字的字体
 @param maxSize 文字的最大尺寸
 @return        size
 */
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize {
    
    NSDictionary * atts = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:atts context:nil].size;
}

- (void)setStatues:(Statues *)statues {
    
    _statues = statues;
    
    // 子控件之间的间距
    CGFloat padding = 10;
    
    // 1、头像
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 2.昵称
    CGSize nameSize = [self sizeWithText:self.statues.name font:NAMEFONT maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    
    CGFloat nameX = CGRectGetMaxX(_iconFrame) + padding;
    CGFloat nameY = (iconY + iconH - nameSize.height) * 0.5;
    _nameFrame = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    
    // 3.会员图标
    CGFloat vipX = CGRectGetMaxX(_nameFrame) + padding;
    CGFloat vipY = nameY;
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    _vipFrame = CGRectMake(vipX, vipY, vipW, vipH);
    
    // 4.正文
    CGSize textSize = [self sizeWithText:self.statues.text font:TEXTFONT maxSize:CGSizeMake(350, MAXFLOAT)];
    
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_iconFrame) + padding;
    _textFrame = CGRectMake(textX, textY, textSize.width, textSize.height);
    
    // 5.配图
    if (self.statues.picture) { // 有配图
        CGFloat pictureX = textX;
        CGFloat pictureY = CGRectGetMaxY(_textFrame) + padding;
        CGFloat pictureW = 100;
        CGFloat pictureH = 100;
        _pictureFrame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
        _cellHeight = CGRectGetMaxY(self.pictureFrame) + padding;
    } else {
        _cellHeight = CGRectGetMaxY(self.textFrame) + padding;
    }
}

@end
