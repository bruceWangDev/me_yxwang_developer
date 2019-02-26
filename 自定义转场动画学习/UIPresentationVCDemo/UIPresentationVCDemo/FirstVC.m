//
//  FirstVC.m
//  UIPresentationVCDemo
//
//  Created by brucewang on 2019/1/17.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "FirstVC.h"

@interface FirstVC ()

@end

@implementation FirstVC

- (void)viewDidLoad {

    [super viewDidLoad];
    
    
    
}

- (IBAction)backAtHome:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
