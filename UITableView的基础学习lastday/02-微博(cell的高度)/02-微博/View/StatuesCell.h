//
//  StatuesCell.h
//  02-微博
//
//  Created by brucewang on 2019/3/14.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class StatuesFrame;

@interface StatuesCell : UITableViewCell

@property (nonatomic, strong) StatuesFrame * statuesFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
