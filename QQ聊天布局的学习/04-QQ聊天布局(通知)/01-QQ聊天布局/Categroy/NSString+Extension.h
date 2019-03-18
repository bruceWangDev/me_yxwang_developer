//
//  NSString+Extension.h
//  01-QQ聊天布局
//
//  Created by brucewang on 2019/3/18.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)

/**
 返回文字的尺寸

 @param font    文字的字体
 @param maxSize 文字的最大尺寸
 @return        文字的尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

@end

NS_ASSUME_NONNULL_END
