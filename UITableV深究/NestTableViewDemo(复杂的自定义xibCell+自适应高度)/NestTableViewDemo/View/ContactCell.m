//
//  ContactCell.m
//  NestTableViewDemo
//
//  Created by brucewang on 2018/12/24.
//  Copyright © 2018 brucewang. All rights reserved.
//

#import "ContactCell.h"

@interface ContactCell ()

@property (weak, nonatomic) IBOutlet UILabel *contactName;

@property (weak, nonatomic) IBOutlet UILabel *contactPhoneNumber;

@end

@implementation ContactCell

#pragma mark - set
- (void)setContact:(Contact *)contact {
    
    _contact          = contact;
    _contactName.text = [NSString stringWithFormat:@"%@%@", _contact.fristName, _contact.lastName];
    _contactPhoneNumber.text = _contact.phoneNumber;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.backgroundColor             = [UIColor whiteColor];
    self.contactName.backgroundColor = [UIColor whiteColor];
    self.contactPhoneNumber.backgroundColor = [UIColor whiteColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
