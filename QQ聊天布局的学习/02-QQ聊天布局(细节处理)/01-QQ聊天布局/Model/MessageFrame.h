//
//  MessageFrame.h
//  01-QQ聊天布局
//
//  Created by brucewang on 2019/3/18.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define TIMEFONT [UIFont systemFontOfSize:13]

#define TEXTFONT [UIFont systemFontOfSize:16]

@class Message;

/**
 frame 模型
 */
@interface MessageFrame : NSObject

/**
 时间的 frame
 */
@property (nonatomic, assign, readonly) CGRect timeFrame;

/**
 头像的 frame
 */
@property (nonatomic, assign, readonly) CGRect iconFrame;

/**
 正文的 frame
 */
@property (nonatomic, assign, readonly) CGRect textFrame;

/**
 cell 的高度
 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;

/**
 数据模型
 */
@property (nonatomic, strong) Message * msg;;

@end

NS_ASSUME_NONNULL_END
