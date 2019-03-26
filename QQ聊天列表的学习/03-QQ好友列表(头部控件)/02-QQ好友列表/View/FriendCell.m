//
//  FriendCell.m
//  02-QQ好友列表
//
//  Created by brucewang on 2019/3/19.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "FriendCell.h"
#import "Friend.h"

@implementation FriendCell

+ (FriendCell *)cellWithTableView:(UITableView *)tableView {
    
    static NSString * ID = @"header";
    FriendCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[FriendCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
    
}

- (void)setFd:(Friend *)fd {
    
    _fd = fd;
    
    self.imageView.image = [UIImage imageNamed:fd.icon];
    
    self.textLabel.text  = fd.name;
    self.textLabel.textColor = fd.isVip ? [UIColor orangeColor] : [UIColor blackColor];
    
    self.detailTextLabel.text = fd.intro;
    
}

@end
