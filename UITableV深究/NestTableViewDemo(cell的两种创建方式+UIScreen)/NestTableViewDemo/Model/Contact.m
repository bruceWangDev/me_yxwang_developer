//
//  Contact.m
//  NestTableViewDemo
//
//  Created by brucewang on 2018/12/21.
//  Copyright © 2018 brucewang. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (Contact *)initWithFirstName:(NSString *)fristName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber {
    
    if (self = [super init]) {
        _fristName   = fristName;
        _lastName    = lastName;
        _phoneNumber = phoneNumber;
    }
    return self;
}

- (NSString *)getName {
    return [NSString stringWithFormat:@"%@%@",_fristName, _lastName];
}

+ (Contact *)initWithFirstName:(NSString *)fristName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber {
    
    Contact * contact = [[Contact alloc] initWithFirstName:fristName andLastName:lastName andPhoneNumber:phoneNumber];
    return contact;
}

@end
