//
//  FlagView.m
//  PickerView-国旗选择
//
//  Created by brucewang on 2019/9/3.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "FlagView.h"
#import "FlagModel.h"

@interface FlagView ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end

@implementation FlagView

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    
    
}

+ (instancetype)flagViewWithView:(UIView *)view {
    
    if (view == nil) {
        return [[[NSBundle mainBundle] loadNibNamed:@"FlagView" owner:nil options:nil] lastObject];
    } else {
        return (FlagView *)view;
    }
}

- (void)setFlagM:(FlagModel *)flagM {
    
    _flagM = flagM;
    
    _nameLabel.text = flagM.name;
    
    _iconImageView.image = [UIImage imageNamed:flagM.icon];
    
}

+ (CGFloat)flagViewHeight {
    
    return 60.0f;
}

@end
