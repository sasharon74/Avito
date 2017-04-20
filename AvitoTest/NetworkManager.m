//
//  NetworkManager.m
//  AvitoTest
//
//  Created by Alex on 20.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "NetworkManager.h"

#import "UsersRequest.h"
#import "UsersResponse.h"

#import "MediaItemsRequest.h"
#import "MediaItemsResponse.h"

#import "APIClient.h"

@implementation NetworkManager

+ (NetworkManager *)sharedInstance {
    
    static dispatch_once_t pred;
    static NetworkManager *shared = nil;
    dispatch_once (&pred, ^{
        shared = [[NetworkManager alloc] init];
    });
    return shared;
}

- (void)getUsersByText:(NSString *)text
                  onSuccess:(successCallBack)success
                  onFailure:(failureCallBack)failure{
    
    UsersRequest *userRequest = [[UsersRequest alloc]init];
    [userRequest setSearchStringAttribute:text];
    
    [[APIClient sharedInstance]getItems:^(UsersResponse * response) {
        
        if (response.error){
            if (failure){
                failure();
            }
        }
        
        if (success){
            success(response.users);
        }
        
    } withAPIRequest:userRequest];

}

- (void)getMediaItemsByText:(NSString *)text
                       onSuccess:(successCallBack)success
                       onFailure:(failureCallBack)failure{
    
    MediaItemsRequest *itemsRequest = [[MediaItemsRequest alloc]init];
    [itemsRequest setSearchStringAttribute:text];
    
    [[APIClient sharedInstance]getItems:^(MediaItemsResponse *response) {
        
        if (response.error){
            if (failure){
                failure();
            }
        }
        
        if (success){
            success(response.items);
        }
    
    } withAPIRequest:itemsRequest];
}

@end
