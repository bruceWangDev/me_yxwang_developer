//
//  FlagModel.h
//  PickerView-国旗选择
//
//  Created by brucewang on 2019/9/3.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlagModel : NSObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * icon;

+ (instancetype)flagWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
