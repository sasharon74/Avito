//
//  SimpleAPIProtocol.h
//  AvitoTest
//
//  Created by Alex on 14.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//
@protocol SimpleAPIResponseProtocol;

@protocol SimpleAPIRequestProtocol <NSObject>

- (NSURL *)baseURL;
- (NSString *)path;

- (NSDictionary *)parameters;
- (void)setParameters:(NSDictionary *)parameters;

- (NSDictionary *)headers;
- (Class<SimpleAPIResponseProtocol>)responseClass;

@end
