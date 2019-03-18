//
//  NSString+Extension.m
//  01-QQ聊天布局
//
//  Created by brucewang on 2019/3/18.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    
    NSDictionary * attr = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}

@end
