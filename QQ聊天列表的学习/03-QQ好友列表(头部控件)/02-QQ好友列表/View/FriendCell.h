//
//  FriendCell.h
//  02-QQ好友列表
//
//  Created by brucewang on 2019/3/19.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Friend;

@interface FriendCell : UITableViewCell

+ (FriendCell *)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) Friend * fd;

@end

NS_ASSUME_NONNULL_END
