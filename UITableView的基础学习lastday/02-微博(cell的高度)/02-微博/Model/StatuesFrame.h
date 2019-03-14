//
//  StatuesFrame.h
//  02-微博
//
//  Created by brucewang on 2019/3/14.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Statues;

/**
 这个模型对象专门用来存放 cell 内部所有的子控件的 frame 数据 + cell 的高度
 */
@interface StatuesFrame : NSObject

/**
 头像的 frame
 */
@property (nonatomic, assign, readonly) CGRect iconFrame;

/**
 姓名的 frame
 */
@property (nonatomic, assign, readonly) CGRect nameFrame;

/**
 vip 图标的 frame
 */
@property (nonatomic, assign, readonly) CGRect vipFrame;

/**
 正文的 frame
 */
@property (nonatomic, assign, readonly) CGRect textFrame;

/**
 配图的 frame
 */
@property (nonatomic, assign, readonly) CGRect pictureFrame;

/**
 cell 的高度
 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;

@property (nonatomic, strong) Statues * statues;

@end

NS_ASSUME_NONNULL_END
