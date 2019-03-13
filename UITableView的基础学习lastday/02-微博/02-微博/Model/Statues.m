//
//  Statues.m
//  02-微博
//
//  Created by brucewang on 2019/3/13.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "Statues.h"

@implementation Statues

+ (instancetype)statuesWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
    
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict]; // 如果有未定义的 key 会 crash
    }
    return self;
}

@end
