//
//  Car.h
//  08-汽车品牌
//
//  Created by brucewang on 2019/3/12.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Car : NSObject

/**
 图标
 */
@property (nonatomic, copy) NSString * icon;

/**
 名称
 */
@property (nonatomic, copy) NSString * name;

+ (instancetype)carWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
