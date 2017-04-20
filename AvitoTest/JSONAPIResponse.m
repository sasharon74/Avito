//
//  JSONAPIResponse.m
//  AvitoTest
//
//  Created by Alex on 14.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "JSONAPIResponse.h"

@implementation JSONAPIResponse

- (id)processResponseObject:(NSError *__autoreleasing *)error{
    
    if (![self.responseObject isKindOfClass:[NSData class]]) return nil;
    
    NSError *serializationError;
    id processedResponseObject = [NSJSONSerialization JSONObjectWithData:self.responseObject
                                                                 options:0
                                                                   error:&serializationError];
    //if (error) *error = serializationError;
    return processedResponseObject;
}

@end
