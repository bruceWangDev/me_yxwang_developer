//
//  MessageFrame.m
//  01-QQ聊天布局
//
//  Created by brucewang on 2019/3/18.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "MessageFrame.h"
#import "Message.h"

@implementation MessageFrame

- (void)setMsg:(Message *)msg {
    
    _msg = msg;
    
    CGFloat padding = 10;
    // 屏幕的宽度
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    // 1.时间
    if (msg.hideTime == NO) { // 显示时间
        CGFloat timeX = 0;
        CGFloat timeY = 0;
        CGFloat timeW = 375;
        CGFloat timeH = 40;
        _timeFrame = CGRectMake(timeX, timeY, timeW, timeH);
    }
    
    // 2.头像
    CGFloat iconX = 0;
    CGFloat iconY = CGRectGetMaxY(_timeFrame) + padding;
    CGFloat iconW = 40;
    CGFloat iconH = 40;
    if (msg.type == MessageTypeOther) { // 别人发的
        iconX = padding;
    } else { // 自己发的
        iconX = screenW - padding - iconW;
    }
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 3.正文
    
    // 文字的尺寸
    CGSize textSize = [self sizeWithText:msg.text font:TEXTFONT maxSize:CGSizeMake(200, MAXFLOAT)];
    
    CGFloat textX = 0;
    CGFloat textY = iconY;
    
    if (msg.type == MessageTypeOther) {
        textX = CGRectGetMaxX(_iconFrame) + padding;
    } else {
        textX = iconX - padding - textSize.width;
    }
    _textFrame = CGRectMake(textX, textY, textSize.width, textSize.height);
//    _textFrame = (CGRect){{textX, textY}, textSize}; // 也可以这样写
    
    // 4.cell 的高度
    CGFloat textMaxY = CGRectGetMaxY(_textFrame);
    CGFloat iconMaxY = CGRectGetMaxY(_iconFrame);
    
    _cellHeight = MAX(textMaxY, iconMaxY) + padding;
    
}

/**
 计算文字的尺寸
 
 需要计算尺寸的文字
 文字的字体
 文字的最大尺寸
 */
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize {
    
    NSDictionary * attr = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}

@end
