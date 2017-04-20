//
//  SimpleAPIResponse.m
//  AvitoTest
//
//  Created by Alex on 14.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "SimpleAPIResponse.h"

@interface SimpleAPIResponse ()

@property (nonatomic, copy) NSURLSessionDataTask    *task;
@property (nonatomic, copy) NSURLResponse           *response;
@property (nonatomic, copy) NSError                 *error;
@property (nonatomic, strong) id                    responseObject;
@property (nonatomic, strong) id                    processedResponseObject;

@end

@implementation SimpleAPIResponse

- (instancetype)initWithTask:(NSURLSessionDataTask *)task
                    response:(NSURLResponse *)response
              responseObject:(id)responseObject
                       error:(NSError *)error{
    self = [super init];
    if (self){
        _task           = task;
        _response       = response;
        _error          = error;
        _responseObject = responseObject;
        
        if (!error) {
            NSError *serializationError;
            _processedResponseObject = [self processResponseObject:&serializationError];
            if (serializationError) {
                _error = serializationError;
            }
        }
    }
    return self;
}

- (id)processResponseObject:(NSError *__autoreleasing *)error{
    
    return  self.responseObject;
}

@end
