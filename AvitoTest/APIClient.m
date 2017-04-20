//
//  APIClient.m
//  AvitoTest
//
//  Created by Alex on 15.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "APIClient.h"
#import "UsersResponse.h"

#import "NSURL+Addition.h"
#import "NSURLRequest+Addition.h"
#import "SimpleAPIRequestProtocol.h"
#import "SimpleAPIResponseProtocol.h"

@interface APIClient ()

@end

@implementation APIClient

+ (APIClient *)sharedInstance {
    
    static dispatch_once_t pred;
    static APIClient *shared = nil;
    dispatch_once (&pred, ^{
        shared = [[APIClient alloc] init];
    });
    return shared;
}

- (void)getItems:(APIResponseBlock)itemsResponse withAPIRequest:(id<SimpleAPIRequestProtocol>)apiRequest{
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURL *urlUsers = [NSURL urlWithString:apiRequest.path
                                   baseURL:apiRequest.baseURL
                                parameters:apiRequest.parameters];
    
    NSURLRequest *userRequest = [NSURLRequest requestWithurl:urlUsers
                                                     headers:apiRequest.headers];
    __block NSURLSessionDataTask *dataTask;
    dataTask = [session dataTaskWithRequest:userRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        Class responseClass = apiRequest.responseClass;
        id <SimpleAPIResponseProtocol> responseObject = [[responseClass alloc]initWithTask:dataTask
                                                                                  response:response
                                                                            responseObject:data
                                                                                     error:error];
        
        if (itemsResponse){
            itemsResponse(responseObject);
        }
    }];
    
    [dataTask resume];
}

//- (void)cancelTasks {
//    [[NSURLSession sharedSession] getTasksWithCompletionHandler:^(NSArray *dataTasks, NSArray *uploadTasks, NSArray *downloadTasks) {
//        if (!dataTasks || !dataTasks.count) {
//            return;
//        }
//        for (NSURLSessionTask *task in dataTasks) {
//            [task cancel];
//        }
//    }];
//}

@end
