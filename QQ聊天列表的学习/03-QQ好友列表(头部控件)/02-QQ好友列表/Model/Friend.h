//
//  Friend.h
//  02-QQ好友列表
//
//  Created by brucewang on 2019/3/19.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Friend : NSObject

@property (nonatomic, strong) NSString * name;

@property (nonatomic, strong) NSString * icon;

@property (nonatomic, strong) NSString * intro;

// 学习到了 get 方法的写法
@property (nonatomic, assign, getter = isVip) BOOL vip;

+ (instancetype)friendWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
