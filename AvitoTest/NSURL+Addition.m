//
//  NSURL+Addition.m
//  AvitoTest
//
//  Created by Alex on 15.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "NSURL+Addition.h"

@implementation NSURL (Addition)

+ (NSURL *)urlWithString:(NSString *)path
                 baseURL:(NSURL *)baseURL
              parameters:(NSDictionary *)parameters{
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:path];
    if (parameters.count > 0) {
        components.queryItems = @[];
        for (NSString *key in parameters) {
            NSString *value = parameters[key];
            NSURLQueryItem *queryItem = [[NSURLQueryItem alloc] initWithName:key value:value];
            components.queryItems = [components.queryItems arrayByAddingObject:queryItem];
        }
    }
    return [components URLRelativeToURL:baseURL];
}

@end
