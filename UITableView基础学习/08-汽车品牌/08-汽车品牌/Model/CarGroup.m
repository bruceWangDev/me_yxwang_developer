//
//  CarGroup.m
//  08-汽车品牌
//
//  Created by brucewang on 2019/3/12.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "CarGroup.h"
#import "Car.h"

@implementation CarGroup

+ (instancetype)groupWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
    
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self == [super init]) {
        
        /*
        [self setValuesForKeysWithDictionary:dict];
        self.title = dict[@"title"];
         
         setValuesForKeysWithDictionary 就相当于下面那句 self.title = dict[@"title"];
         快速赋值
         */
        
        self.title = dict[@"title"];
        
        // 取出原来的字典数组
        NSArray * dicArray = dict[@"cars"];
        NSMutableArray * carArray = [[NSMutableArray alloc] init];
        for (NSDictionary * dict in dicArray) {
            Car * car = [Car carWithDict:dict];
            [carArray addObject:car];
        }
        self.cars = carArray;
    }
    return self;
}

@end
