//
//  Message.m
//  01-QQ聊天布局
//
//  Created by brucewang on 2019/3/18.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "Message.h"

@implementation Message

+ (instancetype)messageWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
    
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self == [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        
    }
    return self;
}

@end
