//
//  Hero.h
//  04-英雄展示
//
//  Created by brucewang on 2019/3/11.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Hero : NSObject

@property (nonatomic, strong) NSString * name;

@property (nonatomic, strong) NSString * icon;

@property (nonatomic, strong) NSString * intro;

+ (instancetype)heroWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
