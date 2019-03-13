//
//  Tg.h
//  01-团购
//
//  Created by brucewang on 2019/3/13.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tg : NSObject

/**
 标题
 */
@property (nonatomic, strong) NSString * title;

/**
 图片
 */
@property (nonatomic, strong) NSString * icon;

/**
 价格
 */
@property (nonatomic, strong) NSString * price;

/**
 购买人数
 */
@property (nonatomic, strong) NSString * buyCount;

+ (instancetype)tgWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
