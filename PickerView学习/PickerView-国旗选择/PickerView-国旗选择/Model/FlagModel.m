//
//  FlagModel.m
//  PickerView-国旗选择
//
//  Created by brucewang on 2019/9/3.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "FlagModel.h"

@implementation FlagModel

+ (instancetype)flagWithDict:(NSDictionary *)dict {

    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
