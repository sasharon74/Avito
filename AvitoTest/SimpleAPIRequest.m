//
//  SimpleAPIRequest.m
//  AvitoTest
//
//  Created by Alex on 14.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "SimpleAPIRequest.h"
#import "SimpleAPIResponseProtocol.h"

@interface SimpleAPIRequest ()

@property (nonatomic, copy) NSURL *baseURL;
@property (nonatomic, copy) NSString *path;
@property (nonatomic, copy) NSDictionary *parameters;
@property (nonatomic, copy) NSDictionary *headers;
@property (nonatomic)       Class<SimpleAPIResponseProtocol> responseClass;

@end

@implementation SimpleAPIRequest

@end
