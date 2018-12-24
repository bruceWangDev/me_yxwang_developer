//
//  ContactGroup.m
//  NestTableViewDemo
//
//  Created by brucewang on 2018/12/21.
//  Copyright © 2018 brucewang. All rights reserved.
//

#import "ContactGroup.h"

@implementation ContactGroup

- (ContactGroup *)initWithGroupName:(NSString *)groupName andGroupDetail:(NSString *)groupDetail andContactArray:(NSMutableArray *)contactArray {
    
    if (self = [super init]) {
        _groupName    = groupName;
        _groupDetail  = groupDetail;
        _contactArray = contactArray;
    }
    return self;
}

+ (ContactGroup *)initWithGroupName:(NSString *)groupName andGroupDetail:(NSString *)groupDetail andContactArray:(NSMutableArray *)contactArray {
    
    ContactGroup * contactGroup = [[ContactGroup alloc] initWithGroupName:groupName andGroupDetail:groupDetail andContactArray:contactArray];
    return contactGroup;
}

@end
