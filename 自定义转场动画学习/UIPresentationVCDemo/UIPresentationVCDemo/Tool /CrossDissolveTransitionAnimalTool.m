//
//  CrossDissolveTransitionAnimalTool.m
//  UIPresentationVCDemo
//
//  Created by brucewang on 2019/1/17.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "CrossDissolveTransitionAnimalTool.h"

@implementation CrossDissolveTransitionAnimalTool

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.35; // 顾名思义 应该是动画时间
    
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController * fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController * toViewController   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView * containerView = transitionContext.containerView;

    UIView * fromView;
    UIView * toView;
    
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView   = [transitionContext viewForKey:UITransitionContextToViewKey];
    } else {
        fromView = fromViewController.view;
        toView   = toViewController.view;
    }
    
    fromView.frame = [transitionContext initialFrameForViewController:fromViewController];
    toView.frame   = [transitionContext finalFrameForViewController:toViewController];
    
    fromView.alpha = 1.0f;
    toView.alpha   = 0.0f;
    
    [containerView addSubview:toView];
    
    NSTimeInterval transitionDuration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:transitionDuration animations:^{
        
        fromView.alpha = 0.0f;
        toView.alpha   = 1.0;
        
    } completion:^(BOOL finished) {
       
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!wasCancelled];
        
    }];
    
}

@end
