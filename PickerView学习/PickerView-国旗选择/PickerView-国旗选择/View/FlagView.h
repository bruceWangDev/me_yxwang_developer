//
//  FlagView.h
//  PickerView-国旗选择
//
//  Created by brucewang on 2019/9/3.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FlagModel;

@interface FlagView : UIView

@property (nonatomic, strong) FlagModel * flagM;

+ (instancetype)flagViewWithView:(UIView *)view;
+ (CGFloat)flagViewHeight;

@end

NS_ASSUME_NONNULL_END
