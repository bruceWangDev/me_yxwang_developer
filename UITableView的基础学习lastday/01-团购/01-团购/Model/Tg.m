//
//  Tg.m
//  01-团购
//
//  Created by brucewang on 2019/3/13.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "Tg.h"

@implementation Tg

+ (instancetype)tgWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
    
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
