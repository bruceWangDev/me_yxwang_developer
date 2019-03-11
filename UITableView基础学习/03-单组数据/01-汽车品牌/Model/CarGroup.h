//
//  CarGroup.h
//  01-汽车品牌
//
//  Created by brucewang on 2019/3/11.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CarGroup : NSObject

/**
 头部标题
 */
@property (nonatomic, strong) NSString * title;

/**
 尾部标题
 */
@property (nonatomic, strong) NSString * desc;

/**
 这组的所有车(字符串)
 */
@property (nonatomic, strong) NSArray * cars;

@end

NS_ASSUME_NONNULL_END
