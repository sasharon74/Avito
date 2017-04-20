//
//  SimpleAPIResponse.h
//  AvitoTest
//
//  Created by Alex on 14.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimpleAPIResponseProtocol.h"

@interface SimpleAPIResponse : NSObject <SimpleAPIResponseProtocol>
{
    NSURLSessionDataTask *_task;
    NSURLResponse *_response;
    NSError *_error;
    id _responseObject;
    id _processedResponseObject;
}
@end
