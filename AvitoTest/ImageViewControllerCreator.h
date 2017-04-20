//
//  ImageViewControllerCreator.h
//  AvitoTest
//
//  Created by Alex on 20.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

@import UIKit;

@interface ImageViewControllerCreator : NSObject

+ (UIViewController *)getImageViewControllerWithImage:(UIImage *)image
                                                frame:(CGRect)frame
                                         oldImageView:(UIImageView *)oldImageView;

@end
