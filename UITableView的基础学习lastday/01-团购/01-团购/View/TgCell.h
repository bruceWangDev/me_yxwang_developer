//
//  TgCell.h
//  01-团购
//
//  Created by brucewang on 2019/3/13.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Tg;

@interface TgCell : UITableViewCell

/**
 团购模型
 */
@property (nonatomic, strong) Tg * tg;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
