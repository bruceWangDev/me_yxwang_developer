//
//  Person.m
//  04-通知中心
//
//  Created by brucewang on 2019/3/18.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "Person.h"
#import "NewCompany.h"

@implementation Person

- (void)newsCompany:(NSNotification *)note {
    
    NewCompany * obj = note.object;
    
    NSLog(@"%@ 收到了通知 _ note %@", self.name, note.userInfo);
    
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

@end
