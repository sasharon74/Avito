//
//  NSURLRequest+Addition.h
//  AvitoTest
//
//  Created by Alex on 15.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLRequest (Addition)

+ (NSURLRequest *)requestWithurl:(NSURL *)url
                         headers:(NSDictionary *)headers;

@end
