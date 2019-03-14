//
//  Statues.h
//  02-微博
//
//  Created by brucewang on 2019/3/13.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 数据模型
 */
@interface Statues : NSObject

@property (nonatomic, strong) NSString * name;

@property (nonatomic, strong) NSString * icon;

@property (nonatomic, strong) NSString * text;

@property (nonatomic, strong) NSString * picture;

@property (nonatomic, assign) BOOL vip;

+ (instancetype)statuesWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
