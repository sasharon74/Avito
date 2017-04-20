//
//  UIImageView+Network.m
//  AvitoTest
//
//  Created by Alex on 18.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "UIImageView+Network.h"

@implementation UIImageView (Network)

- (void)loadImageFromURLString:(NSString *)urlString{

    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *urlImage = [NSURL URLWithString:urlString];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:urlImage completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data){
            UIImage *image = [UIImage imageWithData:data];
            if (!image) return;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setImage:image];
            });
        }
    }];
    [dataTask resume];
}

@end
