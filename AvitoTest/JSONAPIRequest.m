//
//  JSONAPIRequest.m
//  AvitoTest
//
//  Created by Alex on 14.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "JSONAPIRequest.h"

@implementation JSONAPIRequest

- (NSDictionary *)headers{
    return @{@"Accept": @"application/json", @"Content-type": @"application/json"};
}

@end
