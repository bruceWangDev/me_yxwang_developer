//
//  FriendGroup.h
//  02-QQ好友列表
//
//  Created by brucewang on 2019/3/19.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FriendGroup : NSObject

/**
 标识这组是否需要展开
 */
@property (nonatomic, assign, getter = isOpend) BOOL opend;

@property (nonatomic, strong) NSString * name;

@property (nonatomic, assign) int online;

/**
 数组中装的都是 Friend 模型
 */
@property (nonatomic, strong) NSArray * friends;

+ (instancetype)groupWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
