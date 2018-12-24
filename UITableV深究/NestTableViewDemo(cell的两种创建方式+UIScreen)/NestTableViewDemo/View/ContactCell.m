//
//  ContactCell.m
//  NestTableViewDemo
//
//  Created by brucewang on 2018/12/24.
//  Copyright © 2018 brucewang. All rights reserved.
//

#import "ContactCell.h"

@implementation ContactCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.backgroundColor = [UIColor orangeColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
