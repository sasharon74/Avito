//
//  SimpleAPIResponse.h
//  AvitoTest
//
//  Created by Alex on 14.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

@protocol SimpleAPIResponseProtocol <NSObject>

- (NSURLSessionDataTask *)task;
- (NSURLResponse *)response;
- (NSError *)error;
- (id)responseObject;
- (id)processedResponseObject;

- (instancetype)initWithTask:(NSURLSessionDataTask *)task
                    response:(NSURLResponse *)response
              responseObject:(id)responseObject
                       error:(NSError *)error;

- (id)processResponseObject:(NSError **)error;

@end
