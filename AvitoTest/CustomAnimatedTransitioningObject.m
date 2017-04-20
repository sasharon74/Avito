//
//  CustomAnimatedTransitioningObject.m
//  AvitoTest
//
//  Created by Alex on 19.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "CustomAnimatedTransitioningObject.h"

@interface CustomAnimatedTransitioningObject ()

@property (assign, nonatomic) CGPoint initialPointVC;

@end

@implementation CustomAnimatedTransitioningObject

#pragma mark UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    switch (self.type) {
        case 0:{
            
            UIView *contextView = [transitionContext containerView];
            [contextView addSubview:toVC.view];
            
            self.initialPointVC = toVC.view.center;
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
                toVC.view.center = fromVC.view.center;
                
                CGFloat scale = fromVC.view.frame.size.width / toVC.view.frame.size.width;
                
                CGAffineTransform transform = CGAffineTransformMakeScale(scale, scale);
                toVC.view.transform = transform;
            }completion:^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
        }
            
            break;
            
        case 1:{
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
                fromVC.view.transform = CGAffineTransformIdentity;
                fromVC.view.center = self.initialPointVC;
            }completion:^(BOOL finished) {
                [fromVC.view removeFromSuperview];
                [transitionContext completeTransition:YES];
            }];

        }
            
        default:
            break;
    }
}


@end
