//
//  NSURLRequest+Addition.m
//  AvitoTest
//
//  Created by Alex on 15.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "NSURLRequest+Addition.h"

@implementation NSURLRequest (Addition)

+ (NSURLRequest *)requestWithurl:(NSURL *)url
                            headers:(NSDictionary *)headers;
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    for (NSString *key in headers) {
        [request setValue:headers[key] forHTTPHeaderField:key];
    }
    return [request copy];
}


@end
