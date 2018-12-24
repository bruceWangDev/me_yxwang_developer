//
//  ContactCell.h
//  NestTableViewDemo
//
//  Created by brucewang on 2018/12/24.
//  Copyright © 2018 brucewang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

NS_ASSUME_NONNULL_BEGIN

/**
 联系人 cell
 */
@interface ContactCell : UITableViewCell

/**
 联系人模型
 */
@property (nonatomic, strong) Contact * contact;

@end

NS_ASSUME_NONNULL_END
