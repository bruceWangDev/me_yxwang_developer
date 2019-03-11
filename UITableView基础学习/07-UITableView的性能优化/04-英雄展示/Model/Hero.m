//
//  Hero.m
//  04-英雄展示
//
//  Created by brucewang on 2019/3/11.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "Hero.h"

@implementation Hero

+ (instancetype)heroWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
    
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self == [super init]) {
        // setValuesForKeysWithDictionary 字典快速赋值
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
