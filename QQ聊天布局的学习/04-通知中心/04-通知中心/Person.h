//
//  Person.h
//  04-通知中心
//
//  Created by brucewang on 2019/3/18.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

/**
 姓名
 */
@property (nonatomic, strong) NSString * name;

- (void)newsCompany:(NSNotification *)note;

@end

NS_ASSUME_NONNULL_END
