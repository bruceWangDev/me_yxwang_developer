//
//  Contact.h
//  NestTableViewDemo
//
//  Created by brucewang on 2018/12/21.
//  Copyright © 2018 brucewang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 联系人模型
 */
@interface Contact : NSObject

/**
 姓
 */
@property (nonatomic, strong) NSString * fristName;

/**
 名
 */
@property (nonatomic, strong) NSString * lastName;

/**
 手机号码
 */
@property (nonatomic, strong) NSString * phoneNumber;

/**
 带参数的构造函数

 @param fristName   姓
 @param lastName    名
 @param phoneNumber 手机号码
 @return Contact 对象
 */
- (Contact *)initWithFirstName:(NSString *)fristName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber;

/**
 get 方法

 @return 返回姓名
 */
- (NSString *)getName;

/**
 静态初始化方法

 @param fristName   姓
 @param lastName    名
 @param phoneNumber 手机号码
 @return Contact 对象
 */
+ (Contact *)initWithFirstName:(NSString *)fristName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber;

@end

NS_ASSUME_NONNULL_END
