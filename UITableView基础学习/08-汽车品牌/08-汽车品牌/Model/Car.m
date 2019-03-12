//
//  Car.m
//  08-汽车品牌
//
//  Created by brucewang on 2019/3/12.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "Car.h"

@implementation Car

+ (instancetype)carWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
    
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        
    }
    
    return self;
    
}

@end
