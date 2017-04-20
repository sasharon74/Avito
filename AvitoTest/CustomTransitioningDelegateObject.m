//
//  CustomTransitioningDelegateObject.m
//  AvitoTest
//
//  Created by Alex on 19.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "CustomTransitioningDelegateObject.h"
#import "CustomAnimatedTransitioningObject.h"

@interface CustomTransitioningDelegateObject ()

@property (nonatomic, strong) CustomAnimatedTransitioningObject *customAnimatedTransitioningObject;

@end

@implementation CustomTransitioningDelegateObject

#pragma mark Private methods

- (CustomAnimatedTransitioningObject *)customAnimatedTransitioningObject{
    if (!_customAnimatedTransitioningObject){
        _customAnimatedTransitioningObject = [CustomAnimatedTransitioningObject new];
    }
    return _customAnimatedTransitioningObject;
}

#pragma mark UIViewControllerTransitioningDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    self.customAnimatedTransitioningObject.type = 0;
    return self.customAnimatedTransitioningObject;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    self.customAnimatedTransitioningObject.type = 1;
    return self.customAnimatedTransitioningObject;
}

@end
