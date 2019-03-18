//
//  Message.h
//  01-QQ聊天布局
//
//  Created by brucewang on 2019/3/18.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    
    MessageTypeMe = 0,  // 自己发的
    MessageTypeOther    // 别人发的
    
} MessageType;

@interface Message : NSObject

/**
 聊天内容
 */
@property (nonatomic, strong) NSString * text;

/**
 发送时间
 */
@property (nonatomic, strong) NSString * time;

/**
 消息类型
 */
@property (nonatomic, assign) MessageType type;

+ (instancetype)messageWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
