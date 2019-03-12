//
//  CarGroup.h
//  08-汽车品牌
//
//  Created by brucewang on 2019/3/12.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CarGroup : NSObject

/**
 名称
 */
@property (nonatomic, copy) NSString * title;

/**
 汽车数组 存放所有的汽车品牌
 */
@property (nonatomic, strong) NSArray * cars;

+ (instancetype)groupWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
