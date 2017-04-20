//
//  ImageViewController.h
//  AvitoTest
//
//  Created by Alex on 19.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomTransitioningDelegateObject.h"

@interface ImageViewController : UIViewController

- (instancetype)initWithImage:(UIImage *)image oldImageView:(UIImageView *)oldImageView;

@property (strong, nonatomic) CustomTransitioningDelegateObject *customTransitioningDelegateObject;

@end
