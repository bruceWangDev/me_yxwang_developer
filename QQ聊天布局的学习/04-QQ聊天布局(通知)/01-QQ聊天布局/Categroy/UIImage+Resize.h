//
//  UIImage+Resize.h
//  01-QQ聊天布局
//
//  Created by brucewang on 2019/3/18.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Resize)

/**
 返回一张拉伸过的图片(只拉伸中间一部分，以平铺的形式)

 @param imageName   需要拉伸的图片名称
 @return            拉伸好的图片对象
 */
+ (UIImage *)resizableImage:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
