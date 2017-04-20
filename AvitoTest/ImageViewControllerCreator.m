//
//  ImageViewControllerCreator.m
//  AvitoTest
//
//  Created by Alex on 20.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "ImageViewControllerCreator.h"
#import "ImageViewController.h"

@implementation ImageViewControllerCreator

+ (UIViewController *)getImageViewControllerWithImage:(UIImage *)image
                                                frame:(CGRect)frame
                                         oldImageView:(UIImageView *)oldImageView{
    
    ImageViewController *imageViewController = [[ImageViewController alloc] initWithImage:image oldImageView:oldImageView];
    imageViewController.view.frame = frame;
    
    imageViewController.transitioningDelegate = imageViewController.customTransitioningDelegateObject;
    imageViewController.modalPresentationStyle = UIModalPresentationCustom;
    
    return imageViewController;
}

@end
