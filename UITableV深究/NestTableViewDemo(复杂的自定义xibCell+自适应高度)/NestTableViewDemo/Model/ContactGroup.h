//
//  ContactGroup.h
//  NestTableViewDemo
//
//  Created by brucewang on 2018/12/21.
//  Copyright © 2018 brucewang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

NS_ASSUME_NONNULL_BEGIN

/**
 联系人分组模型
 */
@interface ContactGroup : NSObject

/**
 分组名称
 */
@property (nonatomic, strong) NSString * groupName;

/**
 分组描述
 */
@property (nonatomic, strong) NSString * groupDetail;

/**
 联系人数组
 */
@property (nonatomic, strong) NSMutableArray * contactArray;

/**
 带参数的构造函数

 @param groupName    分组名称
 @param groupDetail  分组描述
 @param contactArray 联系人数组
 @return ContactGroup 对象
 */
- (ContactGroup *)initWithGroupName:(NSString *)groupName andGroupDetail:(NSString *)groupDetail andContactArray:(NSMutableArray *)contactArray;


/**
 静态初始化方法

 @param groupName    分组名称
 @param groupDetail  分组描述
 @param contactArray 联系人数组
 @return ContactGroup 对象
 */
+ (ContactGroup *)initWithGroupName:(NSString *)groupName andGroupDetail:(NSString *)groupDetail andContactArray:(NSMutableArray *)contactArray;

@end

NS_ASSUME_NONNULL_END
