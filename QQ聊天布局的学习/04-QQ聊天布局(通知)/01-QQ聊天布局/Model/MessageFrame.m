//
//  MessageFrame.m
//  01-QQ聊天布局
//
//  Created by brucewang on 2019/3/18.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "MessageFrame.h"
#import "Message.h"
#import "NSString+Extension.h"

@implementation MessageFrame

- (void)setMsg:(Message *)msg {
    
    _msg = msg;
    
    // 间距
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
    CGSize textSize = [msg.text sizeWithFont:TEXTFONT maxSize:CGSizeMake(240, MAXFLOAT)];
    
    CGFloat textX = 0;
    CGFloat textY = iconY;
    
    CGSize textBtnSize = CGSizeMake(textSize.width + TEXTPADDING * 2, textSize.height + TEXTPADDING * 2);
    
    if (msg.type == MessageTypeOther) {
        textX = CGRectGetMaxX(_iconFrame) + padding;
    } else {
        textX = iconX - padding - textBtnSize.width;
    }
    _textFrame = CGRectMake(textX, textY, textBtnSize.width, textBtnSize.height);
    
    // 4.cell 的高度
    CGFloat textMaxY = CGRectGetMaxY(_textFrame);
    CGFloat iconMaxY = CGRectGetMaxY(_iconFrame);
    
    _cellHeight = MAX(textMaxY, iconMaxY) + padding;
    
}

@end
