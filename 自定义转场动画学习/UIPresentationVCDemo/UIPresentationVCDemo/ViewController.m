//
//  ViewController.m
//  UIPresentationVCDemo
//
//  Created by brucewang on 2019/1/17.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "ViewController.h"
#import "FirstVC.h"
#import "CrossDissolveTransitionAnimalTool.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    
    
}

- (IBAction)pushAtFirstVC:(UIButton *)sender {
    
    FirstVC * firstVC = [self.storyboard instantiateViewControllerWithIdentifier:@"firstVCID"];
    firstVC.modalPresentationStyle = UIModalPresentationFullScreen;
    firstVC.transitioningDelegate  = self;
    [self presentViewController:firstVC animated:YES completion:nil];
    
}

#pragma mark - transitioning Delegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [[CrossDissolveTransitionAnimalTool alloc] init];
    
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [[CrossDissolveTransitionAnimalTool alloc] init];
    
}

@end
