//
//  TgFootView.h
//  01-团购
//
//  Created by brucewang on 2019/3/13.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TgFootView;

/**
 1.协议名称：控件类名 + delegate
 2.代理方法普遍都是 @optional
 3.
 */
@protocol TgFootViewDelegate <NSObject>

- (void)tgFootViewDidClickedLoadBtn:(TgFootView *)tgFootView;

@end

@interface TgFootView : UIView

// 为什么写 id 是因为谁当我的代理都可以
@property (nonatomic, weak) id<TgFootViewDelegate> delegate;

/**
 快速创建一个 footView 对象
 */
+ (instancetype)footView;

@end

NS_ASSUME_NONNULL_END
