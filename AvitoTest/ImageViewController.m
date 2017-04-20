//
//  ImageViewController.m
//  AvitoTest
//
//  Created by Alex on 19.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *oldImageView;

@end

@implementation ImageViewController

#pragma mark Initial

- (instancetype)initWithImage:(UIImage *)image oldImageView:(UIImageView *)oldImageView{
    self = [super init];
    if (self) {
        
        _imageView = [[UIImageView alloc] initWithImage:image];
        _imageView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [_imageView addGestureRecognizer:tapGesture];
        
        _oldImageView = oldImageView;
    }
    return self;
}

#pragma mark UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.imageView];

}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.imageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width);
}

#pragma mark TapAction

- (void)handleTap:(UITapGestureRecognizer*)gesture{
    [self dismissViewControllerAnimated:YES completion:^{
        self.oldImageView.alpha = 1.0;
    }];
    
}

#pragma mark Private methods

- (CustomTransitioningDelegateObject *)customTransitioningDelegateObject{
    if (!_customTransitioningDelegateObject){
        _customTransitioningDelegateObject = [CustomTransitioningDelegateObject new];
    }
    return _customTransitioningDelegateObject;
}

@end
