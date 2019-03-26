//
//  HeadView.h
//  02-QQ好友列表
//
//  Created by brucewang on 2019/3/19.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FriendGroup, HeadView;

@protocol HeadViewDelegate <NSObject>

@optional

- (void)headViewDidClickedName:(HeadView *)headView;

@end

@interface HeadView : UITableViewHeaderFooterView

+ (HeadView *)headViewWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) FriendGroup * fg;

@property (nonatomic, weak) id <HeadViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
