//
//  APIClient.h
//  AvitoTest
//
//  Created by Alex on 15.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//
@protocol SimpleAPIRequestProtocol;

typedef void(^APIResponseBlock)(id response);

#import <Foundation/Foundation.h>

@interface APIClient : NSObject

+ (APIClient *)sharedInstance;

- (void)getItems:(APIResponseBlock)itemsResponse withAPIRequest:(id<SimpleAPIRequestProtocol>)apiRequest;

@end
