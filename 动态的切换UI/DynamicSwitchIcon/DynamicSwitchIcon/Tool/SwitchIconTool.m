//
//  SwitchIconTool.m
//  DynamicSwitchIcon
//
//  Created by brucewang on 2018/12/29.
//  Copyright © 2018 brucewang. All rights reserved.
//

#import "SwitchIconTool.h"

@implementation SwitchIconTool

+ (NSString *)getCurrentAppIconName {
    
    if (@available(iOS 10.3, *)) {
        return [UIApplication sharedApplication].alternateIconName.length == 0 ? @"" : [UIApplication sharedApplication].alternateIconName;
    } else {
        // Fallback on earlier versions
        return @"";
    }
}

@end
