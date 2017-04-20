//
//  NetworkManager.h
//  AvitoTest
//
//  Created by Alex on 20.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^successCallBack)(NSArray *array);
typedef void(^failureCallBack)();

@interface NetworkManager : NSObject

+ (NetworkManager *)sharedInstance;

- (void)getUsersByText:(NSString *)text
                  onSuccess:(successCallBack)success
                  onFailure:(failureCallBack)failure;


- (void)getMediaItemsByText:(NSString *)text
                       onSuccess:(successCallBack)success
                       onFailure:(failureCallBack)failure;

@end
